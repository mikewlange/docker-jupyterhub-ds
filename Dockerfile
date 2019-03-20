FROM dclong/jupyterhub-beakerx

RUN npm install -g --unsafe-perm itypescript \
    && its --ts-hide-undefined --install=global

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
