{...}: {
  users.users.kn100 = {
    isNormalUser = true;
    description = "Kevin";
    extraGroups = ["networkmanager" "wheel" "dialout"];
  };
}
