# Home Assistant Add-On for Nightscout

Nightscout acts as a web-based CGM (Continuous Glucose Montinor) to allow multiple caregivers to remotely view a patients glucose data in realtime.

This add-on is a wrapper around [nightscout/cgm-remote-monitor][cgm-remote-monitor].
Please refere to their documentation for issues releated to Nightscout and not this add-on.

It includes a Mongo Database which is used to store the uploaded values.

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Home Assistant add-on.

1.  [Add our Home Assistant add-ons repository][repository] to your Home Assistant instance.
2.  Install the "Nightscout" add-on.
3.  Change the configuration files with the required values.
4.  Start the "Nightscout" add-on
5.  Check the logs of the "Nightscout" add-on to see if everything went well.
6.  Click "OPEN WEB UI" to open the Nightscout website.
7.  Log in with your `api_key`.

**NOTE**: Starting the add-on might take a couple of minutes (especially the
first time starting the add-on).

**NOTE**: Do not add this repository to Home Assistant, please use:
`https://github.com/marciogranzotto/addons-repository`.

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```yaml
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
api_key: CHANGEMEPLEASE
auth_default_roles: readable
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

### Option: `auth_default_roles`

Possible values: `readable` (default), `denied`, `status-only`,  or any valid role name, such as: `admin`, `careportal`, `devicestatus-upload`, and `activity`.

This will set the `AUTH_DEFAULT_ROLES` enviroment variable as described in the [Nightscout documentation][nightscout-docs-features]

When `readable`, anyone can view Nightscout without a token. You wont't need the token on the Home Assistant integration.

Setting it to `denied` will require a token from every visit, using `status-only` will enable api-secret based login. This will make the token REQUIRED on the Home Assistant integration in order to fetch the sensor values.

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

After HA `v0.115.0`, the Nightscout integration is available as a native one. You can check the documentation on <https://www.home-assistant.io/integrations/nightscout>

## Uploading data

Using any of the supported apps, like `xDrip+`, `Gimp` and `Spike`, enter the URL of your instance following this pattern:

```url
https://YOURAPIKEY@address.to.your.hass.io:5423/api/v1/
```

Just change the api key, url address and port, if needed.

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases]
functionality. The format of the log is based on
[Keep a Changelog][keepchangelog].

Releases are based on [Semantic Versioning][semver], and use the format
of `MAJOR.MINOR.PATCH`. In a nutshell, the version will be incremented
based on the following:

-   `MAJOR`: Incompatible or major changes.
-   `MINOR`: Backwards-compatible new features and enhancements.
-   `PATCH`: Backwards-compatible bugfixes and package updates.

[keepchangelog]: http://keepachangelog.com/en/1.0.0/

[releases]: https://github.com/marciogranzotto/addon-nightscout/releases

[repository]: https://github.com/marciogranzotto/addons-repository

[cgm-remote-monitor]: https://github.com/nightscout/cgm-remote-monitor

[nightscout-docs-features]: https://github.com/nightscout/cgm-remote-monitor#features
