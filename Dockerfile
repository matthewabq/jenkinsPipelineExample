FROM node:9-alpine
LABEL maintainer="Matthew Barker, matthew@twistlock.com"
LABEL newbuild="3"

RUN apk update && apk upgrade

RUN npm install -g tough-cookie

WORKDIR /var/www
EXPOSE 3000
CMD ["npm", "start"]

