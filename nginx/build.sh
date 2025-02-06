cd "$SRC_DIR"
./configure \
    --conf-path=etc/nginx/nginx.conf \
    --error-log-path=var/log/nginx/error.log \
    --http-client-body-temp-path=var/lib/nginx/client \
    --http-fastcgi-temp-path=var/lib/nginx/fastcgi \
    --http-log-path=var/log/nginx/access.log \
    --http-proxy-temp-path=var/lib/nginx/proxy \
    --http-scgi-temp-path=var/lib/nginx/scgi \
    --http-uwsgi-temp-path=var/lib/nginx/uwsgi \
    --lock-path=run/lock/nginx.lock \
    --pid-path=run/nginx.pid \
    --prefix='E:' \
    --with-cc=cl \
    --with-http_ssl_module \
    --with-openssl=YES \
    --with-pcre=YES \
    --with-pcre-jit \
    --with-stream \
    --without-http_gzip_module
CL='/DFD_SETSIZE#1024' nmake
ln objs/nginx.exe "$LIBRARY_BIN"
