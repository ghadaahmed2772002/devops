# Use official Node.js Alpine image
FROM node:18-alpine3.17

# Set the working directory
WORKDIR /usr/app

# Copy dependency files first for better caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all remaining project files
COPY . .

# Set environment variables (can be overridden in docker run or docker-compose)
ENV MONGO_URI=uriPlaceholder
ENV MONGO_USERNAME=usernamePlaceholder
ENV MONGO_PASSWORD=passwordPlaceholder

# Expose the app port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
