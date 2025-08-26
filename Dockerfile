# Étape 1 : Build Angular
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build -- --configuration production

# Étape 2 : Nginx pour servir l'app
FROM nginx:1.25-alpine
LABEL maintainer="mehmedbamba <mehmedbamba098@gmail.com>"
ENV TZ=Europe/Paris
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
VOLUME ["/var/log/nginx"]
EXPOSE 80
