FROM alpine:latest

COPY start.sh /

RUN apk add --update --no-cache build-base python3-dev python3 libffi-dev libressl-dev bash git gettext curl \
    && curl -O https://bootstrap.pypa.io/get-pip.py \
    && python3 get-pip.py \
    && pip install --upgrade awscli \
    && chmod +x /start.sh 

ENTRYPOINT ["/start.sh"]
CMD [""]


