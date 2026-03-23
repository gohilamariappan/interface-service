FROM node:17

RUN useradd -m appuser

WORKDIR /var/src

# 1. Copy entire src BEFORE install (important!)
COPY ./src .

# 2. Install deps (root user)
RUN npm install --unsafe-perm

# 3. Fix permissions
RUN chown -R appuser:appuser /var/src

# 4. Run as non-root
USER appuser

EXPOSE 3567
CMD ["node", "app.js"]
