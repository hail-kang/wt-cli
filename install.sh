#!/bin/bash
#
# wt-cli installer
# Usage: curl -fsSL https://raw.githubusercontent.com/hail-kang/wt-cli/main/install.sh | bash
#

set -e

REPO="hail-kang/wt-cli"
INSTALL_DIR="${HOME}/.local/bin"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}Installing wt-cli...${NC}"

# Create install directory
mkdir -p "$INSTALL_DIR"

# Download the script
if command -v curl &> /dev/null; then
    curl -fsSL "https://raw.githubusercontent.com/${REPO}/main/bin/wt" -o "${INSTALL_DIR}/wt"
elif command -v wget &> /dev/null; then
    wget -qO "${INSTALL_DIR}/wt" "https://raw.githubusercontent.com/${REPO}/main/bin/wt"
else
    echo -e "${RED}Error: curl or wget is required${NC}"
    exit 1
fi

chmod +x "${INSTALL_DIR}/wt"

echo -e "${GREEN}Installed wt to ${INSTALL_DIR}/wt${NC}"
echo ""

# Check if INSTALL_DIR is in PATH
if [[ ":$PATH:" != *":${INSTALL_DIR}:"* ]]; then
    echo -e "${YELLOW}Add the following to your shell profile (.zshrc or .bashrc):${NC}"
    echo ""
    echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
    echo ""
fi

echo -e "${GREEN}Done! Run 'wt --help' to get started.${NC}"
