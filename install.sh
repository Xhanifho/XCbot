#!/bin/bash

# 1. Update & Install Package Sistem
echo -e "\e[1;32m--- Menyiapkan Tool Sistem ---\e[0m"
pkg update && pkg upgrade -y
# Clang dan Rust diperlukan untuk membina sesetengah library Python di Android
pkg install python binutils rust clang -y

# 2. Install Library Python yang Diperlukan
echo -e "\e[1;32m--- Menginstall Library Python (Websocket & Requests) ---\e[0m"
# Menambah 'requests' untuk menyelesaikan ralat 'ModuleNotFoundError'
pip install websocket-client requests

# 3. Setup Akses Memori (Penting untuk folder Download)
echo -e "\e[1;32m--- Meminta Izin Akses Storage ---\e[0m"
termux-setup-storage
sleep 2

# 4. Navigasi dan Eksekusi
echo -e "\e[1;32m--- Menjalankan Script ---\e[0m"

# Folder default muat turun Telegram
PATH_TG="/storage/emulated/0/Download/Telegram"

if [ -d "$PATH_TG" ]; then
    cd "$PATH_TG"
    # Semak jika fail .pyc wujud, jika tidak cuba fail .py
    if [ -f "Xc.pyc" ]; then
        python Xc.pyc
    elif [ -f "Xc.py" ]; then
        python Xc.py
    else
        echo -e "\e[1;31m[!] Fail Xc.py atau Xc.pyc tidak dijumpai dalam folder Telegram!\e[0m"
    fi
else
    echo -e "\e[1;31m[!] Folder Download/Telegram tidak dijumpai.\e[0m"
    echo "Sila pastikan anda telah memberi izin storage dan folder tersebut wujud."
fi
