## Features

### Convert text to wav (for windows)

- put the textfile into the directory ./input/
- start up docker
- execute ./run.sh

Note: will not work on non-windows system because of paths and stuff.

### Generate input from clipboard (for windows)

- Will not work on subsystem or if no powershell.exe is available
- Open a **GIT BASH** (https://git-scm.com/downloads)
- Copy text into clipboard
- Execute `./paste.sh example`

Note: if you know a simple way of writing such scripts in a way that is platform independent and reliable, please tell me :)

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
- Shell: Git bash (but uses powershell to paste clipboard into file)

## Notes

To change the voice you have to use a different file in `convert.sh`.
Download additional voices from https://huggingface.co/rhasspy/piper-voices/tree/v1.0.0. (You have to download both the .onnx and the .onnx.json)
