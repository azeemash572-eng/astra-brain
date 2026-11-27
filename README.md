# astra-brain
Gemini proxy with the Astra persona (no private details). Set `GEMINI_API_KEY` in the Render environment; CORS is limited to `ALLOWED_ORIGINS`.
POST /chat {messages:[{role:"user"|"model",text}]} -> {reply, model}. 503 {error:"not_configured"} until the key is set.

POST /tts {text (<=500 chars), voice?: Zephyr|Kore|Aoede|Leda} -> audio/wav (Gemini TTS, soft Pakistani-Urdu style). Devanagari/emoji are stripped. 6/min and 80/day per IP, 400/day global, 60-entry cache (hits are free). 503 not_configured / 429 rate_limited / 502 upstream_failed -> the app falls back to the device voice.
