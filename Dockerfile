FROM alpine:latest

# Install all system + Python dependencies (no missing modules this time)
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

# Clone latest SearXNG source
RUN git clone https://github.com/searxng/searxng.git .

# Install Python packages, break system protection if needed (PEP 668)
RUN pip3 install --break-system-packages -e .

# Expose correct port
EXPOSE 8080

# Run the SearXNG server
CMD ["./manage", "run"]
