# # =========================
# # 1️⃣ Build stage
# # =========================
# FROM node:20-slim AS builder

# WORKDIR /usr/src/medivyx

# # Copy only manifests first (cache-friendly)
# COPY package.json package-lock.json ./
# COPY packages/server/package.json packages/server/
# COPY packages/core/package.json packages/core/

# # Install ALL deps (including dev)
# RUN npm ci

# # Copy full source
# COPY . .

# # Build server
# RUN npm run build --workspace=packages/server


# # =========================
# # 2️⃣ Runtime stage
# # =========================
# FROM node:20-slim

# ENV NODE_ENV=production
# WORKDIR /usr/src/medivyx

# # Copy only what runtime needs
# COPY --from=builder /usr/src/medivyx/node_modules ./node_modules
# COPY --from=builder /usr/src/medivyx/packages ./packages
# COPY --from=builder /usr/src/medivyx/package.json ./package.json

# # Security: non-root user
# RUN groupadd -r medivyx && \
#     useradd -r -g medivyx medivyx && \
#     chown -R medivyx:medivyx /usr/src/medivyx

# USER medivyx

# EXPOSE 8103

# ENTRYPOINT ["node","--require","./packages/server/dist/otel/instrumentation.js","packages/server/dist/index.js"]


FROM node:20-slim

WORKDIR /usr/src/medivyx

COPY package.json package-lock.json ./
RUN npm ci

COPY . .

EXPOSE 8103

CMD ["npm","run","dev","--workspace=packages/server"]


