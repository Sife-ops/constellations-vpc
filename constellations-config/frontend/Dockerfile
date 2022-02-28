FROM node:16.13-alpine AS builder
ENV NODE_OPTIONS=--max_old_space_size=1400
ENV VITE_PROD_URL=<++>
ENV VITE_RECAPTCHA_KEY=<++>
WORKDIR /build
COPY package.json .
COPY package-lock.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
EXPOSE 80
COPY ./default.conf /etc/nginx/conf.d/default.conf
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /build/dist/ /usr/share/nginx/html
ENTRYPOINT ["nginx", "-g", "daemon off;"]

