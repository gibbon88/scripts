#!/bin/sh
#
#author kulakOFF

#Block for some constants
#
#message from STD IN
message=$( cat )

#api token from Telegram
apiToken=<your_api_token_here>

#chat id from Telegram
userChatId=<your_chat_id_here>

sendTelegram() {
        curl -s \
        -X POST \
        https://api.telegram.org/bot$apiToken/sendMessage \
        -d text="$message" \
        -d chat_id=$userChatId
}

sendGoodSticker() {
	curl -s \
        -X POST \
        https://api.telegram.org/bot$apiToken/sendSticker \
        -d sticker="CAADAgADRAsAAkKvaQABNBIOAAHBTCJZAg" \
	-d chat_id=$userChatId	
}

sendBadSticker() {
	curl -s \
        -X POST \
        https://api.telegram.org/bot$apiToken/sendSticker \
        -d sticker="CAADAgADQgsAAkKvaQABLmqvrgABZdBhAg" \
        -d chat_id=$userChatId
}

if  [[ -z "$message" ]]; then
        echo "Please pipe a message to me!"
else
#snippet for functions calls 
        sendGoodSticker
	sendTelegram
	sleep 10
	sendBadSticker
	sendTelegram
fi
