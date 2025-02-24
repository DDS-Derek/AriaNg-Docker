FROM alpine AS build

ENV DARKHTTPD_TAG=v1.14
ENV ARIANG_TAG=1.3.9

# Build darkhttpd
RUN apk add --no-cache build-base
WORKDIR /src
RUN wget \
        https://github.com/emikulic/darkhttpd/archive/refs/tags/${DARKHTTPD_TAG}.tar.gz \
        -O /tmp/darkhttpd.tar.gz \
    && \
    tar \
        -zxvf /tmp/darkhttpd.tar.gz \
        -C /src \
        --strip-components 1
RUN make darkhttpd-static \
 && strip darkhttpd-static

# Download Ariang
RUN mkdir -p \
        /tmp/ariang \
    && \
    wget \
        https://github.com/mayswind/AriaNg/releases/download/${ARIANG_TAG}/AriaNg-${ARIANG_TAG}.zip \
        -O /tmp/ariang.zip \
    && \
    unzip \
        -d /tmp/ariang \
        /tmp/ariang.zip 


FROM scratch

COPY --chmod=755 --from=build /src/darkhttpd-static /darkhttpd
COPY --chmod=755 --from=build /tmp/ariang /AriaNg

ENTRYPOINT ["/darkhttpd","/AriaNg"]

CMD ["--port","6880"]
