# 1. Python
FROM python:3.11-slim

# 2. Install Java
RUN apt update && apt install wget -y  && wget --quiet https://download.oracle.com/java/19/archive/jdk-19.0.2_linux-x64_bin.tar.gz && \
    tar -xf jdk-19.0.2_linux-x64_bin.tar.gz && \
    rm jdk-19.0.2_linux-x64_bin.tar.gz && rm /jdk-19.0.2/lib/src.zip && \
    apt purge wget -y && apt autoremove -y && apt clean && rm -rf /var/lib/apt /var/cache/apt && \
    update-alternatives --install /usr/bin/java java /jdk-19.0.2/bin/java 1

# 3. Copy files
COPY ./requirements.txt /requirements.txt
COPY ./start.sh /start.sh

# 4. Initialization
WORKDIR /mcdreforged
VOLUME /mcdreforged
RUN python -m venv venv \
&& /mcdreforged/venv/bin/pip install -r /requirements.txt --no-cache-dir\
&& rm /requirements.txt \
&& /mcdreforged/venv/bin/python -m mcdreforged init \
&& cp -r /mcdreforged /mcdreforged_init

# 5. Set env
ENV PATH="/mcdreforged/venv/bin:$PATH"
ENV LANG C.UTF-8
ENV PYTHONUNBUFFERED 0

CMD ["/bin/bash", "/start.sh"]
