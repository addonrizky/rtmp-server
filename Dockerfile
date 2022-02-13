FROM alpine

#expose dong
expose 1935
RUN apk add ffmpeg bash
ENTRYPOINT ["/bin/sh", "-c", "ffmpeg -f flv -listen 1 -i rtmp://0.0.0.0:1935/live/app/Jakarta123 -c:v h264 -force_key_frames \"expr:gte(t,n_forced*4)\" -profile:v baseline -an -map v:0 -s:0 320x180 -map v:0 -s:1 384x216 -ldash 1 -streaming 1 -use_template 1 -use_timeline 0 -adaptation_sets \"id=0,streams=v id=1,streams=a\" -seg_duration 4 -frag_duration 1 -frag_type duration -window_size 15 -extra_window_size 15 -remove_at_exit 1 -f dash https://bifrost.inlive.app/streams/Jakarta123/manifest.mpd"]