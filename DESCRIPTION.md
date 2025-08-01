# Pulse
&nbsp;  
![](https://raw.githubusercontent.com/RagedUnicorn/wow-pulse-meta/master/assets/ragedunicorn_love_classic_and_tbc.png)
&nbsp;  
_Pulse aims to give a visual interpretation of when the next resources tick happens. This can be used by multiple classes but the most prominent one might be rogue and his energy regeneration._

## Providers

[![](https://raw.githubusercontent.com/RagedUnicorn/wow-pulse-meta/master/assets/curseforge.svg)](https://www.curseforge.com/wow/addons/pulse)
[![](https://raw.githubusercontent.com/RagedUnicorn/wow-pulse-meta/master/assets/wago.svg)](https://addons.wago.io/addons/pulse)

## What is Pulse?

Pulse is a simple addon that tracks the energy-regen tickrate and the current amount of energy. The energybar will show up once the player spent some energy.

![](https://raw.githubusercontent.com/RagedUnicorn/wow-pulse-meta/master/assets/pulse_example.png)

## Configuration

Pulse can be configured through the in-game interface options. Access the configuration by:

1. Opening the game menu (ESC key)
2. Selecting "Options"
3. Navigating to "AddOns"
4. Finding "Pulse Options" in the list~~~~

Alternatively, you can use the slash command: `/pulse opt` or `/rgp opt`

### Available Settings

#### Energy Bar Positioning
- **Lock Energy Bar**: When enabled, prevents the energy bar from being moved by dragging. When disabled, you can drag the energy bar to reposition it anywhere on your screen.

#### Energy Bar Dimensions
- **Energy Bar Width**: Adjust the width of the energy bar to fit your UI layout. Use the slider to increase or decrease the horizontal size.
- **Energy Bar Height**: Adjust the height of the energy bar. Use the slider to increase or decrease the vertical size.

## Issues

[![](https://raw.githubusercontent.com/RagedUnicorn/wow-pulse-meta/master/assets/issues_classic.svg)](https://github.com/RagedUnicorn/wow-classic-pulse/issues) **Classic**

[![](https://raw.githubusercontent.com/RagedUnicorn/wow-pulse-meta/master/assets/issues_bcc.svg)](https://github.com/RagedUnicorn/wow-bcc-pulse/issues) **Burning Crusade Classic**

## Source

[![](https://raw.githubusercontent.com/RagedUnicorn/wow-pulse-meta/master/assets/source_classic.svg)](https://github.com/RagedUnicorn/wow-classic-pulse) **Classic**

[![](https://raw.githubusercontent.com/RagedUnicorn/wow-pulse-meta/master/assets/source_bcc.svg)](https://github.com/RagedUnicorn/wow-bcc-pulse) **Burning Crusade Classic**

## FAQ

#### The Addon is not showing up in WoW. What can I do?

Make sure to recheck the installation part of this Readme and check that the Addon is placed inside `[WoW-installation-directory]\Interface\AddOns` and is correctly named as `Pulse`.

#### The Addon is spamming my chat with messages. Why is it doing this?

Chances are you downloaded a development version of the addon. If you directly download the master branch you will get a development version that is printing a lot of debug message to the chat. Make sure that you download a release version of the addon here - [Pulse-Releases](https://github.com/RagedUnicorn/wow-classic-pulse/releases)

#### I get a red error (Lua Error) on my screen. What is this?

This is what we call a Lua error, and it usually happens because of an oversight or error by the developer (in this case me). Take a screenshot off the error and create a GitHub Issue with it, and I will see if I can resolve it. It also helps if you can add any additional information of what you were doing at the time and what other addons you have active. Additionally, if you are able to reproduce the error make sure to check if it still happens if you disable all others addons.
