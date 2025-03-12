FROM nginx:latest

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy our custom Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy website assets (assuming they are in a local 'assets' folder)
COPY bloom-2.20.0-assets/ /bloom/

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
