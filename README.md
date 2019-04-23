Rings the [Critical Annoyance](http://tvtropes.org/pmwiki/pmwiki.php/Main/CriticalAnnoyance) bell in Starbound!
# About

*It really does what the title says.*

A stupid-simple Starbound mod that provides an audible warning to users when their health falls below a configured value.

# Setup
There are two different versions of this mod: One for **client-side** installs, where it only uses base game assets, and **server-side** where you will also need the server to have a copy of the mod and any changed assets for it to work properly.

## Installation
### :warning:The manual way
Copy the contents of **server-side** into a new folder in your **mods** directory called **LowHealthAlarm**.
### :warning:Chucklefish Forums
You can download this mod from the [**Chucklefish Forums**](https://community.playstarbound.com/resources/low-health-alarm.4879/) as well. The same process as above, copy the download into your **mods** directory.

### :white_check_mark:Steam Workshop
Subscribe to the mod on the [**Steam Workshop**](http://steamcommunity.com/sharedfiles/filedetails/?id=1086805718)

## Changing this to your personal tastes
**Note: These changes won't work on the Client version!**
It's actually really quite simple to make changes to this mod. If you want to simply a setting in the mod, create a **.patch**. If you want to change the sound effect that it uses, overwrite the sound effect at **/sfx/interface/low_health_alarm.ogg**

### Example patch
This patch will change time the mod waits before playing the beep to 0.5 seconds.
Create a new mod with only the following file, named **low_health_alarm.config.patch**
```json
[
  {
    "op": "replace",
    "path": "/alarmCooldown",
    "value": 0.5
  }
]
```
### Configuration Variables
| Variable Name | Effect      | Default |
| :---          | :---        |    ---: |
| **alarmFadeTime** | Time, in seconds, that the mod fades the alarm sound over. *(0 disables)* | 10
| **alarmFadeVolume** | The volume that the alarm sound will fade to. *(Number from 0 to 1)* | 0.75
| **alarmCooldown** | Time, in seconds, that the mod waits between playing beep sounds. | 1
| **alarmThreshold** | The value that the player's health must be below, before the alarm starts beeping. *(Percentage, as a number between 0 and 1)* | 0.25
