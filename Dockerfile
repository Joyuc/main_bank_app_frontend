# Use official Node.js lightweight image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy dependency files first (for caching)
COPY package*.json ./

# Use npm registry and clear cache
RUN npm config set registry https://registry.npmjs.org/ && npm cache clean --force

# Installing dependencies (includes react-scripts from package.json)
RUN npm install

# Copy the rest of your app
COPY . .

# Expose React dev server port
EXPOSE 3000

# Start the app (development mode)
CMD ["npm", "start"]
