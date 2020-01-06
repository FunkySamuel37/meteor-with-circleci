FROM node:8-jessie

ENV BUILD_FLAGS="--architecture os.linux.x86_64  --allow-superuser --server-only"
ENV METEOR_VERSION="1.8.1"
ENV METEOR_ALLOW_SUPERUSER=true

WORKDIR /appsrc

COPY .scripts ./.scripts
RUN ./.scripts/install-deps.sh
RUN ./.scripts/install-meteor.sh

COPY package-lock.json .
RUN ./.scripts/install-packages.sh

COPY . .
RUN ./.scripts/build-meteor.sh

WORKDIR /bundle
RUN (cd programs/server && npm install)

ENV PORT 8080
ENV MONGO_URL=$MONGO_SERVICE_HOST:$MONGO_SERVICE_PORT
EXPOSE 8080
ENTRYPOINT node main.js