# wt-cli

A CLI tool for managing Git Worktrees.

Easily create, delete, and manage worktrees with automatic symlink support for bare repository-based worktree structures.

## Installation

### curl (Recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/hail-kang/wt-cli/main/install.sh | bash
```

### git clone

```bash
git clone https://github.com/hail-kang/wt-cli.git
cd wt-cli
make install
```

### Manual

```bash
cp bin/wt ~/.local/bin/wt
chmod +x ~/.local/bin/wt
```

Make sure `~/.local/bin` is in your PATH:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

## Uninstall

```bash
make uninstall
# or
rm ~/.local/bin/wt
```

## Directory Structure

This tool assumes the following structure:

```
project/
├── project-name.git/      # bare repository (*.git)
├── project-name.ln/       # shared symlinks directory (*.ln, optional)
├── main/                  # worktree: main branch
├── develop/               # worktree: develop branch
└── feature-xxx/           # worktree: feature/xxx branch
```

## Usage

```bash
wt <command> [options]
```

### Commands

| Command | Description |
|---------|-------------|
| `wt list` | List all worktrees |
| `wt add <name> [branch]` | Add a new worktree |
| `wt new <name> <base>` | Create a new branch from base and add worktree |
| `wt remove <name>` | Remove a worktree |
| `wt prune` | Prune invalid worktrees |
| `wt link <name>` | Add symlinks to an existing worktree |
| `wt info` | Show detected path information |

### Examples

```bash
# List all worktrees
wt list

# Add worktree for main branch
wt add main

# Add worktree for feature/xxx branch (folder: feature-xxx)
wt add feature/xxx

# Create new branch from main and add worktree
wt new feature/my-feature main

# Remove a worktree
wt remove feature/xxx

# Show path info
wt info
```

## Symlinks (*.ln)

If a `*.ln` directory exists, symlinks are automatically created when adding worktrees.

Place shared files (e.g., `.env`, `node_modules`, `.venv`) in the `*.ln` directory to share them across all worktrees.

```bash
# Add symlinks to an existing worktree
wt link main
```

## Initial Setup (Creating a bare repository)

```bash
# New project setup
mkdir my-project && cd my-project
git clone --bare https://github.com/user/repo.git my-project.git

# Add first worktree
wt add main
```

## License

MIT
