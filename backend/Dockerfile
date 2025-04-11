FROM python:3.13-alpine3.21 as base

# Set the working directory
WORKDIR /app

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies
RUN python3 -m pip install --upgrade pip && \   
    pip install --no-cache-dir -r requirements.txt

# Stage 2: Prod
FROM python:3.13-alpine3.21

# # Create a non-root user
RUN addgroup -S appuser && \
    adduser -S -G appuser -s /bin/sh appuser && \
    mkdir -p /app && \
    chown -R appuser:appuser /app

# Copy the installed dependencies from the previous stage
COPY --from=base /usr/local/lib/python3.13/site-packages /usr/local/lib/python3.13/site-packages
COPY --from=base /usr/local/bin /usr/local/bin

# Set the working directory
WORKDIR /app

# Copy the rest of the application code into the container
COPY --chown=appuser:appuser . .

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the entrypoint script executable
RUN chmod +x /app/entrypoint.sh

# Switch to the non-root user
USER appuser

# Start the application
ENTRYPOINT ["/app/entrypoint.sh"]
