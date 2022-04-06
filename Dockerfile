FROM alpine:3.15.4

RUN apk add --update --no-cache curl openssl && \
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    sh get_helm.sh

WORKDIR /home/aqua

COPY . .

RUN addgroup -S aqua

RUN adduser -D -S -h /home/aqua aqua aqua

RUN chown -R aqua:aqua /home/aqua

USER aqua

CMD [ "/bin/sh" ]
