# Use a lightweight Python image with a supported Debian version
FROM python:3.12-slim-bookworm

# Create a non-root user for security (Tight Security Principle)
RUN useradd -m appuser
USER appuser

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 8080
CMD ["python", "app.py"]