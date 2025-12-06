# Build image:
# docker build -t car-rental-portal-client .

# Run container:
# docker run -it -p 8100:8100 --rm car-rental-portal-client
FROM node:22-alpine
WORKDIR /app
RUN npm install -g @ionic/cli
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8100
CMD [ "ionic", "serve", "--external", "--no-open" ]
