cd "$SRC_DIR"
auto/configure \
    --conf-path=etc/nginx/nginx.conf \
    --error-log-path=var/log/nginx/error.log \
    --http-client-body-temp-path=var/tmp/nginx/client \
    --http-fastcgi-temp-path=var/tmp/nginx/fastcgi \
    --http-log-path=var/log/nginx/access.log \
    --http-proxy-temp-path=var/tmp/nginx/proxy \
    --http-scgi-temp-path=var/tmp/nginx/scgi \
    --http-uwsgi-temp-path=var/tmp/nginx/uwsgi \
    --lock-path=var/run/nginx/nginx.lock \
    --pid-path=var/run/nginx/nginx.pid \
    --prefix='E:' \
    --with-cc=cl \
    --with-http_ssl_module \
    --with-openssl=YES \
    --with-pcre=YES \
    --with-pcre-jit \
    --with-stream \
    --without-http_gzip_module
nmake
ln objs/nginx.exe "$LIBRARY_BIN"
ln docs/text/LICENSE .
