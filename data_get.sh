# save a query from mysql database to output
mysql -u <username> -p <database> -e 'select <columns> from <table> where <condition>;' >
output
