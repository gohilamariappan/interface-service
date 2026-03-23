FROM node:17

RUN useradd -m appuser

WORKDIR /var/src

# Copy entire src BEFORE npm install
# So local file modules are available
COPY ./src . 

# Install dependencies as root
RUN npm install --unsafe-perm

# Fix permissions
RUN chown -R appuser:appuser /var/src

USER appuser

EXPOSE 3567
CMD ["node", "app.js"]
