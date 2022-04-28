[![Header](https://github.com/teunjojo/teunjojo/raw/main/github-header-image.png)](https://www.teunjojo.com)
[![Download](https://img.shields.io/badge/Download-success?style=for-the-badge)](https://files.teunjojo.com/download.php?file=check-version)
![Version](https://img.shields.io/badge/dynamic/json?color=informational&label=version&prefix=v&query=%24.version&url=https%3A%2F%2Ffiles.teunjojo.com%2Flatest.php%3Frepo%3Dcheck-version%26data_type%3Djson&style=for-the-badge&cacheSeconds=60)
[![Website](https://img.shields.io/badge/website-e0dad3?style=for-the-badge)](https://www.teunjojo.com)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge)](https://github.com/teunjojo)&nbsp;
[![Donate](https://img.shields.io/badge/Donate-yellow?style=for-the-badge)](https://www.paypal.com/donate/?hosted_button_id=U9YA79HDTWTZW)

# check-version
Shell script that send a Pushover notification when there is a version update of Vanilla Minecraft, PaperMC or WaterfallMC

## installation
1. [Set up Pushover](https://support.pushover.net/i7-what-is-pushover-and-how-do-i-use-it)
2. Run the script once manually and then edit the created config file.
3. Add the script to your cronjob file
    - Execute `crontab -e`
    - Add line `0 * * * * /path/to/script.sh` to the file (This executes the script every hour)
    - Save the file
