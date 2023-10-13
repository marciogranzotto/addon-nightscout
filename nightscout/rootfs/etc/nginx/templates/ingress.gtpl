server {
    listen {{ .interface }}:8099 default_server;

    include /etc/nginx/includes/server_params.conf;

    allow   172.30.32.2;
    deny    all;

    location / {
        proxy_set_header Accept-Encoding "";
        proxy_redirect off;
        proxy_pass http://127.0.0.1:1337;

        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $connection_upgrade;
        proxy_set_header Authorization "";

        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header Host $http_host;
        proxy_set_header X-NginX-Proxy true;
        proxy_hide_header X-Frame-Options;

        proxy_connect_timeout 600s;
        proxy_send_timeout 600s;
        proxy_read_timeout 600s;

        sub_filter_types text/css text/xml application/javascript;
        sub_filter 'href="/' 'href="$http_x_ingress_path/';
        sub_filter '<script src="/' '<script src="$http_x_ingress_path/';
        sub_filter "top.location.href='" "top.location.href='$http_x_ingress_path";
        sub_filter 'ajax("/' 'ajax("$http_x_ingress_path/';
        sub_filter 'url:"/' 'url:"$http_x_ingress_path/';
        sub_filter '/api/v1' '$http_x_ingress_path/api/v1';
        sub_filter '/api/v2' '$http_x_ingress_path/api/v2';
        sub_filter '/translations/' '$http_x_ingress_path/translations/';
        sub_filter '"socket.io/' '"$http_x_ingress_path/socket.io/';
        sub_filter '"/socket.io"' '"$http_x_ingress_path/socket.io"';
        sub_filter "'/sw.js'" "'$http_x_ingress_path/sw.js'";

        sub_filter_once off;
    }
}
