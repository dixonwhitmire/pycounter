FROM python:3-alpine

RUN mkdir /opt/pycounter

WORKDIR /opt/pycounter

RUN python3 -m venv venv && \
    source venv/bin/activate && \
    pip install --upgrade pip && \


# create user and group

