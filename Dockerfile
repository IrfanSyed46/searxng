FROM alpine:latest

# Install required system + Python packages
RUN apk --no-cache add \
  git \
  python3 \
  py3-pip \
  py3-lxml \
  py3-yaml \
  py3-werkzeug \
  py3-markupsafe \
  py3-jinja2 \
  py3-requests \
  py3-babel \
  py3-dateutil \
  py3-pygments \
  py3-packaging \
  py3-setuptools \
  build-base \
  bash \
  curl \
  nginx \
  nodejs \
  npm

# Set working directory
WORKDIR /app

# Clone full searxng repo
RUN git clone https://github.com/searxng/searxng.git .

# 👇 Install without -e (editable), just normal prod setup
RUN pip3 install --break-system-packages .

EXPOSE 8080

CMD ["./manage", "run"]
