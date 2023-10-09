FROM python:slim


WORKDIR /home/microblog

COPY poetry.lock pyproject.toml ./
RUN pip install poetry
RUN poetry install --no-root
RUN poetry add gunicorn
RUN poetry add pymsql
RUN poetry add cryptography

COPY app app
COPY migrations migrations
COPY microblog.py config.py boot.sh ./


ENV FLASK_APP microblog.py

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
