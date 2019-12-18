# build wheel file distribution from source
FROM python:3-alpine AS builder

COPY . /usr/local/source/pycounter

WORKDIR /usr/local/source/pycounter

RUN python -m venv venv && \
    source venv/bin/activate && \
    pip install --upgrade pip && \
    pip install wheel && \
    python setup.py bdist_wheel

# install wheel file as application user
FROM python:3-alpine AS final

ENV REDIS_HOST pycounter-redis
ENV REDIS_PORT 6379

ENV FLASK_APP pycounter.main:app
ENV FLASK_ENV development
ENV FLASK_RUN_HOST 0.0.0.0
ENV FLASK_RUN_PORT 5000


RUN addgroup -S pygroup && \
    adduser --home /home/pyuser --disabled-password pyuser -G pygroup

RUN mkdir /opt/pycounter && \
    chown pyuser:pygroup /opt/pycounter

COPY --chown=pyuser:pygroup --from=builder /usr/local/source/pycounter/dist/pycounter-1.0.0-py3-none-any.whl /opt/pycounter/pycounter-1.0.0-py3-none-any.whl

USER pyuser

WORKDIR /opt/pycounter

RUN python -m venv venv && \
    source venv/bin/activate && \
    pip install --upgrade pip && \
    pip install wheel && \
    pip install pycounter-1.0.0-py3-none-any.whl

CMD ["venv/bin/python", "-m", "flask", "run"]
