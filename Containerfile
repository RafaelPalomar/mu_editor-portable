FROM ubuntu:22.04

LABEL com.github.containers.toolbox="true" \
      usage="" \
      summary="A cloud-native python editor experience" \
      maintainer="rafaelpalomaravalos@gmail.com"

COPY extra-packages /
RUN apt-get update && \
    apt-get upgrade -y && \
    grep -v '^#' /extra-packages | xargs apt-get install -y
RUN rm /extra-packages

WORKDIR /opt
RUN curl -L https://github.com/mu-editor/mu/releases/download/v1.2.0/MuEditor-Linux-1.2.0-x86_64.tar | tar x && \
    chmod +x Mu_Editor-1.2.0-x86_64.AppImage

COPY resources/MuEditor.desktop /usr/share/applications
COPY resources/MuEditor.png /usr/share/icons
