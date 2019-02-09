# Dir containing makefile.
ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

DHPARAMS=$(ROOT_DIR)/nginx/ssl/dhparam.pem
SSLKEY=$(ROOT_DIR)/nginx/ssl/self-signed.key
SSLCERT=$(ROOT_DIR)/nginx/ssl/self-signed.crt

.PHONY: nginx
nginx: | $(DHPARAMS) $(SSLKEY) $(SSLCERT)

$(DHPARAMS):
	openssl dhparam -out $(DHPARAMS) 2048

$(SSLKEY) $(SSLCERT):
	openssl req -newkey rsa:2048 -nodes -config openssl.cnf -keyout $(SSLKEY) -x509 -days 365 -out $(SSLCERT)
