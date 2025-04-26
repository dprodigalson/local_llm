from fastapi import FastAPI
from pydantic import BaseModel
import requests

app = FastAPI()

OLLAMA_URL = "http://localhost:11434"  # Ollama default internal port
MODEL_NAME = "llama3.2"  # or "llama3", "phi", "deepseek", whichever you pull

class PromptRequest(BaseModel):
    prompt: str

@app.post("/generate")
def generate_text(request: PromptRequest):
    payload = {
        "model": MODEL_NAME,
        "prompt": request.prompt,
        "stream": False
    }
    response = requests.post(f"{OLLAMA_URL}/api/generate", json=payload)
    return response.json()
