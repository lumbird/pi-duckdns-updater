# Use a base image
FROM alpine:latest

# Install curl

RUN apk --no-cache add curl iproute2 gawk coreutils

# Copy the script into the image
COPY duckdns_update.sh /duckdns_update.sh

# Copy the run script to the root
COPY run.sh /run.sh

# Make sure the script is present
RUN ls -l

# Make the script executable
RUN chmod +x /duckdns_update.sh
RUN chmod +x /run.sh

# Run the script periodically using cron
RUN echo "*/10 * * * * /duckdns_update.sh >/dev/null 2>&1" > /etc/crontabs/root

# Start cron
CMD ["/run.sh"]