# Use an official Node.js runtime as a parent image
FROM node:16.13.2

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package*.json ./

# Check network connectivity
RUN apt-get update && apt-get install -y curl && curl -I https://registry.npmjs.org/

# Update and install system dependencies
RUN apt-get update && apt-get install -y python g++ make

# Verify Node.js and npm versions
RUN node -v && npm -v

# Debugging: Display current working directory and contents
RUN pwd && ls -la

# Install application dependencies with verbose logging
RUN npm config set loglevel verbose && npm install

# Copy the application code to the container
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Define the command to run the application
CMD ["npm", "start"]
