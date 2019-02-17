# Kogan-Mobile-Usage

Report on Kogan Mobile prepaid data usage

## Overview


## Configure

You'll need the following:

* Kogan Mobile login details

Set these details in environment variabes first, here's an example:

```
$ cat /etc/kogan-mobile-usage.conf
Main Phone:0400000001:123456
Data 1:0400000002:123456
Data 2:0400000003:123456
```

## Build

Just use docker:

```
$ docker build -t timcinel/kogan-mobile-usage .
...
```

## Run

Just run it, baby.

```
$ docker run --rm -ti -v /etc/kogan.conf:/etc/kogan.conf timcinel/kogan-mobile-usage /etc/kogan.conf
Data 1
======
{"usage": "100", "renew": "20/02/2019"}

Data 2
======
{"usage": "100", "renew": "02/03/2019"}

Tim's Phone
===========
{"usage": "2", "renew": "06/03/2019"}
```
