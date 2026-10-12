# We upgraded to a secure, modern version of Python!
FROM python:3.11-slim

WORKDIR /app

# We upgraded to a modern, patched version of Flask!
RUN pip install Flask==3.0.3

COPY app.py .

CMD ["python", "app.py"]
