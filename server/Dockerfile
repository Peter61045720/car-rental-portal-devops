# Build image:
# docker build -t car-rental-portal-server .

# Run container:
# docker run -it -p 5000:5000 --rm car-rental-portal-server
FROM node:22-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 5000
CMD [ "npm", "start" ]