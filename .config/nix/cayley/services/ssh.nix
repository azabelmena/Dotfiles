{
  enable = true;

  settings = {
    UseDns = true;

    PubKeyAuthentication = true;
    PasswordAuthentication = false;
    KbdInteractiveAuthentication = false;
    PermitRootLogin = "no";

    GatewayPorts = "yes";

    AllowGroups = [ "ssh-users" ];

    HostKeyAlgorithms = "ssh-ed25519-cert-v01@openssh.com,ssh-ed25519,ssh-rsa-cert-v01@openssh.com,ssh-rsa";
    KexAlgorithms = [
      "curve25519-sha256@libssh.org"
      "diffie-hellman-group-exchange-sha256"
    ];
    Ciphers = [
      "aes256-ctr"
      "aes256-gcm@openssh.com"
      "chacha20-poly1305@openssh.com"
    ];
    Macs = [
      "hmac-sha2-512-etm@openssh.com"
      "hmac-sha2-256-etm@openssh.com"
      "umac-128-etm@openssh.com"
      "hmac-sha2-512"
      "hmac-sha2-256"
      "umac-128@openssh.com"
    ];

    AllowTcpForwarding = true;
    LogLevel = "VERBOSE";
  };


  allowSFTP = true;

  ports = [
    16384
  ];
}
