# gitlab-local-server

# Purpose
- Set up an intranet Gitlab server for source version control

# Start the Docker Registry Server on the server machine
- Go to directory deployment/docker/gitlab-server
- Run ./docker_run.sh

# Client usage
- In browser, go to http://GITLAB-LOCAL-SERVER-IP:8980/ to manage Gitlab repos. GITLAB-LOCAL-SERVER-IP is the intranet Gitlab server IP or DNS name.
- The default admin user is "root@local" and the password is "apassword". Change user and password in docker_run.sh for better security.

# Reference
- https://docs.gitlab.com/ee/install/docker.html#install-gitlab-using-docker-engine
- https://docs.gitlab.com/12.10/omnibus/docker/
- https://docs.gitlab.com/runner/configuration/advanced-configuration.html