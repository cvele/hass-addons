# Playnite Web App


> ### Custom Built Images
>
> These add-ons use custom-built images hosted on our GitHub Container Registry because the official Playnite images are not currently built for multiple architectures. As soon as the official Playnite images support multiple architectures, the add-ons will be updated to include the official images.

> ### Future Plans for Official Add-ons
>
> The official Playnite Web repository by Andrew Codes has plans to release these add-ons, as noted in [Issue #319](https://github.com/andrew-codes/playnite-web/issues/319). These custom-built add-ons are provided in the meantime to simplify the setup process explained in the blog post: [Control Playnite from Home Assistant Dashboard](https://blog.cvetic.in.rs/home-automation/control-playnite-home-assistant-dashboard/).

## Description

This Home Assistant add-on provides a web interface and API for Playnite. It allows you to manage and interact with your Playnite game library through a web browser. The add-on is configurable via Home Assistant options and supports multiple architectures.

## Features

- Provides a web interface for managing the Playnite game library.
- Offers an API for integrating with other applications.
- Configurable via Home Assistant add-on options.
- Supports multiple architectures: `aarch64`, `amd64`

## Installation

1. **Add the Repository**:
   - Go to the Home Assistant web interface.
   - Navigate to **Supervisor** > **Add-on Store**.
   - Click on the three-dot menu and select **Repositories**.
   - Add the repository URL: `https://github.com/cvele/hass-repository`.

2. **Install the Add-on**:
   - Find the "Playnite Web App" add-on in the list.
   - Click on it and then click **Install**.

3. **Configure the Add-on**:
   - Go to the Playnite Web App add-on details page.
   - Click on **Configuration** and set the options as needed.

4. **Start the Add-on**:
   - Click **Start** to launch the add-on.

## Configuration

You can configure the add-on via the Home Assistant UI. Here are the available configuration options:

- **PORT**: Port on which the web application is accessible (default: 3000).
- **DB_HOST**: IP address or hostname of the MongoDB database.
- **DB_PORT**: Port of the MongoDB database (default: 27017).
- **DB_USERNAME**: Username to access the MongoDB database (optional).
- **DB_PASSWORD**: Password to access the MongoDB database (optional).
- **DEBUG**: Debug level for troubleshooting (default: "playnite-web/*").
- **USERNAME**: Username used to login to the web interface.
- **PASSWORD**: Password used to login to the web interface.
- **SECRET**: Secret used to protect credentials.
- **MQTT_HOST**: IP address or hostname of the MQTT broker.
- **MQTT_PORT**: Port of the MQTT broker (default: 1883).
- **MQTT_USERNAME**: Username to access the MQTT broker (optional).
- **MQTT_PASSWORD**: Password to access the MQTT broker (optional).

### Example Configuration

```json
{
  "PORT": 3000,
  "DB_HOST": "mongodb.example.com",
  "DB_PORT": 27017,
  "DB_USERNAME": "dbuser",
  "DB_PASSWORD": "dbpassword",
  "DEBUG": "playnite-web/*",
  "USERNAME": "admin",
  "PASSWORD": "password",
  "SECRET": "supersecret",
  "MQTT_HOST": "mqtt.example.com",
  "MQTT_PORT": 1883,
  "MQTT_USERNAME": "mqttuser",
  "MQTT_PASSWORD": "mqttpassword"
}
