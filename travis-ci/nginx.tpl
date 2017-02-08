error_log /tmp/error.log;
pid /tmp/nginx.pid;
worker_processes 1;

events {
	worker_connections 1024;
	multi_accept on;
    use epoll;
}

http {
    client_body_temp_path /tmp/client_body;
    fastcgi_temp_path /tmp/fastcgi_temp;
    proxy_temp_path /tmp/proxy_temp;
    scgi_temp_path /tmp/scgi_temp;
    uwsgi_temp_path /tmp/uwsgi_temp;

    ##
    # Basic Settings
    ##
    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;
    types_hash_max_size 2048;
	server_names_hash_bucket_size 64;
	server_names_hash_max_size 4096;

    # Custom Configurations
    # **********************
    # Add any custom configurations to Nginx here

    include /etc/nginx/mime.types;
    default_type application/octet-stream;
    
    ##
    # Logging Settings
    ##
    access_log /tmp/access.log;
    error_log /tmp/error.log;

    ##
    # Gzip Settings
    ##
	gzip on;
	gzip_disable "MSIE [1-6]\.";
	gzip_vary on;
	gzip_static on;
	gzip_min_length 20;
	gzip_proxied expired no-cache no-store private auth;
	gzip_comp_level 7;
	gzip_buffers 32 4k;
	gzip_http_version 1.1;
	gzip_types text/plain text/css application/json application/javascript application/x-javascript text/xml application/xml application/xml+rss text/javascript;

    ##
    # Virtual Host Configs
    ##
    include {DIR}/nginx/conf.d/*.conf;
    include {DIR}/nginx/sites-enabled/*;

    upstream php {
        server 127.0.0.1:{PORT};
    }
}