# Use a base image
FROM alpine:latest

# Install curl
RUN apk --no-cache add curl

# Set environment variables
ENV DOMAIN=mydomain \
    TOKEN=aaaabbbb-cccc-4444-8888-ddeeff001122

# Copy the script into the image
COPY duckdns_update.sh /duckdns_update.sh

# Make the script executable
RUN chmod +x /duckdns_update.sh

# Run the script periodically using cron
RUN echo "*/10 * * * * /duckdns_update.sh >/dev/null 2>&1" > /etc/crontabs/root

# Start cron
CMD ["crond", "-f"]
