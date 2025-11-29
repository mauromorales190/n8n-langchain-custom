FROM n8nio/n8n:1.121.3

USER root

# Instalar paquetes globalmente en lugar de dentro de n8n
RUN npm install -g @n8n/n8n-nodes-langchain@1.121.1 --legacy-peer-deps && \
    npm install -g @blotato/n8n-nodes-blotato --legacy-peer-deps

# Crear directorio para community nodes si no existe
RUN mkdir -p /home/node/.n8n/nodes

# Copiar nodos instalados al directorio de n8n
RUN cp -r /usr/local/lib/node_modules/@n8n/n8n-nodes-langchain /home/node/.n8n/nodes/ || true && \
    cp -r /usr/local/lib/node_modules/@blotato/n8n-nodes-blotato /home/node/.n8n/nodes/ || true

# Dar permisos correctos
RUN chown -R node:node /home/node/.n8n

USER node

ENV NODE_ENV=production
