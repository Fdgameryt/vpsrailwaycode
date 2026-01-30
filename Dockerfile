FROM ubuntu:22.04

# Install dependencies
RUN apt update && \
    apt install -y curl wget git python3 openssh-client && \
    apt clean

WORKDIR /app
RUN echo "sshx Session Running..." > index.html

EXPOSE 6080

CMD bash -c "\
python3 -m http.server 6080 & \
curl -sSf https://sshx.io/get | sh && \
sshx"
