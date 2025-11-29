FROM n8nio/n8n:1.121.3

USER root

# Instalar dependencias del sistema necesarias
RUN apk add --no-cache python3 py3-pip make g++

# Downgrade openai a versión compatible con LangChain
RUN cd /usr/local/lib/node_modules/n8n && \
    npm uninstall openai && \
    npm install openai@4.62.1 --legacy-peer-deps

# Ahora instalar LangChain con la versión correcta de openai
RUN cd /usr/local/lib/node_modules/n8n && \
    npm install @n8n/n8n-nodes-langchain@1.121.1 --legacy-peer-deps

# Instalar otros community nodes
RUN cd /usr/local/lib/node_modules/n8n && \
    npm install @blotato/n8n-nodes-blotato --legacy-peer-deps

# Fix permisos
RUN chown -R node:node /usr/local/lib/node_modules/n8n

USER node

ENV NODE_ENV=production
