# Build stage
FROM node:18-alpine AS builder

WORKDIR /app

# Copy package files
COPY package*.json ./

# Ensure npm is up to date and install dependencies
RUN npm install -g npm@latest && \
    npm install

# Copy project files
COPY . .

# Build the project
RUN npm run build

# Production stage with Nginx
FROM nginx:alpine AS production

# Remove default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy built files from builder stage
COPY --from=builder /app/build /usr/share/nginx/html

# Optional: Copy custom nginx configuration if needed
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 (default for nginx)
EXPOSE 3000

# Nginx will start automatically, no need for CMD
CMD [ "nginx", "-g", "daemon off;" ]