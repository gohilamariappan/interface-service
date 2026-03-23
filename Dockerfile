FROM node:17

# Create user
RUN useradd -m appuser

# Create workdir
WORKDIR /var/src

# Copy only package.json first (better layer caching)
COPY ./src/package.json ./

# If you use private packages
# COPY .npmrc ./

# Install deps
RUN npm install --unsafe-perm

# Copy full source
COPY --chown=appuser:appuser ./src .

# Set permissions AFTER copy
RUN chown -R appuser:appuser /var/src

# Switch to non-root
USER appuser

EXPOSE 3567
CMD ["node", "app.js"]
