FROM node:20-alpine
LABEL authors="orendev"

WORKDIR /opt/app

COPY package.json package.json
RUN npm install
COPY . .
ENV NODE_ENV production
RUN npm run build
RUN npm prune --production
CMD ["npm", "start"]
EXPOSE 3000