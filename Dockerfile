FROM node:22-slim
RUN apt-get update && apt-get install -y --no-install-recommends python3 python3-pip && pip3 install --no-cache-dir --break-system-packages edge-tts && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY server.mjs ./
ENV PORT=7861
EXPOSE 7861
# GEMINI_API_KEY is injected at runtime from the Render environment. It is never in this image or repo.
CMD ["node", "server.mjs"]
