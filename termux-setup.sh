#!/data/data/com.termux/files/usr/bin/bash

RESTORE='\033[0m'
RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
BLUE='\033[00;34m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
LIGHTGRAY='\033[00;37m'

clear
echo "${BLUE}░█████╗░░██╗░░░░░░░██╗░█████╗░"
echo "██╔══██╗░██║░░██╗░░██║██╔══██╗"
echo "██║░░██║░╚██╗████╗██╔╝██║░░██║"
echo "██║░░██║░░████╔═████║░██║░░██║"
echo "╚█████╔╝░░╚██╔╝░╚██╔╝░╚█████╔╝"
echo "░╚════╝░░░░╚═╝░░░╚═╝░░░╚════╝░"
sleep 1

echo "░█▀▀▀ ─█▀▀█ ░█▀▀█ ░█▀▄▀█ ░█▀▀█ ░█▀▀▀█ ▀▀█▀▀"
echo "░█▀▀▀ ░█▄▄█ ░█▄▄▀ ░█░█░█ ░█▀▀▄ ░█──░█ ─░█──" 
echo "░█─── ░█─░█ ░█─░█ ░█──░█ ░█▄▄█ ░█▄▄▄█ ─░█── ${RESTORE}"
echo "${GREEN} [=] ${BLUE} Vui lòng cho phép Termux truy cập tệp nếu được yêu cầu ${RESTORE}"
sleep 1

echo "${YELLOW} [!] ${PURPLE} Vui lòng đợi... ${RESTORE}"
termux-setup-storage
sleep 6

echo "${GREEN} [+] ${BLUE} Đang cập nhật Termux... ${RESTORE}"
sleep 2
echo "Vui lòng nhấn ENTER trên bất kỳ hộp thoại nào xuất hiện cho đến khi Termux được cập nhật"
apt update -y && apt upgrade -y
echo "${GREEN} [+] ${BLUE} Đã cập nhật Termux thành công ${RESTORE}"

echo "${GREEN} [+] ${BLUE} Đang cài đặt các gói cần thiết ${RESTORE}"
sleep 3
pkg install -y git nodejs

echo "${GREEN} [+] ${BLUE} Đã cài đặt các gói ${RESTORE}"
echo "${GREEN} [+] ${BLUE} Đang cài đặt OwO Farm Bot ${RESTORE}"
git clone https://github.com/hoang354h/owo-huntbot-.git/
cd owo-huntbot || exit

echo "${GREEN} [+] ${BLUE} Đang cài đặt các gói Node.js ${RESTORE}"
npm install --no-bin-links

# Kiểm tra xem token đã được cung cấp chưa, nếu chưa thì yêu cầu người dùng nhập
if [ -z "$DISCORD_TOKEN" ]; then
    echo "${YELLOW} [!] ${PURPLE} Vui lòng nhập token bot Discord của bạn: ${RESTORE}"
    read -r DISCORD_TOKEN
fi

# Ghi trực tiếp tệp config.json
echo "${GREEN} [+] ${BLUE} Đang tạo tệp config.json với cài đặt đã cung cấp ${RESTORE}"
cat > config.json << EOL
{
    "firstrun": "true",
    "prefix": "!",
    "main": {
        "token": "$DISCORD_TOKEN",
        "userid": "1112007584447213579",
        "commandschannelid": "1359753072577871922",
        "huntbotchannelid": "1359753134544523354",
        "owodmchannelid": "1355808809968336916",
        "gamblechannelid": "1359753134544523354",
        "autoquestchannelid": "1359753256842170438",
        "autostart": false,
        "commands": {
            "hunt": true,
            "battle": true,
            "pray": false,
            "curse": false,
            "huntbot": {
                "enable": true,
                "maxtime": 10,
                "upgrade": false,
                "upgradetype": "duration"
            },
            "gamble": {
                "coinflip": false,
                "slot": false
            },
            "animals": true,
            "inventory": true,
            "checklist": true,
            "autoquest": true
        },
        "maximum_gem_rarity": "Mythical"
    },
    "extra": {
        "enable": false,
        "token": "",
        "userid": "",
        "commandschannelid": "",
        "huntbotchannelid": "",
        "owodmchannelid": "",
        "gamblechannelid": "",
        "autoquestchannelid": "",
        "autostart": false,
        "commands": {
            "hunt": true,
            "battle": true,
            "pray": false,
            "curse": true,
            "huntbot": {
                "enable": true,
                "maxtime": 10,
                "upgrade": false,
                "upgradetype": "duration"
            },
            "tomain": true,
            "gamble": {
                "coinflip": true,
                "slot": true
            },
            "animals": true,
            "inventory": true,
            "checklist": true,
            "autoquest": true
        },
        "maximum_gem_rarity": "Mythical"
    },
    "settings": {
        "owoprefix": "owo",
        "discordrpc": false,
        "chatfeedback": true,
        "autophrases": true,
        "autoresume": false,
        "autojoingiveaways": false,
        "checklist": {
            "types": {
                "daily": true,
                "cookie": true,
                "vote": true
            }
        },
        "inventory": {
            "types": {
                "daily": true,
                "cookie": true,
                "vote": true
            },
            "use": {
                "lootbox": true,
                "fabledlootbox": false,
                "crate": true,
                "gems": true
            }
        },
        "gamble": {
            "coinflip": {
                "default_amount": 1000,
                "max_amount": 250000,
                "multiplier": 1.0
            },
            "slot": {
                "default_amount": 1000,
                "max_amount": 250000,
                "multiplier": 1.0
            }
        },
        "logging": {
            "newlog": true,
            "loglength": 20,
            "showlogbeforeexit": false
        },
        "safety": {
            "autopause": true,
            "pauseafter": 30,
            "pausefor": 5
        },
        "captcha": {
            "autosolve": true,
            "autosolve_thread": 1,
            "alerttype": {
                "webhook": true,
                "webhookurl": "xxx",
                "desktop": {
                    "force": true,
                    "notification": true,
                    "prompt": true
                },
                "termux": {
                    "notification": true,
                    "vibration": true,
                    "vibration_time": 5000,
                    "toast": true
                }
            }
        }
    },
    "animals": {
        "type": {
            "sell": true,
            "sacrifice": false
        },
        "animaltype": {
            "common": true,
            "uncommon": true,
            "rare": true,
            "epic": false,
            "mythical": false,
            "patreon": false,
            "cpatreon": false,
            "legendary": false,
            "gem": false,
            "bot": false,
            "distorted": false,
            "fabled": false,
            "special": false,
            "hidden": false
        }
    },
    "interval": {
        "hunt": {
            "max": 32000,
            "min": 16000
        },
        "battle": {
            "max": 32000,
            "min": 16000
        },
        "pray": {
            "max": 332000,
            "min": 316000
        },
        "coinflip": {
            "max": 32000,
            "min": 16000
        },
        "slot": {
            "max": 32000,
            "min": 16000
        },
        "animals": {
            "max": 661000,
            "min": 610000
        }
    },
    "socket": {
        "expressport": 1243
    }
}
EOL

echo "${GREEN} [+] ${BLUE} Tệp cấu hình đã được tạo thành công ${RESTORE}"
echo "${GREEN} [=] ${BLUE} Đang khởi động OwO Farm Bot... ${RESTORE}"
node index.js
