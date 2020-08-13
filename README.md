# Home Assistant Add-On for Nightscout

[![GitHub Release][releases-shield]][releases]
![Project Stage][project-stage-shield]
[![License][license-shield]](LICENSE.md)

![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports i386 Architecture][i386-shield]

![Project Maintenance][maintenance-shield]
[![GitHub Activity][commits-shield]][commits]

[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]


## About


Nightscout acts as a web-based CGM (Continuous Glucose Montinor) to allow multiple caregivers to remotely view a patients glucose data in realtime.

This add-on is a wrapper around [nightscout/cgm-remote-monitor][cgm-remote-monitor].
Please refere to their documentation for issues releated to Nightscout and not this add-on.

It includes a Mongo Database which is used to store the uploaded values.

![sample image](/images/sample.png)

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Home Assistant add-on.

1. [Add our Home Assistant add-ons repository][repository] to your Hass.io instance.
1. Install the "Nightscout" add-on.
1. Change the configuration files with the required values.
1. Start the "Nightscout" add-on
1. Check the logs of the "Nightscout" add-on to see if everything went well.
1. Click "OPEN WEB UI" to open the Nightscout website.
1. Log in with your `api_key`.

**NOTE**: Starting the add-on might take a couple of minutes (especially the
first time starting the add-on).

**NOTE**: Do not add this repository to Hass.io, please use:
`https://github.com/marciogranzotto/addons-repository`.

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```yaml
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
api_key: CHANGEMEPLEASE
plugins:
  - careportal
  - boluscalc
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `ssl`

Enables/Disables SSL (HTTPS) on the web interface of Nightscout. Set it `true`
to enable it, `false` otherwise.

### Option: `certfile`

The certificate file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `keyfile`

The private key file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `api_key`

The api key that will be used to login and upload data to Nightscout.

**Note**: _It has to be at least 12 characters long_

### Option: `plugins`

A list of plugins you would like to use.
You can see the list of available plugins on [nightscout/cgm-remote-monitor][cgm-remote-monitor]
The default list should be pretty much what you need.

## Embedding into Home Assistant

It is possible to embed Nightscout directly into Home Assistant, allowing you to
access your Nightscout through the Home Assistant frontend.

Home Assistant provides the `panel_iframe` integration, for these purposes.

Example configuration:

```yaml
panel_iframe:
  nightscout:
    title: Nightscout
    icon: mdi:water-alert
    url: https://address.to.your.hass.io:5423
```

**TODO**: Add configuration for sensors

## Uploading data

Using any of the supported apps, like `xDrip+`, `Gimp` and `Spike`, enter the URL of your instance following this pattern:
```
https://YOURAPIKEY@address.to.your.hass.io:5423/api/v1/
```
Just change the api key, url address and port, if needed.

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases]
functionality. The format of the log is based on
[Keep a Changelog][keepchangelog].

Releases are based on [Semantic Versioning][semver], and use the format
of ``MAJOR.MINOR.PATCH``. In a nutshell, the version will be incremented
based on the following:

- ``MAJOR``: Incompatible or major changes.
- ``MINOR``: Backwards-compatible new features and enhancements.
- ``PATCH``: Backwards-compatible bugfixes and package updates.

## Support

Got questions?

You can [open an issue here][issue] on GitHub.

## Contributing

This is an active open-source project. We are always open to people who want to
use the code or contribute to it.

We have set up a separate document containing our
[contribution guidelines](CONTRIBUTING.md).

Thank you for being involved! :heart_eyes:

## Authors & contributors

The original setup of this repository is by [Marcio Granzotto][marciogranzotto].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

## License
GNU GENERAL PUBLIC LICENSE
Version 3, 29 June 2007

 Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[anchore-shield]: https://anchore.io/service/badges/image/67d1185473090e99d5ac5e1bb4d1aa2295117a9bd3d7abbf8cd8a71e331c8388
[anchore]: https://anchore.io/image/dockerhub/marciogranzotto%2Funifi%3Alatest
[armhf-shield]:  https://img.shields.io/badge/armhf-no-red.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[buymeacoffee-shield]: https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg
[buymeacoffee]: https://www.buymeacoffee.com/automarcio
[commits-shield]: https://img.shields.io/github/commit-activity/y/marciogranzotto/addon-nightscout.svg
[commits]: https://github.com/marciogranzotto/addon-nightscout/commits/master
[contributors]: https://github.com/marciogranzotto/addon-nightscout/graphs/contributors
[dockerhub]: https://hub.docker.com/r/marciogranzotto/nightscout
[home-assistant]: https://home-assistant.io
[issue]: https://github.com/marciogranzotto/addon-nightscout/issues
[keepchangelog]: http://keepachangelog.com/en/1.0.0/
[license-shield]: https://img.shields.io/github/license/marciogranzotto/addon-nightscout.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2020.svg
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[releases-shield]: https://img.shields.io/github/release/marciogranzotto/addon-nightscout.svg
[releases]: https://github.com/marciogranzotto/addon-nightscout/releases
[repository]: https://github.com/marciogranzotto/addons-repository
[cgm-remote-monitor]: https://github.com/nightscout/cgm-remote-monitor
[marciogranzotto]: https://github.com/marciogranzotto
