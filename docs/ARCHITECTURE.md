# Syntax architecture (draft)

```text
Original Go TUI           React UI (future)
      |                         |
      +---- local API / stream -+
                     |
        C++ inference runtime -------- SGLang (reference baseline)
                     |
            model / memory layer
               /           \
         CPU reference   CUDA / PTX
                \          /
               GB10 / local CPU

Bun + TypeScript: agent tools and integrations
Elixir: optional concurrent / distributed orchestration
Python: offline research and benchmark utilities
SQLite: local metadata; PostgreSQL: future hosted metadata
```

These are architectural intentions, not existing production services. The custom inference engine should remain usable without the TUI and without Bun/Elixir.
