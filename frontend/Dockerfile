FROM node:23 as base

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files into the container
COPY package.json package-lock.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application code into the container
COPY . .

# Build the application
RUN npm run build

FROM nginx:alpine

# Copy the built application from the previous stage
COPY --from=base /app/dist /usr/share/nginx/html

# Expose the port the app runs on
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
