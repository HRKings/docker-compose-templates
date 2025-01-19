# Ollama + OpenWebUI

This is a simple stack for running Ollama with GPU acceleration inside docker with OpenWebUI as the frontend

## Recommendations

- It's recommended to have the ollama cli installed in case you need it, but the same can be used from inside the container.
- Pull a model after running the container, this can be done via the frontend
  - You can also use the CLI to pull a model for the container (E.g.: `ollama pull dolphin3`)
