# MongoDB Home Assistant Addon

> Please note that MongoDB version 4.4.18 is the last version with support for the Raspberry Pi 4 architecture.

## Description

This is a Home Assistant addon for running MongoDB. MongoDB is a NoSQL database known for its high performance, high availability, and easy scalability. This addon allows you to run a MongoDB instance within your Home Assistant setup.

## Features

- MongoDB version `4.4.18`
- Supports multiple architectures: `arm64`, `amd64`
- Secure authentication with root user and password
- Exposes MongoDB on port 27017

## Installation

1. **Add the Repository**:
   - Go to the Home Assistant web interface.
   - Navigate to **Supervisor** > **Add-on Store**.
   - Click on the three-dot menu and select **Repositories**.
   - Add the repository URL: `https://github.com/cvele/hass-addons`.

2. **Install the Add-on**:
   - Find the MongoDB add-on in the list.
   - Click on it and then click **Install**.

3. **Configure the Add-on**:
   - Go to the MongoDB add-on details page.
   - Click on **Configuration** and set the options:
     - `MONGO_INITDB_ROOT_USERNAME`: The root username (default: `root`).
     - `MONGO_INITDB_ROOT_PASSWORD`: The root password (default: `example`).

4. **Start the Add-on**:
   - Click **Start** to launch the MongoDB add-on.

## Configuration Options

- **MONGO_INITDB_ROOT_USERNAME**: The username for the root user. Default is `root`.
- **MONGO_INITDB_ROOT_PASSWORD**: The password for the root user. Default is `example`.

## Accessing MongoDB

Once the add-on is running, you can access MongoDB on port 27017. You can use any MongoDB client or integrate it with your applications as needed.

### Example Connection String

```bash
mongodb://root:example@<your-home-assistant-ip>:27017
```

Replace `<your-home-assistant-ip>` with the IP address of your Home Assistant instance.

## Building and Testing the Add-on

### Building the Docker Image

To build the Docker image for this addon, run the following command:

```sh
docker build -t ghcr.io/cvele/hass-mongodb:latest mongodb/
```

### Vulnerability Scanning

We use Trivy to scan the Docker image for vulnerabilities. You can use the provided GitHub Actions workflow to automate this process.

### GitHub Actions Workflows

- Linting: Ensures Dockerfile and scripts are linted on pull requests.
- Building: Builds the Docker image on pull requests.
- Releasing: Builds and publishes the Docker image to GitHub Container Registry on pushes to the main branch.
- Vulnerability Scanning: Scans the Docker image for vulnerabilities using Trivy.

## License

This project is licensed under the MIT License.

## Issues

If you encounter any issues or have feature requests, please open an issue on the GitHub repository.
