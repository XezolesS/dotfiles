#! /usr/bin/env bash

set -euo pipefail

# ---- arguments handling ----
OPTS=$(getopt \
  -o f:,r:,h \
  -l framerate:,resolution:,help \
  -n "resolvify" -- "$@")
eval set -- "$OPTS"

FRAMERATE=60
RESOLUTION="1920x1080"

while true; do
  case "$1" in
  -f | --framerate)
    FRAMERATE="$2" # simple tilde expansion
    shift 2
    ;;
  -r | --resolution)
    RESOLUTION="$2"
    shift 2
    ;;
  -h | --help)
    cat <<EOF
Usage: $0 [OPTION] FILE ...

FILE:
  Video file to resolvify.

[OPTIONS]:
  -f, --framerate     Target framerate (default: 60)
  -r, --resolution    Target resolution (default: 1920x1080)
  -h, --help          Show this help.
EOF
    exit 0
    ;;
  --)
    shift
    break
    ;;
  esac
done

for input_file in "$@"; do
  output_file="${input_file}.mov"

  # Get the number of audio streams
  audio_streams=$(ffprobe -v error -select_streams a -show_entries stream=index -of csv=p=0 "$input_file" | wc -w)

  # Determine the output format based on the number of audio streams
  if [[ "$audio_streams" -eq 1 ]]; then
    # One audio stream: Convert to MOV with merged audio
    ffmpeg -i "$input_file" -c:v dnxhd -c:a pcm_s16le \
      -profile:v dnxhr_hq \
      -s "$RESOLUTION" -r "$FRAMERATE" -b:v 36M -pix_fmt yuv422p -f mov "$output_file"
  else
    # Two or more audio streams: Convert to MOV without merging audio
    ffmpeg -i "$input_file" -map 0:v -map 0:a? -c:v dnxhd -c:a pcm_s16le \
      -profile:v dnxhr_hq \
      -s "$RESOLUTION" -r "$FRAMERATE" -b:v 36M -pix_fmt yuv422p -f mov "$output_file"
  fi

  echo -e "$input_file -> \033[0;36m$output_file\033[0m"
done
