

FROM golang:1.20-alpine3.17 as build

RUN mkdir /go/src/app
ADD FullCycleRocks.go /go/src/app
WORKDIR /go/src/app
RUN go mod init fullcyclerocks &&\
    go build -o fullcyclerocks .


FROM scratch

WORKDIR /app
COPY --from=build /go/src/app/fullcyclerocks .
ENTRYPOINT ["./fullcyclerocks"]