# Simple CPU build
FROM python:3.11-slim

WORKDIR /app
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Deps exactly as per RS docs
RUN pip install --no-cache-dir fastapi uvicorn[standard] torch torchvision ftfy regex tqdm \
 && pip install --no-cache-dir git+https://github.com/openai/CLIP.git \
 && pip install --no-cache-dir mysql-connector-python python-multipart faiss-cpu requests

# Copy RS' service script into the image
#COPY clip_service.py /app/clip_service.py

#EXPOSE 8000
#ENTRYPOINT ["python", "/app/clip_service.py"]
# Pass DB creds at runtime via container args:
# e.g., --dbuser myuser --dbpass mypass
