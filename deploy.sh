#!/bin/sh

# /home/isucon/env.sh /home/isucon/webapp/go/build.sh
cd /home/ubuntu/cookpad

sudo service mysql restart

bundle exec rake db:migrate RAILS_ENV=production

sudo service nginx stop
sudo service supervisord reload
sudo service nginx start
sudo supervisorctl stop isucon_ruby
sudo supervisorctl start isucon_ruby
