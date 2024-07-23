#!/usr/bin/env python3
# Copyright (C) 2024, Evgenii Sopov <mrseakg@gmail.com>

import requests

url_signup = "http://localhost:8080/auth/signup"
data_signup = {
    'name': 'testuser',
    'password': 'testuser',
}

resp = requests.post(
    url_signup,
    json=data_signup,
    headers={
        "Content-Type": "application/json; charset=UTF-8",
    }
)

print(resp.status_code)
print(resp.text)