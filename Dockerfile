# Use a lightweight Python image with a supported Debian version
# Use a specific patched tag instead of generic base
FROM python:3.12-slim-bookworm

# Update packages to latest patched versions
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    # your dependencies \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user for security (Tight Security Principle)
RUN useradd -m appuser
USER appuser

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 8080
CMD ["python", "app.py"]
