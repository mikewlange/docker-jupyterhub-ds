FROM dclong/jupyterhub-beakerx:18.10

RUN npm install -g --unsafe-perm itypescript \
    && its --ts-hide-undefined --ts-install=global

RUN apt-get update -y \
    && apt-get install -y \
        tmux \
        proxychains \
        q-text-as-data \
    && apt-get autoremove \
    && apt-get autoclean

# proxychains configuration
COPY settings/proxychains.conf /etc/proxychains.conf

EXPOSE 5006
