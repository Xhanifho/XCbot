#!/bin/bash

# 1. Update & Install Package Sistem (Hanya yang wajib untuk websocket/python)
echo "--- Menyiapkan Tool Sistem ---"
pkg update && pkg upgrade -y
pkg install python binutils rust -y

# 2. Install Websocket-Client via Pip
echo "--- Menginstall Library Websocket-Client ---"
pip install websocket-client

# 3. Setup Akses Memori (Penting untuk akses folder Download)
echo "--- Meminta Izin Akses Storage ---"
termux-setup-storage

# 4. Masuk ke folder dan Eksekusi
echo "--- Menjalankan Script ---"
cd /storage/emulated/0/Download/Telegram && python Xc.pyc
