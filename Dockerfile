FROM node:12.2.0 as node
LABEL Dongbox="<sfreebobo@163.com>"

RUN npm config set registry https://registry.npm.taobao.org
RUN npm install -g gatsby yarn
COPY ./ /code/
WORKDIR /code

RUN echo "deb http://mirrors.cloud.tencent.com/debian stretch main contrib non-free \
deb http://mirrors.cloud.tencent.com/debian stretch-updates main contrib non-free \
deb http://mirrors.cloud.tencent.com/debian stretch-backports main contrib non-free \
deb http://mirrors.cloud.tencent.com/debian stretch-proposed-updates main contrib non-free \
deb-src http://mirrors.cloud.tencent.com/debian stretch main contrib non-free \ 
deb-src http://mirrors.cloud.tencent.com/debian stretch-updates main contrib non-free \ 
deb-src http://mirrors.cloud.tencent.com/debian stretch-backports main contrib non-free \
deb-src http://mirrors.cloud.tencent.com/debian stretch-proposed-updates main contrib non-free" > /etc/apt/sources.list

RUN apt-get update && apt-get -y install build-essential libpng-dev

RUN yarn
RUN npm run build

# nginx
FROM nginx:1.13.12-alpine
#ARG NODE_ENV
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=node /code/public /usr/share/nginx/html
# delete moddule
RUN rm -rf node_module

