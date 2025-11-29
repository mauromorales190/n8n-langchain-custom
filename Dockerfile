FROM n8nio/n8n:1.121.3

USER root

# Actualizar npm
RUN npm install -g npm@latest

# Instalar nodos de LangChain
RUN cd /usr/local/lib/node_modules/n8n && \
    npm install --legacy-peer-deps @n8n/n8n-nodes-langchain@1.121.1

# Instalar otros community nodes
RUN cd /usr/local/lib/node_modules/n8n && \
    npm install --legacy-peer-deps @blotato/n8n-nodes-blotato

USER node

ENV NODE_ENV=production
