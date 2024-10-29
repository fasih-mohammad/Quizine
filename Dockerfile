# Use a Python image with system-level build tools
FROM python:3.9-slim

# Install system dependencies, including cargo and build tools
RUN apt-get update && \
    apt-get install -y cargo build-essential && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy your project files to the working directory
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port your app runs on (adjust if needed)
EXPOSE 5000

# Start the Flask app
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
