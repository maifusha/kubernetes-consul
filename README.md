> Kubernetes compose orchestra for Consul

## QuickStart
1. `kubectl label nodes your-desired-node consul-node=true`
2. `cp -a .env.example .env` and update it
3. generate your BASIC_USER/BASIC_HASH with htpasswd command (`htpasswd -nb username password`) and update .env
4. `./deploy`

## Note
* Manual health check by `kubectl -n $NAMESPACE exec consul_xx consul members`

## Reference
* https://github.com/helm/charts/blob/master/stable/consul
