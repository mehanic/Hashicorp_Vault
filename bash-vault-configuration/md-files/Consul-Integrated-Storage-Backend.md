### Definition

Now the storage that was provisioned with our vault nodes is going to be used to replicate the data among all the vault nodes. In simple terms, Vault will have it's own storage

### Important points:

* Vault Internal Storage Option
* High Availability
* Leverages Raft Consensus Protocol
* Only need to troubleshoot Vault
* All Vault nodes have copy of Vault's Data
* Eliminates Network Hop to Consul + snapshots for data retention

### Points to Note:

* Integrated storage (RAFT) allow Vault nodes to provide its own replicated storage across Vault nodes within a cluster
* **Local path** to store replicated data
* All data is replicated among all nodes in the cluster
* ***Eliminates the need to run CONSUL cluster and manage it***

in `vault.hcl`

```
storage "raft" {
  path    = "/opt/vault/data"
  node_id = "node-a-us-east-1.example.com"
  retry_join {
    auto_join = "provider=aws region=us-east-1 tag_key=vault tag_value=us-east-1"
  }
}
```

To manually join standby nodes to cluster using CLI:

```
vault operator raft join https://active_mode.example.com:8200
```

To list cluster members:

```
vault operator raft list-peers
```

Basic operations:

```
$ /opt/vault.creds %root token for nodes are stored
$ export VAULT_TOKEN=<Root token>
$ vault status
$ vault operator raft list-peers %check if there are nodes
$ vault operator raft join http://node-1:8200 %Joining manually from node-2 which will initialize the key in node2
$ vault operator unseal %(Need 3/5 Unseal Keys to unseal shamir algorithm)

$ vault operator raft list-peers

Node      Address        State       Voter
----      -------        -----       -----
node-1    node-1:8201    leader      true
node-2    node-2:8201    follower    true
node-3    node-3:8201    follower    false

$ vault operator step-down %to step down the leader so the standby node becomes new leader

$ vault operator raft list-peers

Node      Address        State       Voter
----      -------        -----       -----
node-1    node-1:8201    follower    true
node-2    node-2:8201    leader      true
node-3    node-3:8201    follower    true

$ sudo systemctl stop vault %STOP node-1
$ vault secrets enable aws %enable new secrets engine on node 3
$ vault secrets list %on node-3

Path          Type         Accessor              Description
----          ----         --------              -----------
aws/          aws          aws_a4da6f23          n/a
cubbyhole/    cubbyhole    cubbyhole_cac13207    per-token private secret storage
identity/     identity     identity_b6bf6ce0     identity store
sys/          system       system_de3093c6       system endpoints used for control, policy and debugging

$ sudo systemctl stop vault %STOP node-2
$ vault secrets list %on node-3
Error listing secrets engines: Get "http://vault-production:8200/v1/sys/mounts": dial tcp 10.44.108.15:8200: connect: connection refused


$ sudo systemctl start vault %START node-1
$ sudo systemctl start vault %START node-2
$ vault operator unseal %on both nodes using 3/5 unseal keys
$ vault secrets list %on all nodes

Path          Type         Accessor              Description
----          ----         --------              -----------
aws/          aws          aws_a4da6f23          n/a
cubbyhole/    cubbyhole    cubbyhole_cac13207    per-token private secret storage
identity/     identity     identity_b6bf6ce0     identity store
sys/          system       system_de3093c6       system endpoints used for control, policy and debugging

```
