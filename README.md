> Kubernetes compose orchestra for Consul.

## QuickStart
1. `kubectl label nodes your-desired-node consul-node=true`
2. `cp -a .env.example .env` and update it (avoid the # char)
3. `htpasswd -nb username password` to generate http password and update `.env`
4. `./deploy`

## Note
* Manual health check by `kubectl -n $NAMESPACE exec consul_xx consul members`

## Reference
* https://github.com/helm/charts/blob/master/stable/consul

## TODO
* Switch the container bootstrap user to consul in new image build
* Migrate some timezone oprations from StatefulSet command to new image build
