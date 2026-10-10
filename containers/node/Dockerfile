FROM node:lts-alpine

# Set the active working directory inside the container
WORKDIR /var/www/html

# Run as non-root user to avoid permission conflicts on your host files.
# However I don't need this as I'm running Docker in rootless context so it's
# okay if everything is running as root inside the container.
# USER node
