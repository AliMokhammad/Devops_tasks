sudo apt-get update
sudo apt-get install -y apache2

sudo cp /var/www/website1/website1.conf /etc/apache2/sites-available/website1.conf
# sudo cp /var/www/website2/website2.conf /etc/apache2/sites-available/website2.conf

sudo a2dissite 000-default.conf
sudo a2ensite website1.conf
# sudo a2ensite website2.conf

sudo cp -f /var/www/website2/apache2.conf /etc/apache2/apache2.conf

sudo ln -s /etc/apache2/mods-available/cgi.load /etc/apache2/mods-enabled/

sudo service apache2 reload

