# Owncloud Docker Image

Lightwight Docker image for the (latest) Owncloud based on [AlpineLinux](http://alpinelinux.org)

* MySQL backend, but not bundled
* Image size only ~100MB !
* Tiny preconfiguration
* Very new packages (alpine:edge) 2015-04-03:
  * [Owncloud](http://pkgs.alpinelinux.org/package/main/x86/owncloud) 8.0.2
  * [PHP](http://pkgs.alpinelinux.org/package/main/x86/php) 5.6.7
  * [Nginx](http://pkgs.alpinelinux.org/package/main/x86/nginx) 1.6.2
  
  
### Usage
```bash
sudo docker run -v /data:/DATA -p 80:80 psitrax/owncloud
```

### Volume structure

* `data`: Owncloud user data (uploads)
* `config`: Owncloud config
* `apps`: Custom Owncloud apps
* `logs`: Nginx/PHP/Owncloud error logs
