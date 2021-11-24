FROM cloudron/base:3.0.0@sha256:455c70428723e3a823198c57472785437eb6eab082e79b3ff04ea584faf46e92

RUN mkdir -p /app/code /app/data
WORKDIR /app/code

# ffmpeg required
RUN apt-get -y update && \
    apt-get update && \
    apt -y install ffmpeg x264 x265 && \
    rm -rf /var/cache/apt /var/lib/apt/lists

ENV VERSION=2.5.0

# copy start script
ADD start.sh /app/code/
ADD drone-server /app/code/
RUN chmod +x /app/code/drone-server
ADD .env /app/data/
RUN ln -s /app/data/.env /app/code/.env

CMD [ "/app/code/start.sh" ]
