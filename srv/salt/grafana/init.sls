{% from 'docker/build.sls' import compose_build with context %}
{% from 'docker/up.sls' import compose_up with context %}

include:
  - grafana.datasources
  - grafana.dashboards

{{ compose_build('grafana') }}
{{ compose_up('grafana') }}

url-grafana:
  grains.list_present:
    - name: url-backend
    - value: grafana, http://{{ grains['ip4_interfaces']['eth0'][0] }}:3000