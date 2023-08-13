FROM node:lts-alpine as builder

WORKDIR /app
COPY package.json .
COPY .env .

RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine

COPY --from=builder /app/build /usr/share/nginx/html