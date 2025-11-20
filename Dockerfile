FROM python:3.12-slim

WORKDIR /app

# Install uv
RUN pip install uv

# Copy the pyproject.toml and uv.lock files
COPY pyproject.toml uv.lock ./

# Regenerate the uv.lock file to ensure compatibility
RUN uv lock

# Install dependencies using uv sync
RUN uv sync --frozen

# Copy application files
COPY src/ ./src/

# Default command to run the application
CMD [ "python", "src/app.py" ]
