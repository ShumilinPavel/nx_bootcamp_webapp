FROM ubuntu:18.04 AS builder
RUN apt-get update && apt-get install -y wget
WORKDIR ./app
RUN wget -O hugo.deb https://github.com/gohugoio/hugo/releases/download/v0.83.1/hugo_extended_0.83.1_Linux-64bit.deb && \
    apt install ./hugo.deb && \
    rm hugo.deb
COPY . .
RUN hugo

FROM nginx
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /app/public /usr/share/nginx/html
ENTRYPOINT ["nginx", "-g", "daemon off;"]
