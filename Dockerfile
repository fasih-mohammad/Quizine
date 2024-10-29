FROM python:3.11.2  # Choose the appropriate Python version

# Install Rust build tools and other dependencies
RUN apt-get update && \
    apt-get install -y cargo && \
    rm -rf /var/lib/apt/lists/*  # Clean up to reduce image size

WORKDIR /app  # Set the working directory

# Copy your application code to the container
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Command to run your application
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:8000"]
