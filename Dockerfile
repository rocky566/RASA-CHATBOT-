FROM python:3.8-slim

# Set environment variables
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the app code
COPY . /app/

# Expose port and run the app
EXPOSE 5000
CMD ["python", "app.py"]
