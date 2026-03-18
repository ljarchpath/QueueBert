# QueueBert

A local setup project for Async file processing, built with FastAPI and uv.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) (v20.10+)
- [uv](https://docs.astral.sh/uv/getting-started/installation/) (for local development without Docker)
- Python 3.13+ (for local development without Docker)

## Setup

### Running with Docker (recommended)

1. Build the Docker image:

   ```bash
   docker build -t queuebert .
   ```

2. Run the container:

   ```bash
   docker run -p 8000:8000 queuebert
   ```

3. The API is now available at `http://localhost:8000`.

### Running locally with uv

1. Install dependencies:

   ```bash
   uv sync
   ```

2. Start the development server:

   ```bash
   uv run uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
   ```

3. The API is now available at `http://localhost:8000`.

## Endpoints

| Method | Path      | Description         |
|--------|-----------|---------------------|
| GET    | `/health` | Health check        |
| GET    | `/docs`   | Interactive API docs (Swagger UI) |
| GET    | `/redoc`  | Alternative API docs (ReDoc) |
