FROM alpine:3.17

RUN apk update && apk upgrade && apk add nginx openssl

RUN openssl req -x509 -newkey rsa:4096 -keyout /private_key.key -out /certificate.crt -days 365 -nodes -subj "/CN=vviovi.42.fr"

RUN addgroup -S www
RUN adduser -S www -G www

COPY --chown=www:www --chmod=777 staticpage.html /var/www/html/staticpage.html
COPY --chown=www:www --chmod=777 img_sc.jpg /var/www/html/img_sc.jpg
COPY --chown=www:www --chmod=777 nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

WORKDIR /var/www/html

RUN chown -R www:www /var/www/html
RUN chmod -R 777 /var/www/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]
