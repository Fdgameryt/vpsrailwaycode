FROM ubuntu:22.04

RUN apt update && \
    apt install -y wget curl git openssh-client tmate python3 && \
    apt clean

WORKDIR /app
RUN echo "Tmate Session Running..." > index.html

EXPOSE 6080

CMD bash -c "python3 -m http.server 6080 & \
tmate -F new-session && \
tmate wait tmate-ready && \
tmate display -p 'SSH: ssh #{tmate_ssh}\nWEB: https://tmate.io/t/#{tmate_web}'"
