#!/bin/bash
pkg update && pkg upgrade -y
pkg install python binutils rust git -y
pip install -r https://raw.githubusercontent.com/Xhanifho/XCbot/main/requirement.txt
cd /storage/emulated/0/Download/Telegram
python Xc.pyc
