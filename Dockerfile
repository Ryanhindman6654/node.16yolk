# Use an official Node.js runtime as a parent image
FROM node:16.13.2

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the application code to the container
COPY . .

# Install application dependencies
RUN npm install

# Expose the port the app runs on
EXPOSE 3000

# Define the command to run the application
CMD ["npm", "start"]
