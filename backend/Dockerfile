FROM python:3.13-slim

# Set the working directory
WORKDIR /app

# Install the dependencies
RUN python3 -m pip install --upgrade pip && \   
    pip install --no-cache-dir -r requirements.txt
# Copy the rest of the application code into the container

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application
RUN django-admin collectstatic --noinput && \
    python3 manage.py migrate && \
    gunicorn bind 0.0.0.0:8000 --workers 4 core.wsgi