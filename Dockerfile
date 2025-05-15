FROM alpine:latest

RUN apk --no-cache add \
  git \
  python3 \
  py3-pip \
  py3-lxml \
  py3-uvicorn \
  build-base \
  bash \
  curl \
  nginx \
  nodejs \
  npm

WORKDIR /app

RUN git clone https://github.com/searxng/searxng.git .

RUN pip3 install -e .

EXPOSE 8080

CMD ["./manage", "run"]
