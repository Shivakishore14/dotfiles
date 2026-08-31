# dotfiles

Cross-platform development environment for:

- Arch Linux
- macOS
- Ubuntu on WSL

[chezmoi](https://www.chezmoi.io/) manages configuration and platform
differences. [mise](https://mise.jdx.dev/) installs versioned command-line
tools. Native package managers are limited to operating-system prerequisites
and macOS applications.

## What is included

- Zsh with Oh My Zsh, autosuggestions, mise, zoxide, and Herdr completions
- Neovim with LazyVim
- Herdr as the primary terminal workspace and AI orchestration tool
- tmux as an on-demand terminal multiplexer
- GitHub CLI (`gh`)
- Git defaults with per-machine identity
- Language runtimes, language servers, formatters, and common CLI tools via mise

## Install

Clone the repository into the standard GitHub workspace and run the bootstrap:

```sh
mkdir -p ~/github
git clone git@github.com:Shivakishore14/dotfiles.git ~/github/dotfiles
cd ~/github/dotfiles
./bootstrap
```

The bootstrap is intended for initial setup. It detects macOS, Arch, and WSL.
Chezmoi asks for the machine role
(`personal` or `work`) and separate GitHub and work Git identities on first
initialization. Identity values are stored only in the local Chezmoi
configuration and generated Git files. Re-running the bootstrap after
initialization performs an incremental `chezmoi apply` without prompting for
the identities again.

Restart the shell after installation:

```sh
exec zsh
```

## Daily usage

Pull and apply dotfile updates:

```sh
chezmoi update
```

Apply changes already present in the local dotfiles checkout:

```sh
chezmoi apply
```

Install versions declared in the mise configuration:

```sh
mise install
```

Preview local dotfile changes before applying them:

```sh
chezmoi diff
chezmoi apply
```

## Platform responsibilities

| Layer | Responsibility |
| --- | --- |
| Chezmoi | Configuration, templates, shell plugins, and platform selection |
| mise | Herdr, tmux, Neovim, runtimes, LSPs, formatters, and CLI tools |
| `pacman` | Arch build and operating-system prerequisites |
| Homebrew | macOS prerequisites, terminal application, and Nerd Font |
| `apt` | Ubuntu/WSL build and operating-system prerequisites |
| Windows | Windows Terminal configuration and Nerd Font for WSL |

WSL terminal fonts must be installed on Windows because the Windows terminal
renders the text. The macOS package script installs the font through Homebrew.

## Git identities

Git commits use directory-scoped identities:

- Repositories below `~/github` use the prompted GitHub username and email.
- Repositories below `~/workplace` use the prompted work username and email.
- Repositories elsewhere have no identity and refuse to commit until one is
  configured explicitly.

The repository contains only Chezmoi template variables. Prompted identity
values are not committed to this repository.

## Work-only tools

Sensitive work files live in `OneDrive/Documents/setup`, outside this public
repository. The expected layout is:

```text
setup/
├── config/
├── files/
└── scripts/
```

On machines initialized with the `work` role, each direct file in `scripts/`
is installed in `~/.local/bin` during `chezmoi apply`. A `.sh` suffix is
removed from the command name, so `scripts/activate-owner.sh` installs as
`activate-owner`. Removed scripts are also removed from `~/.local/bin`, while
unrelated existing commands are never overwritten.

The installer discovers the commercial OneDrive Documents folder on WSL and
standard OneDrive locations on macOS and Linux. Set `WORK_SETUP_DIR` to the
full `setup` path when a machine uses a non-standard location.

WSL uses Azure CLI from the Windows host. Other work profiles install Azure CLI
through mise.

## Neovim

The Neovim configuration follows the upstream LazyVim starter layout. Plugin
versions are recorded in `~/.config/nvim/lazy-lock.json` after the first
successful launch. Commit updates to that file through Chezmoi:

```sh
chezmoi add ~/.config/nvim/lazy-lock.json
```

Mise owns external executables such as language servers and formatters.
LazyVim owns only Neovim plugins and their configuration.

## Herdr and tmux

Launch or attach to the default Herdr session:

```sh
herdr
```

Herdr works without a configuration file. If custom keybindings or UI settings
are added later, import them with:

```sh
chezmoi add ~/.config/herdr/config.toml
```

tmux remains available with TPM, tmux-sensible, and Vim/tmux navigation:

```sh
tmux
```
