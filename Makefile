# Dir containing makefile.
ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

SSLDIR=$(ROOT_DIR)/nginx/ssl
DHPARAMS=$(SSLDIR)/dhparam.pem
SSLKEY=$(SSLDIR)/self-signed.key
SSLCERT=$(SSLDIR)/self-signed.crt

.PHONY: nginx
nginx: | $(DHPARAMS) $(SSLKEY) $(SSLCERT)

$(DHPARAMS): | $(SSLDIR)
	openssl dhparam -out $(DHPARAMS) 2048

$(SSLKEY) $(SSLCERT): | $(SSLDIR)
	openssl req -newkey rsa:2048 -nodes -keyout $(SSLKEY) -x509 -days 365 -out $(SSLCERT)

$(SSLDIR):
	mkdir -p $(SSLDIR)
