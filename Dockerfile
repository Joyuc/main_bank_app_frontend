FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm config set registry https://registry.npmjs.org/ && \
    npm cache clean --force

RUN npm install --save-dev @babel/plugin-proposal-private-property-in-object \
    && npm install react react-dom @types/react @types/react-dom \
    && npm install react-scripts@5.0.1 --save \
    && npm install \
    && npm audit fix --force || echo "Continuing despite npm audit fix failures"

COPY . .

EXPOSE 3000
CMD ["npm", "start"]
