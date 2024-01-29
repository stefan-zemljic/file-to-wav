## Features

### Convert text to wav

- put the textfile into the directory ./input/
- start up docker
- execute ./run.sh

### Generate input from clipboard (for windows)

- Copy text into clipboard
- Execute `./paste.sh example`

### Poormans use

- Copy the text you want to convert to wav.
- Execute `./paste.sh example-chapter-1 && ./run.sh`
- Copy the next chapter
- Execute `./paste.sh example-chapter-2 && ./run.sh`
- Copy the next chapter
- Execute `./paste.sh example-chapter-3 && ./run.sh`
[...]

### Poweruser use

- Copy the text you want to convert to wav.
- Execute `./smartpaste.sh example && ./run.sh`
- Repeat (the numbering is done automatically)

## Credits to

- Libraries: https://github.com/rhasspy/piper
- Voices: https://huggingface.co/rhasspy/piper-voices/tree/v1.0.0
- Docker container: ubuntu:latest
- Docker engine: Docker Desktop for Windows
- Assistant: Github Copilot Chat
- IDE: Visual Studio Code
- OS: Windows

## Notes

To change the voice you have to use a different file in `convert.sh`.
Download addional voices from https://huggingface.co/rhasspy/piper-voices/tree/v1.0.0. (You have to download both the .onnx and the .onnx.json)
