# Use an official Python runtime as the base image
FROM python:3.8-alpine

# Set the working directory to /code
WORKDIR /code

# Copy the requirements file into the container
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Copy the current directory contents into the container at /code
COPY . .

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable
ENV REDIS_HOST redis
ENV REDIS_PORT 6379

# Run app.py when the container launches
CMD ["python", "app.py"]

# Build the image with the 'builder' target
FROM builder as final

# Use the 'redislabs/redismod' image as the base
FROM redislabs/redismod

# Expose the default Redis port
EXPOSE 6379

# Run the Redis server
CMD ["redis-server"]
