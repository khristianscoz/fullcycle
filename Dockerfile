FROM golang:1.21rc2-alpine3.18 AS builder

WORKDIR /app
COPY hello.go .
RUN go mod init fullcycle
RUN go build .

FROM scratch
WORKDIR /app
COPY --from=builder /app/fullcycle .
CMD [ "./fullcycle" ]
