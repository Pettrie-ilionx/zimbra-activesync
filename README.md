
# ActiveSync for Zimbra with Z-push and Autodiscover

https://github.com/Pettrie-ilionx/zimbra-activesync

ref
* Docker HTTPD = Apache https://hub.docker.com/_/httpd/
* Z-push Docker https://github.com/fbartels/z-push-docker/blob/master/Dockerfile
* Create Docker image https://github.com/geronimp/graftM-docker/tree/master/graftm_0.9.3-docker_img
* Z-Push Wiki https://wiki.z-hub.io/display/ZP/Documentation
* Z-Push + Zimbra https://vwiki.co.uk/Z-Push_v2_with_Zimbra#Z-Push_Config

* Docker NGinx - LetsEncrypt https://hub.docker.com/r/jrcs/letsencrypt-nginx-proxy-companion/

## Get started

It's very simple, first, get it :

```bash
docker pull camillebaronnet/zimbra-activesync
```

And run it :

```bash
docker run -d -p 4201:80 -e ZIMBRA_HOST=mail.tryfirst.eu -e ZPUSH_URL=mobile.tryfirst.eu --name zimbra-activesync tryfirst/zimbra-activesync
```

docker commit [CONTAINER_ID] temporary_image
docker run --entrypoint=bash -it temporary_image

wget --quiet http://download.z-push.org/final/2.3/z-push-2.3.5.tar.gz -O- | tar zx -C . --strip-components=1

## From Github

Clone from the Github project, build it and launch it

```bash
git pull https://github.com/Pettrie-ilionx/zimbra-activesync.git
cd zimbra-activesync
docker build -t tryfirst/zimbra-activesync .
docker run [...] zimbra-activesync
```

## test autodiscover

* http://localhost:4201/Autodiscover/Autodiscover.xml
* Add headers:
    * Content-Type      text/xml
    * Authorization     Basic dGltQGJpbnN0YXIubmw6MTJ0aW05OA==

**Mobile**
```xml
<?xml version="1.0" encoding="utf-8" ?>
<Autodiscover xmlns="http://schemas.microsoft.com/exchange/autodiscover/mobilesync/requestschema/2006">
<Request>
<AcceptableResponseSchema>http://schemas.microsoft.com/exchange/autodiscover/mobilesync/responseschema/2006</AcceptableResponseSchema>
<EMailAddress>info@tryfirst.eu</EMailAddress>
</Request>
</Autodiscover>
```

**outlook**
```xml
<?xml version="1.0" encoding="utf-8" ?>
<Autodiscover xmlns="http://schemas.microsoft.com/exchange/autodiscover/outlook/requestschema/2006">
<Request>
<AcceptableResponseSchema>http://schemas.microsoft.com/exchange/autodiscover/outlook/responseschema/2006a</AcceptableResponseSchema>
<EMailAddress>info@tryfirst.eu</EMailAddress>
</Request>
</Autodiscover>
```