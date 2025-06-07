FROM node:20

# Create app directory
WORKDIR /app

# Install deps
COPY package*.json ./
RUN npm install

# Copy rest of app
COPY . .

# Build the app
RUN npm run build

# Expose port Dokku expects
ENV PORT 8080
EXPOSE 8080

# Start SvelteKit SSR server
CMD ["node", "build/index.js"]
