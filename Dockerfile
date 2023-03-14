# 1. Python
FROM python:3.11

# 2. Get Java
RUN wget --quiet https://download.oracle.com/java/19/latest/jdk-19_linux-x64_bin.tar.gz \
&& tar -xf jdk-19_linux-x64_bin.tar.gz \
&& update-alternatives --install /usr/bin/java java /jdk-19.0.2/bin/java 1

# 3. Setup Working filds
COPY ./requirements.txt /requirements.txt

# 4. init mcdreforged
WORKDIR /mcdreforged_init
SHELL ["/bin/bash", "-c"]
RUN python -m venv venv \
&& source venv/bin/activate \
&& pip install -r /requirements.txt
RUN python -m mcdreforged init

# 5. Workdir
RUN cp -r /mcdreforged_init /mcdreforged
WORKDIR /mcdreforged
VOLUME /mcdreforged

# 6. Set env
ENV PATH="/mcdreforged/venv/bin:$PATH"
ENV LANG C.UTF-8
ENV PYTHONUNBUFFERED 0

CMD ["python", "-m", "mcdreforged"]
