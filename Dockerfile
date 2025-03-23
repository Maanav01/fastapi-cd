# Use Ubuntu as base image
FROM ubuntu:latest

# Set environment variables to prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install Python and required dependencies
RUN apt update && apt install -y python3 python3-pip python3-venv

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Create a virtual environment and install dependencies
RUN python3 -m venv venv
RUN . /app/venv/bin/activate && pip install --no-cache-dir -r requirements.txt

# Expose port 8000 for FastAPI
EXPOSE 8000

# Start FastAPI server
CMD ["/app/venv/bin/python", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

