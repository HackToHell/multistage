FROM golang:1.11.0-stretch as builder

COPY . /build
WORKDIR /build

RUN CGO_ENABLED=0 GOOS=linux go build -o test

FROM scratch

COPY --from=rrdockerhub/gwm-ui:v1.6.0 /build/* /root/

CMD ["/root/test"]