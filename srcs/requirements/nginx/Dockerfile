FROM alpine:3.18.2

RUN apk update && apk upgrade && apk add nginx openssl

RUN openssl req -x509 -newkey rsa:4096 -keyout /private_key.key -out /certificate.crt -days 365 -nodes -subj "/CN=vviovi.42.fr"

COPY nginx.conf /etc/nginx/http.d/nginx.conf

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]

