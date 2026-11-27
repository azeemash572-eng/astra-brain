# astra-brain
Gemini proxy with the Astra persona (no private details). Set `GEMINI_API_KEY` in the Render environment; CORS is limited to `ALLOWED_ORIGINS`.
POST /chat {messages:[{role:"user"|"model",text}]} -> {reply, model}. 503 {error:"not_configured"} until the key is set.

POST /tts {text (<=500 chars), voice?: Zephyr|Kore|Aoede|Leda} -> audio/wav (Gemini TTS, soft Pakistani-Urdu style). Devanagari/emoji are stripped. 6/min and 80/day per IP, 400/day global, 60-entry cache (hits are free). 503 not_configured / 429 rate_limited / 502 upstream_failed -> the app falls back to the device voice.

## 3.3.2 (app) changes
- `/chat` accepts an optional `context` string (max 3000 chars: date/time, chosen language, his rules, saved memories) added after the persona.
- Plain everyday Urdu words rule (no sujhaav / surakshit / prayog), Devanagari voice typing answered in Roman Urdu, varied pet names.
- 32s total budget across Gemini models (the app waits 40s).
- `/chat` accepts photos (3.3.4): the newest user turn may carry `images:[dataUrl]` or OpenAI-style `content:[{type:"text"},{type:"image_url"}]`; jpeg/png/webp/gif data URLs only, max 3, ~4 MB base64 in total, separate photo rate limit (6/min, 60/day per IP, 300/day overall).
