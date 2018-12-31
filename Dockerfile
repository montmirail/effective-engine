#Start build phase
FROM node:carbon-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Start prod phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html