# Start from the official Node image
FROM node:16

# Install optional packages often needed for compiling native modules
RUN apt-get update && apt-get install -y \
  build-essential \
  python3 \
  python3-pip \
  git \
  && rm -rf /var/lib/apt/lists/*

# Set a working directory
WORKDIR /app

# Copy package files and install dependencies
# If you also use Yarn, you can run `npm install -g yarn` or switch to Yarn commands below.
COPY package*.json ./
RUN npm install

# Optional: Install global dev tools, like nodemon for live reloading
RUN npm install -g nodemon

# Copy the rest of your source code
COPY . .

# Expose a port if needed by your app (e.g., 3000)
EXPOSE 3000

# If you have a dev script that runs nodemon or similar, you can do this:
#CMD ["npm", "run", "dev"]

# Otherwise, for a typical production start:
CMD ["npm", "start"]
