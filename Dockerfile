# WARNING: This is an ancient, vulnerable version of Python!
FROM python:3.8-slim-buster

WORKDIR /app

# Install the web server package
RUN pip install Flask==1.1.2

COPY app.py .

CMD ["python", "app.py"]
