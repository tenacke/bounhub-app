FROM node:23.9-alpine3.21 as base

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files into the container
COPY package.json package-lock.json ./

# Install the dependencies
RUN npm install --no-cache

# Copy the rest of the application code into the container
COPY . .

# Set environment variables
ENV NODE_ENV production

# Build the application
RUN npm run build

# Stage 2: Prod
FROM alpine:3.21

# Copy the dist folder from the previous stage
COPY --from=base /app/dist /app/dist
