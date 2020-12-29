# To install node.js
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# To run the app
sudo systemctl daemon-reload
sudo systemctl enable nodeapp.service
sudo systemctl start nodeapp.service

# To install nginx, check the installation, and start it and the app.
sudo apt install nginx
sudo nginx -t
sudo systemctl restart nginx

# To get an HTTP certificate and secure the app with HTTPS
sudo add-apt-repository ppa:certbot/certbot && sudo apt install python3-certbot-nginx
sudo certbot --nginx -d example.com