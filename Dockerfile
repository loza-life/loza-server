FROM golang:1.22-alpine3.19 as builder

RUN apk --no-cache add gcc build-base

WORKDIR /root

COPY . .

RUN go mod download
# CGO_ENABLED=1 - must be 1 for go-sqlite
ENV CGO_ENABLED=1
ENV GOOS=linux
ENV CGO_CFLAGS="$CGO_CFLAGS -D_LARGEFILE64_SOURCE"

RUN go env | grep -v -E 'GOMOD|GONOPROXY|GOPRIVATE|GOPROXY'

RUN go build -o loza-server main.go

FROM alpine:3.19
RUN apk --no-cache add ca-certificates

RUN mkdir -p /data && mkdir -p /app
WORKDIR /app/
ENV DB_PATH=/data/sqlite.db
COPY --from=builder /root/loza-server /app/loza-server

EXPOSE 8080

CMD "/app/loza-server"
