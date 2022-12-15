# Psidekick

Psidekick is a Docker Desktop extension that is used to run an instance of Psinode. Psinode is the client software for running a node on a Psibase blockchain.

This tool simplifies the process of deploying a node, and can be used to test out services/front-ends in a local deployment before pushing products to a live chain.

# Installing the extension

To use the Docker Desktop extension, you must be running the latest version of [Docker Desktop](https://www.docker.com/products/docker-desktop/). If you already have it installed, you can check if there are any available updates in Settings > Software Updates.

Once you're on the latest version, use [this link](docker-desktop://extensions/marketplace?extensionId=jamesmart/psidekick&tag=0.1.3) to install the extension. If there is a newer version of the extension available, update to the newest version.

After the extension is installed, Psidekick will automatically start Psinode for you, and it will be exposed to your local machine on port 8080. Visit `http://psibase.127.0.0.1.sslip.io:8080/` in your web browser to browse the microservice front-ends hosted on your local psinode.
