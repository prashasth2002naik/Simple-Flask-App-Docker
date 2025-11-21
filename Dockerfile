FROM python:3.9-slim-buster

LABEL Name="Python Flask Demo App" Version=1.4.2
LABEL org.opencontainers.image.source = "https://github.com/benc-uk/python-demoapp"

ARG srcDir=src
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY product_list_app.py .
COPY . ./app

EXPOSE 5000

CMD ["python3", "product_list_app:app"]
