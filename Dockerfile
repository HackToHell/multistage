FROM golang:1.11.0-stretch as builder

COPY . /build
WORKDIR /build

RUN CGO_ENABLED=0 GOOS=linux go build -o test

FROM scratch as what

FROM what

COPY --from=builder /build/* /root/

CMD ["/root/test"]