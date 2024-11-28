FROM nginx:alpine

# Remove default nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

# Optional: Add SSL certificates if needed
# COPY ssl/ /etc/nginx/ssl/

# Set permissions
RUN chown -R nginx:nginx /etc/nginx

EXPOSE 80 443