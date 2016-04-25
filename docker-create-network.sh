
# https://docs.docker.com/engine/userguide/networking/work-with-networks/#linking-containers-in-user-defined-networks

docker network create \
  -o "com.docker.network.bridge.name"="my-bridge" \
  -o "com.docker.network.bridge.enable_icc"="true" \
  -o "com.docker.network.bridge.enable_ip_masquerade"="true" \
  -o "com.docker.network.bridge.host_binding_ipv4"="0.0.0.0" \
  my-network 
