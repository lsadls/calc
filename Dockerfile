FROM nginx:1.19.3-alpine

ADD calc /root/calc
ADD run.sh /root/run.sh
COPY index.html /usr/share/nginx/html/index.html
COPY nginx.conf /etc/nginx/nginx.conf

RUN chmod 0755 /root/run.sh
RUN chmod 0755 /root/calc

ENTRYPOINT ["sh", "/root/run.sh"]
