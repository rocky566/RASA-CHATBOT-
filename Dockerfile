# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Install system dependencies and build tools
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip to a specific version and install the dependencies from requirements.txt
RUN pip install --upgrade pip==23.2.1

# Copy the requirements.txt file into the container
COPY requirements.txt .

# Install the Python dependencies without cache
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application into the container
COPY . .

# Set the environment variable to tell Flask the app name
ENV FLASK_APP=app.py

# Expose port 5000 for the Flask app
EXPOSE 5000

# Define the command to run the application
CMD ["flask", "run", "--host=0.0.0.0"]
