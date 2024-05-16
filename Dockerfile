# Use the official Python image from the Docker Hub
FROM python:3.10-slim

# Install necessary packages for uv and Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Copy the Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Create log directories and set permissions
RUN mkdir -p /var/log/nginx && \
    mkdir -p /var/log/gunicorn && \
    mkdir -p /tmp/nginx/body /tmp/nginx/fastcgi /tmp/nginx/proxy /tmp/nginx/scgi /tmp/nginx/uwsgi && \
    mkdir -p /tmp/nginx && \
    chown -R 1000:1000 /var/log/nginx /var/log/gunicorn /tmp/nginx /app

# Create a non-root user
RUN adduser --disabled-password --gecos '' appuser

# Switch to the non-root user
USER appuser

# Install uv
RUN python3 -m pip install uv

# Create a virtual environment using uv
RUN /home/appuser/.local/bin/uv venv /app/.venv --seed

# Install any needed packages specified in requirements.txt
RUN /home/appuser/.local/bin/uv pip install --no-cache-dir -r /app/requirements.txt

# Expose the port on which the app will run
EXPOSE 9999

# Start Gunicorn and Nginx
CMD ["/bin/bash", "-c", "/app/.venv/bin/gunicorn -c /app/gunicorn.conf.py code.app:flask_main & nginx -g 'daemon off;'"]
