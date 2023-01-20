# Build stage
FROM python:3.8-slim AS build-stage

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# Run stage
FROM python:3.8-slim-buster

WORKDIR /app

COPY --from=build-stage /app/app.py .

CMD ["python", "app.py"]
