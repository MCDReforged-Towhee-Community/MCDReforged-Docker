# 1. Python
FROM python:3.12

# 2. Install Java
RUN wget --quiet https://download.oracle.com/java/21/archive/jdk-21.0.2_linux-x64_bin.tar.gz \
&& tar -xf jdk-21.0.2_linux-x64_bin.tar.gz \
&& rm jdk-21.0.2_linux-x64_bin.tar.gz /jdk-21.0.2/lib/src.zip \
&& update-alternatives --install /usr/bin/java java /jdk-21.0.2/bin/java 1

# 3. Copy files
COPY ./requirements.txt /requirements.txt
COPY ./start.sh /start.sh

# 4. Initialization
WORKDIR /mcdreforged
VOLUME /mcdreforged
RUN python -m venv venv \
&& /mcdreforged/venv/bin/pip install -r /requirements.txt --no-cache-dir \
&& rm /requirements.txt \
&& /mcdreforged/venv/bin/mcdreforged init \
&& cp -r /mcdreforged /mcdreforged_init

# 5. Set env
ENV PATH="/mcdreforged/venv/bin:$PATH"
ENV LANG C.UTF-8
ENV PYTHONUNBUFFERED 0

CMD ["/bin/bash", "/start.sh"]
