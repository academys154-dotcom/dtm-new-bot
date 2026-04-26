FROM python:3.12-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app ./app
COPY start.sh ./start.sh
COPY railway.json ./railway.json

RUN chmod +x /app/start.sh
RUN mkdir -p /app/data /app/exports

CMD ["/app/start.sh"]
