#! /bin/sh
# A forecast.io api key (free)
FORECAST_API="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

# Coordinates like "-90.0000,0.0000"
FORECAST_LOC="-90.0000,0.0000"

function weathericon {
	case $1 in
		"clear-day")
		    echo ""
		;;
		"clear-night")
		    echo ""
		;;
		"rain")
		    echo ""
		;;
		"snow")
		    echo ""
		;;
		"sleet")
		    echo ""
		;;
		"wind")
		    echo ""
		;;
		"fog")
		    echo ""
		;;
		"cloudy")
		    echo ""
		;;
		"partly-cloudy-day")
		    echo ""
		;;
		"partly-cloudy-night")
		    echo ""
		;;
		*)
		    echo $1
		;;
	esac
}

forecast=$(curl -s "https://api.darksky.net/forecast/$FORECAST_API/$FORECAST_LOC?units=si")

temp=$(echo $forecast | jq -r ".currently.apparentTemperature")
#now=$(echo $forecast | jq -r ".currently.icon")
next=$(echo $forecast | jq -r ".daily.data[0].icon")
#now=$(weathericon $now)
next=$(weathericon $next)

echo "$temp $next"