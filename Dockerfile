FROM n8nio/n8n:latest-debian

USER root

# Instalar community nodes
RUN npm install -g @blotato/n8n-nodes-blotato --legacy-peer-deps

USER node

ENV NODE_ENV=production
ENV N8N_COMMUNITY_PACKAGES_ENABLED=true
