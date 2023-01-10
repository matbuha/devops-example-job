# Build stage
FROM python:3.9 as build-stage

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

# Run migrations and collectstatic
RUN python manage.py makemigrations && \
    python manage.py migrate && \
    python manage.py collectstatic --noinput

# Production stage
FROM nginx:alpine

# Copy the artifacts from the build stage
COPY --from=build-stage /app/ /app/
COPY --from=build-stage /app/static /static/

# Copy the nginx config file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose the port
EXPOSE 80

# Start the server
CMD ["nginx", "-g", "daemon off;"]
