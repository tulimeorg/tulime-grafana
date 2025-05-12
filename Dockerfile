FROM grafana/grafana:9.5.15

ENV GF_SECURITY_ADMIN_PASSWORD=tulimeadmin \
    GF_SECURITY_ADMIN_USER=tulimeadmin \
    GF_SERVER_HTTP_PORT=3000

RUN grafana-cli plugins install grafana-piechart-panel && \
    grafana-cli plugins install grafana-worldmap-panel && \
    grafana-cli plugins install grafana-clock-panel && \
    grafana-cli plugins install vonage-status-panel && \
    grafana-cli plugins install michaeldmoore-multistat-panel && \
    grafana-cli plugins install natel-discrete-panel && \
    grafana-cli plugins install grafana-simple-json-datasource && \
    grafana-cli plugins install grafana-kubernetes-app

COPY provisioning/datasources/datasource.yml /etc/grafana/provisioning/datasources/

COPY provisioning/dashboards/dashboard.yml /etc/grafana/provisioning/dashboards/

EXPOSE 3000

# DOCKER RUN COMMANDS
# sudo docker build -t tulime-grafana-image .
# sudo docker run -p 3000:3000 tulime-grafana-image
