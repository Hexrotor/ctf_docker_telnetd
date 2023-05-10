# ctf_docker_telnetd

Docker 容器使用 busybox 启动 telnet 服务器，将程序挂载到端口 `2333` 上，可用于 ctf misc 题

## Usage

`docker-compose up`

修改配置后使用 `docker-compose up --build` 重新 build 镜像

将题目放在 `bins` 文件夹中，容器启动后 `flag` 文件会和题目在同一目录 `/home/ctf` ，`start.sh` 与 `run.sh` 以及 `busybox` 会被复制到容器根目录 `/`

`start.sh` 是容器启动时会执行的脚本，该脚本会将容器中的环境变量 `$FLAG` 值写入到 `/home/ctf/flag` ，并使用 `busybox` 启动一个 telnet 服务器

telnet 服务器会执行 `run.sh` ，该脚本以普通用户 `ctf` 的权限启动一个 proot 环境，并在该环境中启动题目程序

proot 的启动命令如下，`-b /lib` 表示将容器的此目录 `/lib` 映射到 proot 环境中，以便题目程序调用，如果有需求可以添加更多的目录。而 `/helloworld` 表示运行的题目程序，由于 proot 将根目录设置在了 `/home/ctf` ，所以题目在 proot 环境中的位置也成了根目录。

`proot -r /home/ctf -0 -w / -b /dev -b /proc -b /sys -b /lib -b /lib64 /helloworld`

## Connect

`telnet ipaddr 2333`