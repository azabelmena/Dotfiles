{
  enable = true;

  settings = {
    UseDns = true;
    PasswordAuthentication = true;
    PermitRootLogin = "no";
    GatewayPorts = "yes";
  };

  allowSFTP = false;

  ports = [
    22
    2222
    4096
  ];
}
