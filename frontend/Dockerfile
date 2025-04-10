FROM node:23.9-alpine as base

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files into the container
COPY package.json package-lock.json ./

# Install the dependencies
RUN npm install --no-cache

# Set environment variables
ENV NODE_ENV production

# Copy the rest of the application code into the container
COPY . .

# Build the application
RUN npm run build

# # Stage 2: Prod
# FROM node:23.9-alpine

# # Create a non-root user
# RUN useradd -m -r appuser && \
#     mkdir -p /app && \
#     chown -R appuser /app

# # Set the working directory
# WORKDIR /app

# # Copy the built application from the previous stage
# COPY --from=base /app/dist /app/dist
# COPY --from=base /app/package.json /app/package-lock.json ./
# COPY --from=base /usr/local/lib/node_modules /usr/local/lib/node_modules
# COPY --from=base /usr/local/bin /usr/local/bin

# # Copy the rest of the application code into the container
# COPY --from=base /app /app

# # Set environment variables
# ENV NODE_ENV production

# # Switch to the non-root user
# USER appuser

# # Expose the port the app runs on
# EXPOSE 5173
# # Start the application
# CMD ["npx", "vite", "preview", "--host", "--port", "5173"]


# FROM nginx:alpine

# # Copy the built application from the previous stage
# COPY --from=base /app/dist /usr/share/nginx/html

# # Expose the port the app runs on
# EXPOSE 80

# # Start Nginx
# CMD ["nginx", "-g", "daemon off;"]
