FROM python:3.12-slim
WORKDIR /app
COPY app-source.zip /tmp/app-source.zip
RUN python -m zipfile -e /tmp/app-source.zip /app && rm /tmp/app-source.zip
ENV PYTHONUNBUFFERED=1 DATA_DIR=/data PORT=3000
EXPOSE 3000
CMD ["python", "server.py"]
