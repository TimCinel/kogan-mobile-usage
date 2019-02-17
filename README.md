# Kogan-Mobile-Usage

## Overview

Prints out a critical summary for the given Kogan mobile service
accounts.

## Configure

You'll need the following:

* Kogan Mobile login details for one or more services

Set these details in a file first, here's an example:

```
$ cat /etc/kogan.conf
Data 1:0400000002:123456
Data 2:0400000003:123456
Tim's Phone:0400000001:123456
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
{"account_alias": "Data 1", "period_renews": "20/02/2019", "period_quota_gb": "40GB", "used_percent": "100"}
{"account_alias": "Data 2", "period_renews": "02/03/2019", "period_quota_gb": "40GB", "used_percent": "100"}
{"account_alias": "Tim's Phone", "period_renews": "06/03/2019", "period_quota_gb": "40GB", "used_percent": "2"}
```
