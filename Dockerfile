FROM node:14-alpine

ENV PORT 1338
ENV HOST 0.0.0.0
ENV NODE_ENV production

#create app dir
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# INSTALL DEPS
COPY package*.json /usr/src/app/
RUN npm install
COPY . /usr/src/app

RUN npm run build
EXPOSE 1338

CMD ["npm","start"]