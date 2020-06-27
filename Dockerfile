FROM alpine:latest AS fetcher
RUN apk add python3-dev
RUN apk add musl-dev
RUN apk add gcc
RUN pip3 install discord --no-use-pep517
RUN pip3 install dill

FROM alpine:latest
RUN apk add python3
COPY --from=fetcher /usr/lib/python3.8/site-packages /usr/lib/python3.8/site-packages
WORKDIR /botworkdir
ADD dbi.py ./
ADD bot.py ./
CMD python3 bot.py