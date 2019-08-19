vault auth enable approle

cat << EOF > product_nomad_mgr.hcl
# Login with AppRole
path "auth/approle/login" {
  capabilities = [ "create", "read" ]
}

# Read test data
# Set the path to "secret/data/mysql/*" if you are running kv-v2
path "secret/*" {
  capabilities = [ "read" ]
}
EOF

vault policy write product_nomad_mgr product_nomad_mgr.hcl
vault write auth/approle/role/product_nomad_mgr policies="product_nomad_mgr"

# Make a Nomad like token

cat << EOF > product_nomad_operator_policy.hcl
path "auth/approle/role/product_nomad_mgr/*" {
capabilities = ["read", "create", "update", "list"]
}

path "auth/approle/role/product_nomad_mgr/role-id" {
capabilities = ["read", "create", "update", "list"]
}

path "sys/policy/product_nomad_operator_policy" {
capabilities = ["read"]
}
EOF

vault policy write product_nomad_operator_policy product_nomad_operator_policy.hcl
vault token create -policy=product_nomad_operator_policy -ttl=72h | tee token.txt
