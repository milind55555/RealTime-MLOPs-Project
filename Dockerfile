# ================================
# Stage 1: Builder
# ================================
FROM python:3.11-slim AS builder

WORKDIR /build

# Prevent Python from creating .pyc files
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

# Install dependencies into a separate directory
COPY requirements.txt .

RUN pip install --no-cache-dir \
    --prefix=/install \
    -r requirements.txt


# ================================
# Stage 2: Production
# ================================
FROM python:3.11-slim

WORKDIR /app

# Security and Python runtime settings
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random

# Create non-root user
RUN groupadd --system appgroup && \
    useradd --system \
    --gid appgroup \
    --create-home \
    --home-dir /home/appuser \
    appuser

# Copy installed Python packages
COPY --from=builder /install /usr/local

# Copy application
COPY api.py .

# Copy model
COPY models/ models/

# Make application files owned by non-root user
RUN chown -R appuser:appgroup /app

# Switch to non-root user
USER appuser

EXPOSE 8000

CMD ["python", "api.py"]
