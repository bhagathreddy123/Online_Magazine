
mysql client is missing. You may need to 'apt-get install libmysqlclient-dev' or 'yum install mysql-devel', and try again.

Package libmysql-ruby has been phased out and replaced by ruby-mysql. This is where I found the solution

If the above command doesn't work because libmysql-ruby cannot be found, the following should be sufficient:

sudo apt-get install libmysqlclient-dev


ActiveRecord::ConnectionNotEstablished (No connection pool for ActiveRecord::Base):
rake db:create