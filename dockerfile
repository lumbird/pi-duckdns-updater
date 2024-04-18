# Use a base image
FROM alpine:latest

# Install curl
RUN apk --no-cache add curl iproute2 gawk coreutils

# Copy the scripts into the image
COPY *.sh /

# Enable debugging and set permissions for scripts
RUN set -xe && chmod a+x /*.sh

# Run the script periodically using cron
RUN echo "*/10 * * * * /duckdns.sh >/dev/null 2>&1" > /etc/crontabs/root

# Start cron
CMD ["/run.sh"]