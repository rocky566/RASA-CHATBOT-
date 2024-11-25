# Use a base image with Python 3.9
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt /app/

# Install the necessary dependencies
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application into the container
COPY . /app/

# Expose the application port
EXPOSE 5000

# Define the command to run your app
CMD ["python", "app.py"]
