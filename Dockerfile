# build stage
FROM node:lts-alpine as build-stage
WORKDIR /app
COPY todo-app-front/package*.json ./
RUN npm install
COPY todo-app-front .
RUN npm run build

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
