FROM alpine:3.17

RUN  apk update && apk add nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
