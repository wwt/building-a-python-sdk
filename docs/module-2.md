# Create a Python Module: REST Client

Packages are directories that contain the `__init.py_` file and some number of Python files called modules.  

> *Modules in Python are simply Python files with a .py extension. The name of the module will be the name of the file. A Python module can have a set of functions, classes or variables defined and implemented.*
>
> ​	*ref: https://www.learnpython.org/en/Modules_and_Packages*

## Create the File

**STEP 1**. *CREATE* a file named **client.py** in the `dnac` folder

This file will be our REST Client in our SDK and will be responsible for all REST functionality including ***authentication*** and ***requests*** (like PUT/POST/GET/DELETE).

**STEP 2**. *ADD* the base client text

This is a REST client and will utilize the `requests` package for making REST calls. The `requests` package is the de facto standard Python package for making HTTP requests.  You can read more about the Python package :arrow_right: [requests](https://docs.python-requests.org/en/master/)

```python
#!/usr/bin/env python

import requests
from requests.packages.urllib3.exceptions import InsecureRequestWarning

requests.packages.urllib3.disable_warnings(InsecureRequestWarning)

LOGIN_ENDPOINT = '/dna/system/api/v1/auth/token'
DISABLE_INSECURE_WARNINGS = True

class dnacClient():


    def __init__(self, host, username, password, verify=False):
        """ Initiallize the Client """
        self.host = host
        self.username = username
        self.password = password
        self.session = None
        self.verify = verify
        self.login_url = f"https://{host}{LOGIN_ENDPOINT}"
        self.token = ''

        if DISABLE_INSECURE_WARNINGS:
            requests.packages.urllib3.disable_warnings(InsecureRequestWarning)

        self.create_session(host, username, password, verify)
```



## Create Session Method

This method will be used during the instantiation of the object from our class definition.  It will establish a session with the DNA Center appliance and obtain a valid token for all subsequent call to that DNA Center. 

STEP 1.  *PASTE* the following into the `client.py` file

```python
    def create_session(self, host, username, password, verify):
        """ create session to DNA Center """

        _session = requests.session()
        _session.verify = verify
        _session.auth = (username, password)

        _login_results = _session.post(self.login_url)

        if _login_results.ok:
            self.session = _session
            # self.api = dnaCenterApi(self)
            self.token = _login_results.json().get("Token")
            print(f"successfully established session to {host}")
        else:
            print("failed to establish session: ", _session)

```

## Make Request Method

STEP 1.  *PASTE* the following into the `client.py` file

```python
    def _make_request(self, method, url):
        """ make rest request """

        results = self.session.request(method,url, data=None)
        return results
```

## Full File

```python
#!/usr/bin/env python

import requests
from requests.packages.urllib3.exceptions import InsecureRequestWarning

requests.packages.urllib3.disable_warnings(InsecureRequestWarning)

LOGIN_ENDPOINT = '/dna/system/api/v1/auth/token'
DISABLE_INSECURE_WARNINGS = True

class dnacClient():


    def __init__(self, host, username, password, verify=False):
        """ Initiallize the Client """
        self.host = host
        self.username = username
        self.password = password
        self.session = None
        self.verify = verify
        # self.api = None
        self.login_url = f"https://{host}{LOGIN_ENDPOINT}"
        self.token = ''

        if DISABLE_INSECURE_WARNINGS:
            requests.packages.urllib3.disable_warnings(InsecureRequestWarning)

        self.create_session(host, username, password, verify)


    def create_session(self, host, username, password, verify):
        """ create session to DNA Center """

        _session = requests.session()
        _session.verify = verify
        _session.auth = (username, password)

        _login_results = _session.post(self.login_url)

        if _login_results.ok:
            self.session = _session
            # self.api = dnaCenterApi(self)
            self.token = _login_results.json().get("Token")
            print(f"successfully established session to {host}")
        else:
            print("failed to establish session: ", _session)

    def _make_request(self, method, url):
        """ make rest request """

        results = self.session.request(method,url, data=None)
        return results

```

