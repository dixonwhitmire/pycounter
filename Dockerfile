FROM python:3-alpine AS builder

COPY . /usr/local/source/pycounter

WORKDIR /usr/local/source/pycounter

RUN python -m venv /usr/local/source/pycounter/venv && \
    source /usr/local/source/pycounter/venv/bin/activate && \
    pip install --upgrade pip && \
    pip install wheel && \
    python setup.py bdist_wheel && \
    pip install /usr/local/source/pycounter/dist/pycounter-1.0.0-py3-none-any.whl

FROM python:3-alpine AS final

RUN addgroup -S pygroup && adduser -SDH pyuser -G pygroup

RUN mkdir /opt/pycounter && \
    chown pyuser:pygroup /opt/pycounter

COPY --chown=pyuser:pygroup --from=builder /usr/local/source/pycounter/venv /opt/pycounter/venv

USER pyuser

ENV REDIS_HOST localhost
ENV REDIS_PORT 6379
ENV FLASK_APP pycounter
ENV FLASK_ENV development

CMD ["source /opt/pycounter/venv/bin/activate && flask run"]
