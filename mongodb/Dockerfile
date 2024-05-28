FROM ghcr.io/home-assistant/aarch64-base-ubuntu:latest

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN set -eux; \
	groupadd --gid 999 --system mongodb; \
	useradd --uid 999 --system --gid mongodb --home-dir /data/db mongodb; \
	mkdir -p /data/db /data/configdb; \
	chown -R mongodb:mongodb /data/db /data/configdb

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		ca-certificates \
		jq \
		numactl \
	; \
	if ! command -v ps > /dev/null; then \
		apt-get install -y --no-install-recommends procps; \
	fi; \
	rm -rf /var/lib/apt/lists/*

# grab gosu for easy step-down from root (https://github.com/tianon/gosu/releases)
ENV GOSU_VERSION 1.12
# grab "js-yaml" for parsing mongod's YAML config files (https://github.com/nodeca/js-yaml/releases)
ENV JSYAML_VERSION 3.13.1

RUN set -ex; \
	\
	savedAptMark="$(apt-mark showmanual)"; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		wget curl libcurl4 \
	; \
	if ! command -v gpg > /dev/null; then \
		apt-get install -y --no-install-recommends gnupg dirmngr; \
		savedAptMark="$savedAptMark gnupg dirmngr"; \
	elif gpg --version | grep -q '^gpg (GnuPG) 1\.'; then \
# "This package provides support for HKPS keyservers." (GnuPG 1.x only)
		apt-get install -y --no-install-recommends gnupg-curl; \
	fi; \
	rm -rf /var/lib/apt/lists/*; \
	\
	dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
	wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
	wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc"; \
	export GNUPGHOME="$(mktemp -d)"; \
	gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4; \
	gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu; \
	command -v gpgconf && gpgconf --kill all || :; \
	rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc; \
	\
	wget -O /js-yaml.js "https://github.com/nodeca/js-yaml/raw/${JSYAML_VERSION}/dist/js-yaml.js"; \
# TODO some sort of download verification here
	\
	apt-mark auto '.*' > /dev/null; \
	apt-mark manual $savedAptMark > /dev/null; \
    apt-mark manual wget curl libcurl4; \
	apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
	\
# smoke test
	chmod +x /usr/local/bin/gosu; \
	gosu --version; \
	gosu nobody true

RUN mkdir /docker-entrypoint-initdb.d

RUN set -ex; \
	export GNUPGHOME="$(mktemp -d)"; \
	set -- '39BD841E4BE5FB195A65400E6A26B1AE64C3C388'; \
	for key; do \
		gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "$key"; \
	done; \
	mkdir -p /etc/apt/keyrings; \
	gpg --batch --export "$@" > /etc/apt/keyrings/mongodb.gpg; \
	command -v gpgconf && gpgconf --kill all || :; \
	rm -r "$GNUPGHOME"

# https://docs.mongodb.org/master/release-notes/6.0/
ENV MONGO_VERSION r7.0.8
ENV PI_VERSION pi4

# Step 1: Download MongoDB binaries
RUN set -ex; \
    echo "Downloading MongoDB binaries..."; \
    wget -O "/tmp/unofficial-mongodb.ce.${PI_VERSION}.${MONGO_VERSION}.tar.gz" "https://github.com/themattman/mongodb-raspberrypi-binaries/releases/download/${MONGO_VERSION}-rpi-unofficial/mongodb.ce.${PI_VERSION}.${MONGO_VERSION}.tar.gz" || { echo "Failed to download MongoDB binaries"; exit 1; }

# Step 2: Extract MongoDB binaries
RUN set -ex; \
    echo "Extracting MongoDB binaries..."; \
    tar xzvf "/tmp/unofficial-mongodb.ce.${PI_VERSION}.${MONGO_VERSION}.tar.gz" -C /tmp || { echo "Failed to extract MongoDB binaries"; exit 1; }

# Step 3: Move MongoDB binaries
RUN set -ex; \
    echo "Moving MongoDB binaries..."; \
    mv /tmp/mongo /usr/local/bin || { echo "Failed to move mongo binary"; exit 1; }; \
    mv /tmp/mongod /usr/local/bin || { echo "Failed to move mongod binary"; exit 1; }; \
    mv /tmp/mongos /usr/local/bin || { echo "Failed to move mongos binary"; exit 1; }; \
    rm /tmp/README.md || { echo "Failed to remove README.md"; exit 1; }; \
    rm /tmp/LICENSE-Community.txt || { echo "Failed to remove LICENSE-Community.txt"; exit 1; }

# Step 4: Download libstdc++
RUN set -ex; \
    echo "Downloading libstdc++..."; \
    wget -O "/tmp/libstdc++.so.6.0.29" "https://github.com/themattman/raspberrypi-binaries/raw/main/libstdc%2B%2B/libstdc%2B%2B.so.6.0.29" || { echo "Failed to download libstdc++"; exit 1; }

# Step 5: Move and link libstdc++
RUN set -ex; \
    echo "Moving and linking libstdc++..."; \
    mv "/tmp/libstdc++.so.6.0.29" "/usr/local/lib/libstdc++.so.6.0.29" || { echo "Failed to move libstdc++"; exit 1; }; \
    ln -sf "/usr/local/lib/libstdc++.so.6.0.29" "/lib/aarch64-linux-gnu/libstdc++.so.6" || { echo "Failed to create symlink for libstdc++"; exit 1; }

# Final message
RUN echo "Script completed successfully."

VOLUME /data/db /data/configdb

# ensure that if running as custom user that "mongosh" has a valid "HOME"
# https://github.com/docker-library/mongo/issues/524
ENV HOME /data/db

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
