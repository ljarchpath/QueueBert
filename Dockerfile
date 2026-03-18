# Build stage: install dependencies
FROM python:3.13 AS base

WORKDIR /app

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

# Copy dependency files
COPY pyproject.toml uv.lock ./

# Install dependencies into a virtual environment
RUN uv sync --frozen --no-dev --no-install-project

# Runtime stage: slim image
FROM python:3.13-slim AS app

WORKDIR /app

# Copy the virtual environment from the build stage
COPY --from=base /app/.venv /app/.venv

# Copy application code
COPY app/ ./app/

# Make the virtual environment's binaries available
ENV PATH="/app/.venv/bin:$PATH"

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
