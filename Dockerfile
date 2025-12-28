FROM node:18-bullseye

# Install Python & Tesseract
RUN apt-get update && \
    apt-get install -y python3 python3-pip tesseract-ocr && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy files
COPY . .

# Install Node deps
RUN npm install

# Install Python deps
RUN pip3 install -r requirements.txt

# Expose port
EXPOSE 3000

# Start API
CMD ["node", "impds_aa.js"]
