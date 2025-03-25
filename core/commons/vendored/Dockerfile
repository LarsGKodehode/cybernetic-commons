FROM node:20 AS dependencies
WORKDIR /app
COPY ./ipfs-webui/package.json ./ipfs-webui/package-lock.json /app/
RUN npm clean-install

FROM node:20 AS builder
WORKDIR /app
COPY --from=dependencies /app /app
COPY /ipfs-webui/ /app/
RUN npm run build

FROM joseluisq/static-web-server AS server
COPY --from=builder /app/build/ /public/
