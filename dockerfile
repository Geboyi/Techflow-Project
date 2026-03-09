# An official Python base image
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Copy dependency file into the container
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project files into the container
COPY . .

# Expose the Flask application port
EXPOSE 5000

# Start the Flask application
CMD ["python", "app.py"]