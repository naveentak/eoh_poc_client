FROM node:latest



# Create app directory
WORKDIR /usr/src/apiclient

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY *.json ./

RUN npm install && \
    npm install axios --save
    
# If you are building your code for production
# RUN npm install --only=production
# Bundle app source
COPY . .


EXPOSE 8080
CMD [ "npm", "start"]