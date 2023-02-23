install: 
	@doas -u root mkdir -p /var/www/htdocs/capsulecorp.org
	@doas -u root cp -r assets /var/www/htdocs/capsulecorp.org
	@doas -u root cp *.html /var/www/htdocs/capsulecorp.org
	@doas -u root cp -r txt /var/www/htdocs/capsulecorp.org
	@doas -u root cp -r book /var/www/htdocs/capsulecorp.org
	@doas -u root cp *.txt /var/www/htdocs/capsulecorp.org
	@doas -u root mkdir -p /var/www/htdocs/www.capsulecorp.org
	@doas -u root cp -r assets /var/www/htdocs/www.capsulecorp.org
	@doas -u root cp *.html /var/www/htdocs/www.capsulecorp.org
	@doas -u root cp -r txt /var/www/htdocs/www.capsulecorp.org
	@doas -u root cp -r book /var/www/htdocs/www.capsulecorp.org
	@doas -u root cp *.txt /var/www/htdocs/www.capsulecorp.org
