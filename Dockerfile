FROM node:6
# FROM_DIGEST sha256:24

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

ENV XMPP_NAME Kaiwa
ENV XMPP_DOMAIN example.com
ENV XMPP_WSS wss://example.com:5281/xmpp-websocket/
ENV XMPP_MUC chat.example.com
ENV XMPP_STARTUP groupchat/room%40chat.example.com
ENV XMPP_ADMIN admin

ENV LDAP_HOST container
ENV LDAP_DN cn=admin,dc=example.com
ENV LDAP_PWD password
ENV LDAP_GROUP mygroup
ENV LDAP_USER_BASE ou=users,dc=example.com
ENV LDAP_GROUP_BASE ou=groups,dc=example.com

RUN apt-get install -y --no-install-recommends --no-install-suggests git

#RUN locale-gen en_US && locale-gen en_US.UTF-8 && echo 'LANG="en_US.UTF-8"' > /etc/default/locale

RUN git clone https://github.com/ForNeVeR/kaiwa.git

RUN cd kaiwa && npm install

RUN cd kaiwa && cp dev_config.example.json dev_config.json

RUN cd kaiwa && npm run compile

ADD app /app

RUN chmod +x /app/start.sh
CMD "/app/start.sh"
