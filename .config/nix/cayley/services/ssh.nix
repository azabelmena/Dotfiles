{
  enable = true;

  settings = {
    UseDns = true;

    PasswordAuthentication = false;
    PermitRootLogin = "no";

    GatewayPorts = "yes";

    AllowUsers = [ "alec" ];

    Ciphers = [
      "aes256-ctr"
      "aes256-gcm@openssh.com"
      "chacha20-poly1305@openssh.com"
    ];

    AllowTcpForwarding = true;
    LogLevel = "VERBOSE";
  };


  allowSFTP = false;

  ports = [
    4096
  ];
}
