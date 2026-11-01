# Build the Frontend [dist folder]
# Copy the dist folder content in Backend/public folder
# node:22-alpine is lastest node version for linux
# Reviso due to CT
FROM node:22-alpine as frontend-builder

COPY ./Frontend /app

WORKDIR /app

RUN npm install

RUN npm run build

# Build the Backend
FROM node:22-alpine

COPY ./Backend /app

WORKDIR /app

RUN npm install

COPY --from=frontend-builder /app/dist /app/public

CMD ["node", "server.js"]