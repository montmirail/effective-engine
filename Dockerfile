#Start build phase
FROM node:carbon-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Start prod phase
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html