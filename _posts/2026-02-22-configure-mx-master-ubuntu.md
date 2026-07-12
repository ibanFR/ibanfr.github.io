---
title: "Configure your Logitech MX Master 4 mouse on Ubuntu with Solaar"
date: 2026-02-14
header:
  image: /assets/images/getxo-gorrondatxe-header.jpg
categories:
  - Operating Systems
tags:
  - Ubuntu
---

This guide explains how to configure your Logitech MX Master 4 mouse on Ubuntu using the [Solaar] application.


## Installing Solaar

To upgrade Solaar to the latest version on Ubuntu, add the official stable PPA to your system's Software Sources:

```bash
sudo add-apt-repository ppa:solaar-unifying/stable
sudo apt update
```

Install Solaar using the following command:

```bash
sudo apt install solaar
```

Check the version of Solaar installed:

```bash
solaar --version
```

See [Installation], in the [Solaar Documentation] for the latest installation instructions, as they may have changed since this guide was written.

## Configuring mouse gestures

The MX Master 4 supports directional gestures (`Mouse Up`, `Mouse Down`, `Mouse Left`, `Mouse Right`) triggered while holding
the Gesture Button.

To configure mouse gestures in Solaar, you must first set `Key/Button Diversion` for the `Mouse Gesture Button` to 
`Mouse Gestures`.

See [Key and button diversion] in the [Solaar Documentation] for more information on how to configure key/button diversion.

Here's an example of common mouse gestures that you can configure:

```yaml
# 2. Gestures: Hold Gesture Button and move (Requires Key/Button Diversion: ON)
- Rule:
  - MouseGesture: Mouse Up
  - KeyPress: [Super_L, a]           # Open Application Overview
  - click
---
- Rule:
  - MouseGesture: Mouse Down
  - KeyPress: [Super_L, d]           # Show Desktop
  - click
---
- Rule:
  - MouseGesture: Mouse Left
  - KeyPress: [Control_L, Alt_L, Left] # Switch to Left Workspace
  - click
---
- Rule:
  - MouseGesture: Mouse Right
  - KeyPress: [Control_L, Alt_L, Right] # Switch to Right Workspace
  - click
---
# 3. Simple Click: Press & Release Gesture Button (without moving)
- Rule:
  - And:
    - Key: [Mouse Gesture Button, released]
    - MouseGesture: []
  - KeyPress: Super_L                # Toggle Start Menu/Activities
  - click
```

Save the above configuration in `~/.config/solaar/rules.yaml` and restart Solaar for the changes to take effect.

## Configuring the thumb wheel

The MX Master 4 supports a thumb wheel that can be configured to perform different actions when scrolled up or down.

To configure rules for the thumb wheel in Solaar, you must first turn on the `Thumb Wheel Diversion`.

### Configure thumb wheel for tab switching

Here's an example of how to configure the thumb wheel to switch between browser tabs:

```yaml
%YAML 1.3
---
# 1. Thumb Wheel: Tab Switching (Requires Thumb Wheel Diversion: ON)
- Rule:
    - Test: [thumb_wheel_up, 10]
    - KeyPress: [Control_L, Page_Down]  # Next Tab
    - click
---
- Rule:
    - Test: [thumb_wheel_down, 10]
    - KeyPress: [Control_L, Page_Up]    # Previous Tab
    - click
```

### Configure thumb wheel for volume control

Here's an example of how to configure the thumb wheel to control the system volume:

```yaml
%YAML 1.3
---
# 1. Thumb Wheel: Volume Control (Requires Thumb Wheel Diversion: ON)
- Rule:
    - Test: [thumb_wheel_up, 10]
    - KeyPress: XF86AudioRaiseVolume  # Volume Up
    - click
---
- Rule:
    - Test: [thumb_wheel_down, 10]
    - KeyPress: XF86AudioLowerVolume  # Volume Down
    - click
```

## Uninstalling Solaar

If you have previously installed Solaar, you can uninstall it using the following command:

```bash
sudo apt remove --purge solaar
```

Delete the Solaar configuration directory:

```bash
rm -rf ~/.config/solaar
```

## Other resources

- [Configure your Logitech MX Master 3/3S/4 mouse on Ubuntu with Solaar](https://medium.com/@tihomir.manushev/configure-your-logitech-mx-master-3-mouse-on-ubuntu-with-solaar-407f76f4890e)

[Solaar]: https://github.com/pwr-Solaar/Solaar
[Solaar Documentation]: https://pwr-solaar.github.io/Solaar/
[Installation]: https://pwr-solaar.github.io/Solaar/installation/
[Key and button diversion]: https://pwr-solaar.github.io/Solaar/rules/#key-and-button-diversion

