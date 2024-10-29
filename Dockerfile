# Use an official Python image with a version compatible with your app
FROM python:3.9-slim

# Install system dependencies (including cargo)
RUN apt-get update && apt-get install -y \
    cargo \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the application files to the container
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port your Flask app will run on
EXPOSE 5000

# Set the default command to run your Flask app
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
