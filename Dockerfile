FROM ubuntu:22.04

COPY ./start.sh /start.sh
COPY ./run.sh /run.sh
COPY ./busybox /busybox
ADD ./bins/ /home/ctf/

RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list && \
    sed -i "s/http:\/\/security.ubuntu.com/http:\/\/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list && \
    apt-get update && apt-get -y dist-upgrade && \
    apt-get install -y lib32z1 proot && \
    useradd -m ctf && \
    chmod 700 /start.sh /run.sh /busybox && \
    echo "flag{default_flag}" > /home/ctf/flag && \
    chown -R root:ctf /home/ctf && \
    chmod -R 750 /home/ctf && \
    chmod 740 /home/ctf/flag

WORKDIR /home/ctf

CMD ["/start.sh"]

EXPOSE 2333
