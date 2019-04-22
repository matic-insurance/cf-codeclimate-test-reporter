FROM alpine
MAINTAINER Volodymyr Mykhailyk <volodymyr.mykhailyk@gmail.com>

RUN apk add --no-cache curl git

RUN curl -L -o /usr/local/bin/cc-test-reporter https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64
RUN chmod +x /usr/local/bin/cc-test-reporter

ADD ./report /usr/local/bin/report
RUN chmod +x /usr/local/bin/report

ENTRYPOINT ["/usr/local/bin/report"]