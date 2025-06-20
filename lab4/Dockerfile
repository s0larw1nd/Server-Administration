FROM python:3.10.17-alpine3.20 AS builder

WORKDIR /app

COPY pyproject.toml .

RUN python -m venv /venv

RUN /venv/bin/pip install --no-cache-dir .

RUN /venv/bin/pip install --no-cache-dir ".[test]"

FROM python:3.10.17-alpine3.20

WORKDIR /app  

COPY --from=builder /venv /venv

COPY ./src ./src

COPY ./tests ./tests

EXPOSE 8014

CMD ["/venv/bin/uvicorn", "src.main:app", "--reload"]