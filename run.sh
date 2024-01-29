#!/bin/bash
docker build -t piper-tts . &&
docker run --rm -it -v "C:\\Users\\Stefan\\repos\\piper":/root/workdir piper-tts bash ./convert.sh input/$1