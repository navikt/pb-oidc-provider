FROM qlik/simple-oidc-provider:0.1.2
COPY *.json /customConfig/

ENV CONFIG_FILE=/customConfig/config.json
ENV USERS_FILE=/customConfig/users.json
