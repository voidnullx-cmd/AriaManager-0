#!/bin/bash

# =====================================================================
# AriaManager - Universal Production Installer
# Supports: Arch, Debian/Ubuntu, Fedora/RHEL
# =====================================================================

if [ "$EUID" -ne 0 ]; then
    echo "[-] Please run this installer with sudo: sudo ./install.sh"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=========================================="
echo "    ⚡ Installing AriaManager (dl)       "
echo "=========================================="
echo ""

# OS Detection via /etc/os-release
OS_TYPE="generic"
if [ -f /etc/os-release ]; then
    . /etc/os-release
    case "$ID" in
        ubuntu|debian|pop|mint|linuxmint) OS_TYPE="debian" ;;
        arch|manjaro|endeavouros|garuda) OS_TYPE="arch" ;;
        fedora|rhel|centos|rocky|alma) OS_TYPE="fedora" ;;
        *)
            if [[ "$ID_LIKE" =~ (ubuntu|debian) ]]; then OS_TYPE="debian"
            elif [[ "$ID_LIKE" =~ (arch) ]]; then OS_TYPE="arch"
            elif [[ "$ID_LIKE" =~ (fedora|rhel) ]]; then OS_TYPE="fedora"
            fi
            ;;
    esac
fi

echo "[+] Operating System detected: $OS_TYPE"

# Install Dependencies
echo "[+] Installing system dependencies (aria2, curl, jq)..."
if [ "$OS_TYPE" = "arch" ] || command -v pacman &> /dev/null; then
    pacman -Sy --needed --noconfirm aria2 curl jq || exit 1
elif [ "$OS_TYPE" = "debian" ] || command -v apt-get &> /dev/null; then
    apt-get update -qq && apt-get install -y aria2 curl jq || exit 1
elif [ "$OS_TYPE" = "fedora" ] || command -v dnf &> /dev/null; then
    dnf install -y aria2 curl jq || exit 1
else
    echo "⚠️ Unrecognized package manager. Please ensure aria2, curl, and jq are installed."
fi

# Install Binary to /usr/local/bin
echo "[+] Installing binary to /usr/local/bin/dl..."
mkdir -p /usr/local/bin

if [ -f "$SCRIPT_DIR/bin/dl" ]; then
    cp -f "$SCRIPT_DIR/bin/dl" /usr/local/bin/dl
    chmod +x /usr/local/bin/dl
    echo "[✔] Installed successfully!"
else
    echo "❌ Error: Missing binary file at '$SCRIPT_DIR/bin/dl'"
    exit 1
fi

echo ""
echo "=========================================="
echo " [✔] Installation completed successfully! "
echo "=========================================="
echo "Type 'dl' in your terminal to get started."
