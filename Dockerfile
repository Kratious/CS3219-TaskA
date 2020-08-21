FROM nginx:alpine
 
COPY nginx.conf /etc/nginx/nginx.conf

# alpine docker doesn't have bash installed by default
RUN apk update && apk add bash