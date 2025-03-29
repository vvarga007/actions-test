FROM python:3.13-slim

WORKDIR /app
COPY requirements.txt scrapedmv.py /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    pip3 install --break-system-packages --no-cache-dir -r /app/requirements.txt && \
    apt-get purge -y curl

ENV PYTHONUNBUFFERED=1
CMD ["python", "--version"]
