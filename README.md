
mysql client is missing. You may need to 'apt-get install libmysqlclient-dev' or 'yum install mysql-devel', and try again.

Package libmysql-ruby has been phased out and replaced by ruby-mysql. This is where I found the solution

If the above command doesn't work because libmysql-ruby cannot be found, the following should be sufficient:

sudo apt-get install libmysqlclient-dev


ActiveRecord::ConnectionNotEstablished (No connection pool for ActiveRecord::Base):
rake db:create

$ ruby -v
ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-linux]

$ rails -v
Rails 4.2.8

rails generate model Comment commenter:string body:text article:references