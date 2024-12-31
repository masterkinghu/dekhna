# Use a specific Python base image
FROM python:3.9.7-slim-buster

# Set a working directory
WORKDIR /app

# Update and install required system dependencies
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
        git \
        wget \
        pv \
        jq \
        python3-dev \
        ffmpeg \
        mediainfo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy project files into the container
COPY . .

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Define the default command to run the application
CMD ["python3", "main.py"]
