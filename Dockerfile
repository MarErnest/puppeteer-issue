FROM node:16.13.2

WORKDIR /app

RUN apt-get update && apt-get install -y procps && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
  && apt-get install -y chromium \
  fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 \
  --no-install-recommends

RUN npm install -g yarn --force

RUN npm config set registry http://registry.npmjs.org

ADD package.json /app/package.json

ADD yarn.lock /app/yarn.lock

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

ENV PUPPETEER_EXECUTABLE_PATH /usr/bin/chromium

RUN yarn

ADD . /app

EXPOSE 3000 9229
