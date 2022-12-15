# Psidekick

Psidekick is a tool that is used to aid in the development of web services and their corresponding graphical front-ends.

Developed services and front-ends are intended to be hosted on a [Psibase](https://about.psibase.io) deployment.

# Components

There are two components to Psidekick:

1. The Docker Desktop extension that runs a development version of Psinode, which is the client software that allows for storage and services of web services and front-ends.
2. The Psidekick-dev tool, which allows developers to use VSCode to develop services inside a docker container.

# Docker Desktop extension

To use the Docker Desktop extension, you must be running the latest version of [Docker Desktop](https://www.docker.com/products/docker-desktop/). If you already have it installed, you can check if there are any available updates in Settings > Software Updates.

Once you're on the latest version, use [this link](docker-desktop://extensions/marketplace?extensionId=jamesmart/psidekick) to install the extension.

After the extension is installed, Psidekick will automatically start Psinode for you, and it will be exposed to your local machine on port 8080. Visit `http://psibase.127.0.0.1.sslip.io:8080/` in your web browser to browse the microservice front-ends hosted on your local psinode.

# Services development

To develop your own web services, you should clone the [Psidekick repository](https://github.com/gofractally/psidekick) from the Fractally Github.

Follow the instructions in the repo Readme.md to begin developing Rust or C++ services in a docker container.

More documentation for service development is available [here](http://doc-sys.psibase.io).

# Notes

## Future

Future additions to this tool may include a front-end within the Docker Desktop client that allows the user to stop/start/restart the Psinode process. It should also allow the user to perform a clean reboot of the Psinode process that wipes the database back to its genesis state.
