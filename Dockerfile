FROM python:3.8-slim as build-stage

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY app.py .

FROM python:3.8-slim

WORKDIR /app

COPY --from=build-stage /usr/local/lib/python3.8/site-packages/ /usr/local/lib/python3.8/site-packages/
COPY --from=build-stage /app/app.py .

EXPOSE 8000

ENV NAME World

CMD ["python", "app.py"]
