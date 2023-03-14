# 1. Python
FROM python:3.11

# 2. Get Java
RUN wget https://download.oracle.com/java/19/latest/jdk-19_linux-x64_bin.tar.gz \
&& tar -xf jdk-19_linux-x64_bin.tar.gz \
&& update-alternatives --install /usr/bin/java java /jdk-19.0.2/bin/java 1

# 3. Setup Working filds
COPY ./requirements.txt /requirements.txt

# 4. Install requirements
RUN pip install -r requirements.txt

# 5. Docker workdir
WORKDIR /mcdreforged
VOLUME /mcdreforged

# 6. init mcdreforged
RUN python -m mcdreforged init

# 7. Set env
ENV LANG C.UTF-8
ENV PYTHONUNBUFFERED 0

CMD python -m mcdreforged
