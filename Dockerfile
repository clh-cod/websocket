FROM node as build
WORKDIR /app
COPY package.json websocket.js ./
RUN npm install

FROM astefanutti/scratch-node
WORKDIR /app
COPY --from=build /app /app
EXPOSE 3000
CMD ["websocket.js"]
