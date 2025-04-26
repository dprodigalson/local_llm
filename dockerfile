# ---- Base Image ----
FROM ollama/ollama:latest

# Install Python and needed libraries
RUN apt-get update && apt-get install -y python3 python3-pip

# Set working directory
WORKDIR /app

# Copy your server code and entrypoint
COPY server.py /app/server.py
COPY entrypoint.sh /app/entrypoint.sh

# Make entrypoint executable
RUN chmod +x /app/entrypoint.sh

# Install FastAPI and Uvicorn
RUN pip3 install fastapi uvicorn requests

# Expose necessary ports
EXPOSE 11434 8000

# Command to run on container start
ENTRYPOINT ["bash", "/app/entrypoint.sh"]
    