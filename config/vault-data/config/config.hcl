listener "tcp" {
  tls_disable   = 1
}

storage "file" {
  path = "/vault/file"
}

ui = true
disable_mlock = true