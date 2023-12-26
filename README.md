<p align="center">
  <b>azabelmena/Dotfiles</b><br />
  <span align="center">Declarative and reproducible system configurations for NixOS
  and Nix-Darwin.</span>
</p>

# What's here?
Here are NixOS and Nix-Darwin configuration files, and dotfiles that I
have declared in the nix language for different machines. The machines included
here are:
- `cayley`
    - A system76 Thelio desktop.
- `cauchy`
    - An old Lenovo Ideapad I have lying around for tinkering.
- `noether`
    - An Apple Silicon M1 MacBook Pro.

- All my machines are named after mathematicians.
    - The, `noether` can refer to either Emmy Noether, or Max Noether (Emmy's father);
    although I had Emmy Noether in mind when I named my M1 Mac.
    - If you copy my nix configs, you do not need to adhere to the mathematician
    naming scheme; algthough it would be neat if you did.
    - Hopefully down the line I will acquire a framework laptop and name it one
    of the following:
        - `hilbert`
        - `sophie` (after sophi germaine)
        - `hypatia`
        - `agnesi`
        - `fermat`
        - `weyl`
    - The names here are not capitalized (although they should be) to be in
    keeping with hostname conventions.

Here you will find:

- My NixOS and Nix-Darwin configuration files, as well as the flake.nix used to
build them on different machines.
    - NixOS for generic machines
        - i.e. `cayley`, `cauchy`, etc...
    - Nix-Darwin to have a reporducible and pure nix environment in OSX.
        - i.e. `noether`.
- Various home-manager `.nix` files for programs which include:
    - Vim
    - Neovim
    - Zsh and Bash
    - Kitty (a terminal emulator)
    - Hyprland
    - Waybar
    - Zathura
    - Rofi
    - Yabai and `skhd` (a window manager and hotkey daemon for OSX, respectively)
    - Many other programs (look through `.config/home-manager/`)

The goal here is to create a repository which describes a given system. This
system should be:
- Reproducible
    - It can be built on many different machines, and give the same programs.
- Consistent
    - Each build should have exactly the same versions of programs specified
    in the files.
    - This is usually a part of reproducibility, but I like to seperate it out.
- stateless
    - The system described should only depend on the configuration files
    specified, and not on any outside state.

# A note on people who wish to steal from this repository.

The dotfiles here are primarly geared around `nix` and using `nix` to declare
actual configuration files. As such, the actual configuration files for programs
here (should not) don't exist, and you will find just their `nix` declerations.
If you don't have a `nix` based system (i.e. NixOS, Nix-Darwnin, or just having
the `nix` package manager installed), you could do one of the following:
- You could comb through the individual `.nix` files, and reverse enginner and
retrofit the configs to your own configuration files (I do not recomend this).
- You could contact me and ask for the individual config files.
    - i.e. you ask for my `.vimrc`, and I send you the `.vimrc` that was generated
    in my nix store.
- You could, install the `nix` package manager, Nix-Darwin, or you could just
switch over completely to NixOS.
    - If you're new to `nix`, you will have to do some reading, especially on `nix`
    flakes.
    - I highly recomend this option.

# A Final note.
Feel free to steal my dots, the repository is public for a reason.
