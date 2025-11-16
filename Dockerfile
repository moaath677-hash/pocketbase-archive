FROM alpine:latest

RUN apk update && apk add --no-cache curl unzip

WORKDIR /app

# تحميل PocketBase (إصدار 0.21.0 مثال، ويكفيك)
RUN curl -L -o pb.zip https://github.com/pocketbase/pocketbase/releases/download/v0.21.0/pocketbase_0.21.0_linux_amd64.zip \
    && unzip pb.zip \
    && rm pb.zip

EXPOSE 10000

CMD ["./pocketbase", "serve", "--http=0.0.0.0:10000"]
