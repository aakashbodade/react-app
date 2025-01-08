FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:latest
COPY --from=0 /app/build /usr/share/nginx/html
EXPOSE 80

CMD ["nginx","-g","daemon off;"]

