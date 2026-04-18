#!/bin/bash
bash ~/scripts/foxy.sh
sleep 1

case $1 in
  gif)
    echo "--- Creating GIF ---"
    ffmpeg -i "$2" -vf "fps=10,scale=480:-1:flags=lanczos" "$3"
    ;;
  audio)
    echo "--- Extracting Audio ---"
    ffmpeg -i "$2" -q:a 0 -map a "$3"
    ;;
  compress)
    echo "--- Compressing Video ---"
    ffmpeg -i "$2" -vcodec libx264 -crf 28 "$3"
    ;;
  info)
    ffprobe -v error -show_format -show_streams "$2"
    ;;
  *)
    echo "Usage: foxy-video {gif|audio|compress|info} input_file output_file"
    ;;
esac
