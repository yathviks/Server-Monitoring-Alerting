FROM alpine:latest

RUN apk add --no-cache curl bash coreutils

WORKDIR /app
COPY bash_metrics.sh .

RUN chmod +x bash_metrics.sh

CMD ["./bash_metrics.sh"]
