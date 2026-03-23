FROM node:17

RUN useradd -m appuser

WORKDIR /var/src/

# Copy package.json
COPY ./src/package.json .

# Install dependencies as root
RUN npm install --unsafe-perm

# Copy rest of files
COPY ./src .

# Fix permissions for non-root user
RUN chown -R appuser:appuser /var/src

USER appuser

EXPOSE 3567
CMD ["node", "app.js"]
