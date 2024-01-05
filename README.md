<p align="center">
  <b>azabelmena/Dotfiles</b><br />
  <span align="center">Declarative, reproducible, and stateless system
  configurations for NixOS and Nix-Darwin.</span>
</p>

# A Nice Warm Welcome.

Welcome to my dotfiles repository. What we have here are NixOS and Nix-Darwin
configuration files, and dotfiles that I have declared in the nix language for
different machines. The machines included
here are:
- `cauchy` (Augustin-Louis Cauchy)
    - An old Lenovo Ideapad I have lying around for tinkering and testing.
- `cayley` (Arthur Cayley)
    - A system76 Thelio desktop. This is my main machine, and the one that sees
      the most upates.
- `lovelace` (Ada Lovelace)
    - This configuration is meant for KVM virtual machines using qemu. This is
      also the most minimal config out of all of them, as it is meant to be
      accessed through ssh.
- `noether` (Emmy Noether)
    - An Apple M2 MacBook Pro.

By the way, all my machines are named after mathematicians:
- The, name `noether` can refer to either Emmy Noether, or Max Noether
(Emmy's father); although I named my M2 MacBook specifically after Emmy.
- If you copy my (nix) configs, you do not need to adhere to the
mathematician naming scheme; although it would be neat if you did.
- Hopefully down the line I will acquire a framework laptop and name it one
of the following:
    - `hilbert` (David Hilbert)
    - `sophie` (Sophie Germaine)
    - `hypatia` (Hypatia of Alexandria)
    - `agnesi` (Maria Gaetana Agnesi)
    - `fermat` (Pierre de Fermat)
    - `weyl` (Hermann Weyl)
- The names here are not capitalized (even though they should be) to be in
keeping with [DNS hostname conventions](https://datatracker.ietf.org/doc/html/rfc1178).

# What's Here?

Here you will find:

- My NixOS and Nix-Darwin configuration files, as well as the flake.nix and the
flake.lock files used to build them on different machines.
    - NixOS for machines with generic hardware.
        - i.e. `cayley`, `cauchy`, etc...
    - Nix-Darwin for Apple hardware and have a reproducible system on OSX.
        - i.e. `noether`.
        - Reproducibility here is limited given how locked down OSX is.
- Various home-manager `.nix` files for programs which include:
    - Vim.
    - Neovim.
    - Zsh and Bash.
    - Kitty (a terminal emulator).
    - Hyprland.
    - Waybar.
    - Zathura.
    - Rofi.
    - Yabai and `skhd` (a window manager and hotkey daemon for OSX, respectively).
    - Many other programs (look through `.config/home-manager/`).

- A folder of pictures (these are for storing wallpapers) and should not really
be considered as part of the configs.
- A .gitignore and this README.
    - These are just boilerplate and should also not be considered a part of the
    configs.

# What's The Goal?

The goal here is to create a repository which describes a given system on a
given machine. This system should be:
- Reproducible
    - It can be built on many different machines, and give the same programs and
    configurations according to a given specification.
- Consistent
    - Each build should have exactly the same versions of programs from a given
    specification.
    - This is actually a part of reproducibility, but I like to seperate it out.
- Stateless
    - The system described should only depend on the configuration files
    specified, and not on any *outside* state.
        - Think `/etc/`, or `~/.local/` or `~/.config/some-program-directory`.
        - It should only depend on the following:
            - `flake.nix`
            - `flake.lock`
            - `.config/home-manager/`
            - `.config/nix/`
    - The `Pictures` directory should not be counted torwards the state of the
    system, as is it is completely optional to include.
        - Technically, the files `swaylock.nix` and `hyprland.nix` introduce
        state through `Pictures` and henced depends on `Pictures`, however I
        don't think it is too big of an issue, and I should be able to remedy
        this pretty quickly when I have time.
        - There are other configuration files that may introduce state, and I
        plan on fixing them as I stumble upon them.

# A note for People Who Wish to Steal from This Repository.

The dotfiles here are primarly geared around `nix` and using `nix` to declare
actual configuration files. As such, the actual configuration files for programs
here don't really exist (at least, they shouldn't), and you will find just their
`nix` declerations. If you don't have a `nix` based system (i.e. NixOS,
Nix-Darwnin, or just having the `nix` package manager installed), you could do
one of the following:
1. You could comb through the individual `.nix` files, and reverse enginner and
retrofit the configs to your own configuration files (I do not recomend this).
2. You could contact me and ask for the individual config files.
    - i.e. you ask for my `.vimrc`, and I send you the `.vimrc` that was generated
    in my nix store (this is perhaps the most sane option).
3. You could, install the `nix` package manager, Nix-Darwin, or you could just
switch over completely to NixOS.
    - If you're new to `nix`, you will have to do some reading, especially on
    `nix` flakes.
    - Switching to NixOS on Apple hardware is ill-advised; I recommend
    Nix-Darwin for this.
    - I highly recomend option 3 (I cannot guarantee your sanity).

# Finally.
Feel free to steal my dots, the repository is public for a reason.

# P.S.
If for some reason these configs violate the goals of achieving Reproducability,
Consistency, and Statelessness, please let me know. You can do this by opening
an issue on github.
