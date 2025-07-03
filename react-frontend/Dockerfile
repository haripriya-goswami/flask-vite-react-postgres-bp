FROM node:20-slim

# Set working directory
WORKDIR /app

ENV FORCE_ROLLUP=1

# Copy package.json and lock file
COPY package.json ./
RUN npm install

# Copy rest of the app
COPY . .

# Expose the dev server port
EXPOSE 5173

# Start Vite dev server
CMD ["npm", "run", "dev", "--", "--host"]
