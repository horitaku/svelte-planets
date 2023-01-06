# builder
FROM node:18-alpine as builder

WORKDIR /workspace
COPY . .
COPY package*.json ./

RUN npm install && npm run build

# node_modules
FROM node:18-alpine as node_modules

ENV NODE_ENV=production

WORKDIR /workspace
COPY . .
COPY package*.json ./

RUN npm install --omit=dev

# production
FROM gcr.io/distroless/nodejs:18

ENV NODE_ENV=production

WORKDIR /app
COPY package.json ./
COPY --from=builder /workspace/build build/
COPY --from=node_modules /workspace/node_modules node_modules/

EXPOSE 3000:3000

CMD [ "build/index.js" ]