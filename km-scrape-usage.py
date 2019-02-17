#!/bin/env python2.7

import requests
import os
import re
import json

def get_details(username, password):

    session = requests.Session()

    log_in(session, username, password)

    summary_text = get_summary(session).text

    usage_match = re.search(r'data-percent="([0-9]+)%"', summary_text)
    renew_match = re.search(r'Data renews on the midnight of ([0-9/]+)', summary_text)

    if usage_match is None:
        raise "Couldn't determine usage"

    if renew_match is None:
        raise "Couldn't determine renewal date"

    return {
        "usage": str(usage_match.group(1)),
        "renew": str(renew_match.group(1)),
    }

def get_summary(session):
    return session.get('https://accounts.koganmobile.com.au/customer/summary')

def log_in(session, username, password):

    login_get_r = session.get('https://accounts.koganmobile.com.au/customer/login')

    token_match = re.search(r'"csrfToken": \'([^\']+)\'', login_get_r.text)

    if token_match is None:
        raise "failed to get token, bailing"

    token = token_match.group(1)

    payload = {
        "user_name": username,
        "user_password": password,
        "csrfToken": token,
    }

    return session.post('https://accounts.koganmobile.com.au/customer/login', data=payload)

print json.dumps(get_details(os.environ['KOGANMOBILE_USERNAME'], os.environ['KOGANMOBILE_PASSWORD']))
