# Build stage
FROM python:3.9-slim-buster AS build

# Set the working directory to /app
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . .

# Run the tests
RUN pytest

# Release stage
FROM python:3.9-slim-buster AS release

# Set the working directory to /app
WORKDIR /app

# Copy the application files from the build stage
COPY --from=build /app .

# Define environment variable
ENV NAME World

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run app.py when the container launches
CMD ["python", "app.py"]
