#!/bin/bash
version=1.4

lib="libteunjojo"
[ ! -f "$lib.sh" ] && curl -s -o $lib.sh https://files.teunjojo.com/$lib/latest/$lib.sh && chmod +x $lib.sh
source $lib.sh

latestPaper=$(curl -sb -H "Accept: application/json" "https://api.papermc.io/v2/projects/paper" | jq .versions[-1] | tr -d \")
latestWaterfall=$(curl -sb -H "Accept: application/json" "https://api.papermc.io/v2/projects/waterfall" | jq .versions[-1] | tr -d \")
latestMojang=$(curl -s 'https://launchermeta.mojang.com/mc/game/version_manifest.json' | jq -r ".latest.release")

source $cache
source $conf > /dev/null 2>&1 || die "Invalid config file"
[ -z "$knownPaper" ] && echo knownPaper=$latestPaper >> $cache
[ -z "$knownWaterfall" ] && echo knownWaterfall=$latestWaterfall >> $cache
[ -z "$knownMojang" ] && echo knownMojang=$latestMojang >> $cache
[ -z "$notifyPapermc" ] && echo notifyPapermc=true >> $conf
[ -z "$notifyWaterfallmc" ] && echo notifyWaterfallmc=true >> $conf
[ -z "$notifyMojang" ] && echo notifyMojang=true >> $conf
source $cache
source $conf

[ "$knownPaper" != "$latestPaper" ] && mes+=("PaperMC just released version $latestPaper")
[ "$knownWaterfall" != "$latestWaterfall" ] && mes+=("WaterfallMC just released version $latestWaterfall")
[ "$knownMojang" != "$latestMojang" ] && mes+=("Mojang just released version $latestMojang")

[ -z "$mes" ] && exit

last=${mes[$(( ${#mes[*]} - 1 ))]}

for m in "${mes[@]}"
do
  if [ "$message" ]; then [ "$m" == "$last" ] && message+=" and " || message+=", "; fi
  message+="$m"
done

pushover "New release$([ ${#plugin[@]} != 1 ] && echo s)" "$message"
cache knownPaper $latestPaper
cache knownWaterfall $latestWaterfall
cache knownMojang $latestMojang
