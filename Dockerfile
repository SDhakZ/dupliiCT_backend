FROM node:12-alpine

ENV PORT 1338
ENV HOST 0.0.0.0
ENV NODE_ENV production

#create app dir
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# INSTALL DEPS
COPY package*.json /urs/src/app/
COPY yarn.lock /urs/src/app/
RUN yarn INSTALL
COPY . /usr/src/app

RUN yarn build
EXPOSE 1338

CMD ["yarn","start"]