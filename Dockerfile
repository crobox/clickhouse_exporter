FROM golang:1.11

MAINTAINER  Roman Tkalenko

ADD . /go/src/github.com/tkroman/clickhouse_exporter

RUN cd /go/src/github.com/tkroman/clickhouse_exporter && make init && make

ENTRYPOINT ["/go/bin/clickhouse_exporter"]

CMD ["-scrape_uri=http://localhost:8123"]

EXPOSE     9116
