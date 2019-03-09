# Apache-PHP-for-Docker
Latest Apache, PHP7.0 and a couple of PHP7.0 modules including MongoDB and MySQL drivers. Dockerfile for image

## Usage:
#### One-Time Testing: 
- docker run --rm -p **OutgoingHTTP**:80 -p **OutgoingHTTPS**:443 -v **LocalHTMLDirectory**:/var/www/html:ro zharry/apache-php

#### Background:
- docker run -p **OutgoingHTTP**:80 -p **OutgoingHTTPS**:443 -v **LocalHTMLDirectory**:/var/www/html:ro -d zharry/apache-php

### Base Image:
- ubuntu:latest (16.04)

### Installed Packages:
- Apache2
- PHP7.0
- OpenSSL

### PHP7.0 Modules:
- MySQL
- MongoDB
- CUrl
- GD
- MCrypt
- JSON
- APCu
- XML
- MBString

### Ports:
- 80 for HTTP
- 443 for HTTPS
