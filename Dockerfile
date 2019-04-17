FROM node:8-alpine
LABEL maintainer="Matthew Barker, matthew@twistlock.com"
LABEL newbuild="true"

RUN npm install -g tough-cookie@2.3.1

WORKDIR /var/www
EXPOSE 3000
CMD ["npm", "start"]

