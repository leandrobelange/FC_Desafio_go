FROM golang as builder
WORKDIR /app
COPY *.go /app
RUN go build -ldflags "-s -w" desafio.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/desafio /app/desafio
CMD [ "/app/desafio" ]
