FROM litespeedtech/openlitespeed:latest

RUN apt-get update && apt-get install -y wget unzip

WORKDIR /var/www/vhosts/localhost/html

RUN rm -rf * \
    && wget https://wordpress.org/latest.zip \
    && unzip latest.zip \
    && mv wordpress/* . \
    && rm -rf wordpress latest.zip

# 🔥 ADD HEALTH CHECK ENDPOINT
RUN echo "OK" > /var/www/vhosts/localhost/html/health

RUN chown -R lsadm:lsadm /var/www/vhosts/

EXPOSE 80