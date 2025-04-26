#!/bin/bash

# Start Ollama server
ollama serve &

# Wait for Ollama to be ready (simple safe wait)
echo "Waiting for Ollama daemon to start..."
sleep 10

# Pull the model we want (llama in this case)
ollama pull llama3.2

# Start FastAPI server
uvicorn server:app --host 0.0.0.0 --port 8000