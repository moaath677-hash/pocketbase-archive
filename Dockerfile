# نحدد نسخة PocketBase اللي نبيها
ARG PB_VERSION=0.33.0

# صورة لينكس خفيفة
FROM alpine:3.19

# نثبت الأدوات اللي نحتاجها
RUN apk add --no-cache ca-certificates wget unzip

# نحدد النسخة قبل باقي الأوامر
ARG PB_VERSION

# نحمّل PocketBase (لينكس amd64) من GitHub الرسمي
RUN wget -O /tmp/pocketbase.zip "https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip" \
    && unzip /tmp/pocketbase.zip -d /pb \
    && rm /tmp/pocketbase.zip \
    && chmod +x /pb/pocketbase

# مجلد البيانات (لو حاب تسوي له volume لاحقًا)
RUN mkdir -p /pb/pb_data

WORKDIR /pb

# المنفذ الافتراضي لـ PocketBase
EXPOSE 8090

# أمر التشغيل
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090", "--dir", "/pb/pb_data"]
