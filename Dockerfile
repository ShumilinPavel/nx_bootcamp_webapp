FROM alpine:3.13 AS builder

WORKDIR ./app
RUN wget -O hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v0.83.1/hugo_0.83.1_Linux-64bit.tar.gz && \
    tar xf hugo.tar.gz
COPY . .
RUN ./hugo

FROM nginx:1.20-alpine

COPY default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/public /www

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
