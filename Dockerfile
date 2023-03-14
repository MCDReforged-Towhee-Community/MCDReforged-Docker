FROM eclipse-temurin:19-jre
COPY --from=python:3.11 / /

WORKDIR /mcdreforged
COPY ./requirements.txt /mcdreforged

RUN pip install -r requirements.txt

ENV LANG C.UTF-8
ENV PYTHONUNBUFFERED 0

CMD python -m mcdreforged
