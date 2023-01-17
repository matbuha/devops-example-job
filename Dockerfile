# Build stage
FROM python:3.8-slim as build-stage

WORKDIR /app

COPY requirements.txt .

RUN pip install --trusted-host pypi.python.org -r requirements.txt

COPY app.py .

# Final stage
FROM python:3.8-slim

WORKDIR /app

COPY --from=build-stage /app/app.py .

EXPOSE 8000

ENV NAME World

CMD ["python", "app.py"]