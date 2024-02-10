#!/bin/bash

# Check if internet is available

while true; do
	ping -c 1 google.com >/dev/null 2>&1
	if [ $? -eq 0 ]; then
		break
	else
		sleep 2
	fi
done

# Get the weather

api_key="$WEATHER_API_KEY"
lat="$WEATHER_LAN"
lon="$WEATHER_LON"
forcast=$(curl --silent "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$api_key&units=metric")

temp=$(echo "$forcast" | jq .main.temp)
icon=$(echo "$forcast" | jq .weather[0].icon)
feels_like=$(echo "$forcast" | jq .main.feels_like)

# Get the AQI

stations=$(curl --silent -X POST https://airnow.tehran.ir/home/OnlineAQI.aspx/GetPointList \
	-H 'user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:121.0) Gecko/20100101 Firefox/121.0' \
	-H 'accept: application/json, text/javascript, */*; q=0.01' \
	-H 'accept-language: en-US,en;q=0.5' \
	-H 'accept-encoding: gzip, deflate, br' \
	-H 'content-type: application/json; charset=utf-8' \
	-H 'x-requested-with: XMLHttpRequest' \
	-H 'origin: https://airnow.tehran.ir' \
	-H 'referer: https://airnow.tehran.ir/home/OnlineAQI.aspx' \
	-H "cookie: ASP.NET_SessionId=$AIRNOW_SESSION_ID" \
	-H 'sec-fetch-dest: empty' \
	-H 'sec-fetch-mode: cors' \
	-H 'sec-fetch-site: same-origin' \
	-H 'dnt: 1' \
	-H 'sec-gpc: 1' \
	-d "{'SId':'0','Culture':'fa-IR','Gas':'','hasDOE':'true','hasAQC':'true'}" | jq .d)

stations=${stations:1:${#stations}-2}
stations=$(echo "$stations" | sed 's/\\"/"/g')

station_value=$(echo "$stations" | jq '.[] | select(.Name == "'"$AQI_STATION_1"'").Value')
station_value=${station_value:1:${#station_value}-2}
station2_value=$(echo "$stations" | jq '.[] | select(.Name == "'"$AQI_STATION_2"'").Value')
station2_value=${station2_value:1:${#station2_value}-2}

if [[ -z "$station_value" || "$station_value" = 0 || -z "$station2_value" || "$station2_value" = 0 ]]; then
	aqi=$((station_value + station2_value))
else
	aqi=$(((station_value + station2_value) / 2))
fi

if [ "$icon" == '"01d"' ]; then
	icon=""
elif [ "$icon" == '"01n"' ]; then
	icon=""
elif [ "$icon" == '"02d"' ]; then
	icon=""
elif [ "$icon" == '"02n"' ]; then
	icon=""
elif [ "$icon" == '"03d"' ]; then
	icon="󰅟"
elif [ "$icon" == '"04d"' ]; then
	icon=""
elif [ "$icon" == '"04n"' ]; then
	icon=""
elif [ "$icon" == '"09d"' ]; then
	icon=""
elif [ "$icon" == '"09n"' ]; then
	icon=""
elif [ "$icon" == '"10d"' ]; then
	icon=""
elif [ "$icon" == '"10n"' ]; then
	icon=""
elif [ "$icon" == '"11d"' ]; then
	icon=""
elif [ "$icon" == '"11n"' ]; then
	icon=""
elif [ "$icon" == '"13d"' ]; then
	icon="󰼶"
elif [ "$icon" == '"13n"' ]; then
	icon="󰼶"
elif [ "$icon" == '"50d"' ]; then
	icon=""
elif [ "$icon" == '"50n"' ]; then
	icon=""
elif [ "$icon" == "" ]; then
	icon=""
elif [ "$icon" == "" ]; then
	icon=""
elif [ "$icon" == "" ]; then
	icon=""
fi

if [ "$aqi" -gt 99 ]; then
	weather="$icon $temp | $aqi"
else
	weather="$icon $temp"
fi

echo -e "{\"text\":\" $weather\", \"tooltip\": \"Feels Like: $feels_like | AQI: $aqi\"}"
