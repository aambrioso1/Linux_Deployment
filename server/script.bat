# To install node.js
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# To copy service file to the correct folder
cp /apps/Linux_Deployment/server/app.service /etc/systemd/system/app.service

# To run the app
sudo systemctl daemon-reload
sudo systemctl enable app.service
sudo systemctl start app.service

# To check if app is running correctly
localhost:<port number>

# To copy nginx file to the correct folder
cp /apps/Linux_Deployment/server/app.com.conf /etc/nginx/sites-enabled/app.com.conf


# To install nginx (if necessary), check the installation, and start it and the app.
sudo apt install nginx
sudo nginx -t
sudo systemctl restart nginx

# To get an HTTP certificate and secure the app with HTTPS
sudo add-apt-repository ppa:certbot/certbot && sudo apt install python3-certbot-nginx
sudo certbot --nginx -d example.com