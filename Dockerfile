FROM node:18-slim

WORKDIR /app

# Pehle sirf package files copy karo taaki caching use ho sake
COPY package*.json ./

# Sabse zaruri step: Rollup ke linux architecture ko explicitly install karna
RUN npm install
RUN npm install @rollup/rollup-linux-x64-gnu

COPY . .

EXPOSE 5173

# Vite ko 0.0.0.0 par bind karna zaruri hai taaki Docker ke bahar dikhe
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
