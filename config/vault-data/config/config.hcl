listener "tcp" {
  address     = "0.0.0.0:8200"  # vault internal port
  tls_disable = 1
}

storage "file" {
  path = "/vault/file"
}

ui = true
disable_mlock = true

# allow anonymous access to ACME endpoints for the cv-intermediate-ca mount
unauthenticated_paths = [
  "v1/cv-intermediate-ca/acme/*",
  "v1/cv-intermediate-ca/acme/directory",
  "v1/cv-intermediate-ca/acme/new-nonce"
]