FROM python:3.11-bookworm

RUN apt-get update -y && pip install --upgrade pip && \
    apt-get install git

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME -s /bin/bash \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

RUN apt-get update -y && apt-get install wget sshpass -y && \
    echo "deb http://archive.raspberrypi.org/debian/ buster main" | tee -a /etc/apt/sources.list && \
    wget -qO - https://archive.raspberrypi.org/debian/raspberrypi.gpg.key | tee /etc/apt/trusted.gpg.d/raspberrypi.asc
RUN apt-get update -y && apt-get install raspi-config -y

RUN pip install --upgrade pip
RUN raspi-config nonint do_i2c 0 && pip3 install trilobot

USER vscode

CMD [ "sleep infinity" ]