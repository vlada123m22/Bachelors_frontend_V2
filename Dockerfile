FROM nginx:alpine

# Install envsubst
RUN apk add --no-cache gettext

# Copy template
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

# Copy frontend
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Use a custom entrypoint to substitute __BACKEND_URL__ with http://$BACKEND_HOST:$BACKEND_PORT
# Then start nginx
CMD sh -c 'export BACKEND_URL="http://${BACKEND_HOST:-localhost}:${BACKEND_PORT:-8080}" && \
           envsubst '\''__BACKEND_URL__'\'' < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf && \
           nginx -g "daemon off;"'