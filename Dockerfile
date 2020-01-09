FROM node:8-jessie AS builder

ENV BUILD_FLAGS="--architecture os.linux.x86_64  --allow-superuser --server-only"
ENV APP_SOURCE_DIR="/appsrc"
ENV METEOR_ALLOW_SUPERUSER=true

WORKDIR ${APP_SOURCE_DIR}

COPY .scripts ./.scripts
RUN ./.scripts/install-deps.sh

COPY .meteor/release ./.meteor/release
RUN ./.scripts/install-meteor.sh

COPY package.json package-lock.json ./
RUN ./.scripts/install-packages.sh

COPY . .
RUN ./.scripts/build-meteor.sh

FROM node:8-alpine
COPY --from=builder /bundle /bundle
WORKDIR /bundle
COPY entrypoint.sh /entrypoint.sh
RUN cd programs/server && npm install --production && npm cache clean --force

ENV PORT 8080
ENV MONGO_URL=$MONGO_SERVICE_HOST:$MONGO_SERVICE_PORT
EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
CMD ["node", "main.js"]
