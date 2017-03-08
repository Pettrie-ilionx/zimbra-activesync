
# ActiveSync for Zimbra with Z-push and Autodiscover

https://github.com/Pettrie-ilionx/zimbra-activesync

ref
* Docker HTTPD = Apache https://hub.docker.com/_/httpd/
* Z-push Docker https://github.com/fbartels/z-push-docker/blob/master/Dockerfile
* Create Docker image https://github.com/geronimp/graftM-docker/tree/master/graftm_0.9.3-docker_img
* Z-Push Wiki https://wiki.z-hub.io/display/ZP/Documentation
* Z-Push + Zimbra https://vwiki.co.uk/Z-Push_v2_with_Zimbra#Z-Push_Config

## Get started

It's very simple, first, get it :

```bash
docker pull camillebaronnet/zimbra-activesync
```

And run it :

```bash
docker run -d \
	-p 80:80 \
	-e ZIMBRA_HOST=mail.tryfirst.eu \
	-e ZPUSH_URL=mobile.tryfirst.eu \
	--name zimbra-activesync
	tryfirst/zimbra-activesync
```

## From Github

Clone from the Github project, build it and launch it

```bash
git pull https://github.com/Pettrie-ilionx/zimbra-activesync.git
cd zimbra-activesync
docker build -t tryfirst/zimbra-activesync .
docker run [...] zimbra-activesync
```
