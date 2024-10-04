# Dockerfile
FROM python:3.9-slim

# Set working directory inside container
WORKDIR /flaskApp

# Copy the requirements file
COPY requirements.txt .

# Copy the rest of the app
COPY  /flaskApp .

# Install the dependencies
RUN pip install -r requirements.txt

# Expose port 5000
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]

