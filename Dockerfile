FROM golang:1.11 AS BUILD

MAINTAINER  Roman Tkalenko

ADD . /go/src/github.com/tkroman/clickhouse_exporter

WORKDIR /go/src/github.com/tkroman/clickhouse_exporter

RUN make init && make

FROM frolvlad/alpine-glibc

COPY --from=BUILD /go/bin/clickhouse_exporter /usr/local/bin/clickhouse_exporter

CMD ["/usr/local/bin/clickhouse_exporter", "-scrape_uri=http://localhost:8123"]

EXPOSE     9116
