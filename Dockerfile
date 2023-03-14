FROM python:3.11
COPY --from=eclipse-temurin:19-jre / /

WORKDIR /mcdreforged
COPY ./requirements.txt /mcdreforged

RUN pip install -r requirements.txt

ENV LANG C.UTF-8
ENV PYTHONUNBUFFERED 0

CMD python -m mcdreforged
