FROM node:8.11
WORKDIR /usr/src/app
# Create application folders
RUN mkdir client
RUN mkdir server
RUN mkdir public
# Install dependencies
COPY ./package.json .
COPY ./package-lock.json .
RUN npm install --silent
# Copy existing files
COPY ./client ./client
COPY ./public ./public
COPY ./server ./server
COPY ./webpack.config.js .
COPY ./.babelrc .
COPY ./secrets.js .
COPY ./script/seed.js ./script/seed.js

CMD ["npm", "run", "start-dev"]
