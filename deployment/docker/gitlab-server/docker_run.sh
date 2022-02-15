CONTAINER_NAME="gitlab-local-server"

sudo docker stop ${CONTAINER_NAME}
sudo docker rm -f ${CONTAINER_NAME}

sudo iptables -I INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 8943 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 8980 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 8922 -j ACCEPT

sudo mkdir -p /local/var/lib/gitlab
sudo mkdir -p /local/var/lib/gitlab/config
sudo mkdir -p /local/var/lib/gitlab/logs
sudo mkdir -p /local/var/lib/gitlab/data

export DATA_DIR=/local/var/lib/gitlab

sudo docker run -it -d \
    --privileged=true \
    --name ${CONTAINER_NAME} \
    --restart unless-stopped \
    -e GITLAB_ROOT_EMAIL="root@local" \
    -e GITLAB_ROOT_PASSWORD="apassword" \
    --publish 8943:443 \
    --publish 8980:80 \
    --publish 8922:22 \
    --volume ${DATA_DIR}/config:/etc/gitlab \
    --volume ${DATA_DIR}/logs:/var/log/gitlab \
    --volume ${DATA_DIR}/data:/var/opt/gitlab \
    gitlab/gitlab-ce:latest