FROM node:18   # Node 17 is unstable

RUN useradd -m appuser

WORKDIR /var/src/

COPY ./src/package.json .
RUN chown -R appuser:appuser /var/src

USER appuser

RUN npm install --unsafe-perm

COPY --chown=appuser:appuser ./src .

EXPOSE 3567
CMD ["node", "app.js"]
