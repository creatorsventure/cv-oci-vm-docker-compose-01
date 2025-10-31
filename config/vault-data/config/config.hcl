listener "tcp" {
  address     = "0.0.0.0:8100"
  tls_disable = 1
}

storage "file" {
  path = "/vault/file"
}

ui = true
disable_mlock = true