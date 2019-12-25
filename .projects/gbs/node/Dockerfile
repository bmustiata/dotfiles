FROM node:12 as node-build

COPY /package*.json /project/
RUN cd /project && \
    npm install

COPY / /project
RUN cd /project && \
    npm run build

FROM nginx
COPY --from=node-build /project/dist /usr/share/nginx/html

