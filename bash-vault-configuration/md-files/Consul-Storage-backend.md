### Definition

The Consul storage backend is used to persist Vault's data in Consul's key-value store. In addition to providing durable storage, inclusion of this backend will also register Vault as a service in Consul with a default health check

### Important points:

* Durable K/V Storage
* High Availability
* Independently Scale Backend
* Distributed System
* Easy to automate
* Built-in integration Consul/Vault + snapshots for data retention

### Points to Note:

* Always deployed using multiple nodes and configured as a cluster (ALWAYS ODD numbers)
* **All data is replicated** among all nodes in cluster
* **Leader election** promotes a single Consul node as the leader
* Leader accepts *new logs entries and replicates* to all other nodes
* ***Consul cluster for Storage Backend NOT TO BE USED for Consul functions in Prod***

in `vault.hcl`

```
storage "consul" {
  address = "127.0.0.1:8500"
  path    = "vault/"
  token   = "1a2b3c4d-1234-abdc-1234-1a2b3c4d5e6a"
}
```

For Consul Server Configuration File, check `consul-client.json` and `consul-node.json` at client agent and node level