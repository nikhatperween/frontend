# Stage 1: Build the Angular app
FROM node:16 AS build

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Angular app for production
RUN npm run build --prod

# Stage 2: Serve the app with Nginx
FROM nginx:alpine

# Copy the built Angular app from the previous stage
COPY --from=build /app/dist/your-angular-app /usr/share/nginx/html

# Copy custom Nginx configuration file (if any)
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
