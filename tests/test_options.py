#!/usr/bin/env python3
# Copyright (C) 2024, Evgenii Sopov <mrseakg@gmail.com>

import requests

url0 = "http://localhost:8080/auth/signup"

url1 = "http://localhost:8080/api/boards"

resp = requests.options(url1)
print(resp.status_code)
print(resp.headers)
