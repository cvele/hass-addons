# Playnite Web Game DB Updater

> ### Custom Built Images
>
> These add-ons use custom-built images hosted on our GitHub Container Registry because the official Playnite images are not currently built for multiple architectures. As soon as the official Playnite images support multiple architectures, the add-ons will be updated to include the official images.

> ### Future Plans for Official Add-ons
>
> The official Playnite Web repository by Andrew Codes has plans to release these add-ons, as noted in [Issue #319](https://github.com/andrew-codes/playnite-web/issues/319). These custom-built add-ons are provided in the meantime to simplify the setup process explained in the blog post: [Control Playnite from Home Assistant Dashboard](https://blog.cvetic.in.rs/home-automation/control-playnite-home-assistant-dashboard/).
> 
## Description

This Home Assistant add-on allows you to update the Playnite web game database using MQTT and MongoDB. The add-on listens to MQTT messages and updates the MongoDB database accordingly.

## Features

- Connects to an MQTT broker to receive updates.
- Updates a MongoDB database with the received data.
- Configurable via Home Assistant add-on options.
- Supports multiple architectures: `aarch64`, `amd64` and `armv7`

## Installation

1. **Add the Repository**:
   - Go to the Home Assistant web interface.
   - Navigate to **Supervisor** > **Add-on Store**.
   - Click on the three-dot menu and select **Repositories**.
   - Add the repository URL: `https://github.com/cvele/hass-repository`.

2. **Install the Add-on**:
   - Find the "Playnite Web Game DB Updater" add-on in the list.
   - Click on it and then click **Install**.

3. **Configure the Add-on**:
   - Go to the Playnite Web Game DB Updater add-on details page.
   - Click on **Configuration** and set the options as needed.

4. **Start the Add-on**:
   - Click **Start** to launch the add-on.

## Configuration

You can configure the add-on via the Home Assistant UI. Here are the available configuration options:

- **MQTT_HOST**: IP address or hostname of the MQTT broker.
- **MQTT_PORT**: Port of the MQTT broker (default: 1883).
- **MQTT_USERNAME**: Username to access the MQTT broker (optional).
- **MQTT_PASSWORD**: Password to access the MQTT broker (optional).
- **DB_HOST**: IP address or hostname of the MongoDB database.
- **DB_PORT**: Port of the MongoDB database (default: 27017).
- **DB_USERNAME**: Username to access the MongoDB database (optional).
- **DB_PASSWORD**: Password to access the MongoDB database (optional).
- **DEBUG**: Debug level for troubleshooting (default: "game-db-updater/*").

### Example Configuration

```json
{
  "MQTT_HOST": "mqtt.example.com",
  "MQTT_PORT": 1883,
  "MQTT_USERNAME": "user",
  "MQTT_PASSWORD": "password",
  "DB_HOST": "mongodb.example.com",
  "DB_PORT": 27017,
  "DB_USERNAME": "dbuser",
  "DB_PASSWORD": "dbpassword",
  "DEBUG": "game-db-updater/*"
}
