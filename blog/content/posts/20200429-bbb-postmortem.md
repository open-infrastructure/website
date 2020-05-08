---
title: "20200429 BigBlueButton Outage Post-Mortem"
date: 2020-04-29T13:14:22+02:00
draft: false
---

# BigBlueButton Outage

## What happened?
On the 28th April 2020 our system did an auto update (as always).

This upgrade included a minor version upgrade from 2.2.6 to 2.2.7 for the BBB core components and something that should've be a fix for freeswitch settings.

After this update the system stopped working.

## What was the problem?
The problem we've occured was, that the freeswitch service was unable to bind to it's IPv4 Address (local) and only to a generated linklocal IPv6 address.

We created an issue on the GitHub project (https://github.com/bigbluebutton/bigbluebutton/issues/9322) and took a look into this problem at the same time.

After a short time we found 