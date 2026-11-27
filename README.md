# astra-brain
Gemini proxy with the Astra persona (no private details). Set `GEMINI_API_KEY` in the Render environment; CORS is limited to `ALLOWED_ORIGINS`.
POST /chat {messages:[{role:"user"|"model",text}]} -> {reply, model}. 503 {error:"not_configured"} until the key is set.
