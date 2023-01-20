# Build Stage
FROM python:3.8-slim as build-stage

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY app.py .

# Redis Stage
FROM redis:latest as redis-stage

# Run Stage
FROM python:3.8-slim

# install Redis
RUN apt-get update && \
    apt-get install -y redis-server

WORKDIR /app

COPY --from=build-stage /usr/local/lib/python3.8/site-packages/ /usr/local/lib/python3.8/site-packages/
COPY --from=build-stage /app/app.py .

EXPOSE 8000

# start Redis server
CMD ["redis-server", "&"]
CMD ["python", "app.py"]
