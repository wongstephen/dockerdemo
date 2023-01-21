FROM node:19

# app souce code
WORKDIR /app

# install and cache dependentcies 
# 2 args package json and where to copy it (current working dir)
COPY package*.json ./

RUN npm install

# copy source code
COPY . .  

ENV PORT=8080

# 8080 is exposed by not accessible to outside
EXPOSE 8080

# one per docker file
# exec form, does not start shell
# add start script to package json if necessary
CMD ["npm", "start"]

# flag with name and path to docker file
# $ docker build -t wongstephen/dockerdemo:1.0 .

# port forward with -p flag: map 5000 to 8080
# $ docker run -p 5000:8080 wongstephen/dockerdemo:1.0  
# can also name the container --name demoapp