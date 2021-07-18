FROM node as build
WORKDIR /build
COPY package*.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
WORKDIR /app
COPY --from=build /build/dist/template /usr/share/nginx/html/