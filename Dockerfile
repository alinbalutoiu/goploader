FROM scratch

ADD goploader-server/server /server
ADD server/assets /assets
ADD server/templates /templates

# COPY server/conf.yml conf.yml

CMD ["/server", "--conf=/goploader/config.yaml"]
