FROM golang:1.15-alpine as build

ADD . goploader
WORKDIR goploader

RUN CGO_ENABLED=0 go build -o server/server ./server

FROM scratch

COPY --from=build /go/goploader/server/server /server
COPY --from=build /go/goploader/server/assets /assets
COPY --from=build /go/goploader/server/templates /templates

CMD ["/server", "--conf=/goploader/config.yaml"]
