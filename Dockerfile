FROM alpine:latest

# Install required packages
RUN apk add --no-cache wget unzip

# Download PocketBase 0.20.3
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.20.3/pocketbase_0.20.3_linux_amd64.zip -O pb.zip
RUN unzip pb.zip -d /app && rm pb.zip

WORKDIR /app

# Expose PocketBase default port
EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]

