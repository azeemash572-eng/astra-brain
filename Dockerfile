FROM node:22-slim
WORKDIR /app
COPY server.mjs ./
ENV PORT=7861
EXPOSE 7861
# GEMINI_API_KEY is injected at runtime from the Render environment. It is never in this image or repo.
CMD ["node", "server.mjs"]
