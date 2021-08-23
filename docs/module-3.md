# Create a Python Module : client

The job of the **client** module is to *wrap* the REST endpoints available on the platform.  This section will build the API wrapper module using a combination of resources as a reference.

[DNA Center API Documentation](https://developer.cisco.com/docs/dna-center/#!cisco-dna-1-3-3-x-api-api-authentication-authentication-api)

[Python Classes](https://docs.python.org/3/tutorial/classes.html)

## Create the Class

**STEP 1.** *CREATE* a file named **client.py** in the `dnac/` directory (the package)

Python modules are just files with the `.py` extension. 

**STEP 2.** *OPEN* the `dnac/client.py` file in your editor

**STEP 3.** `import` the REST Client you created using relative imports 

```python
from .session import dnacApiSession
```

!!! tip "Read More on Relative Imports"   
    Here is a reference for [Relative Imports](https://realpython.com/absolute-vs-relative-python-imports/) in Python

**STEP 4.** *CREATE* a **class** named **dnaCenterApi**

```python

class dnaCenterApi:

```

**STEP 5.** *DEFINE* a method named `__init__`

```python
    def __init__(self, host, username, password, verify=False):
        """
        Initializer
        """
        self.session = dnacApiSession()
        self.host = host
        self.base_url = f"https://{host}"

        if username and password:
            self.session.init_basic_auth(username, password)

        self.get_token()

```

**STEP 6.** *DEFINE* a method named `get_token`

```python
    def get_token(self):
        """
        Authenticate to DNA Center and generate a token
        """

        _response = self.session.post(
            self.build_url('/dna/system/api/v1/auth/token')
            )

        if _response.ok:

            print(f"Successfully established a session with: {self.host}")

            self.session.headers.update(
                {
                    'x-auth-token': _response.json().get('Token')
                }
            )

```

**STEP 7.** *DEFINE* a method named `build_url`

```python
    def build_url(self, resource):
        """
        Build the url
        """
        return self.base_url + resource

```

**STEP 8.** *DEFINE* a method named `_make_request`

```python
    def _make_request(self, method, url):
        """
        make rest request
        """
        results = self.session.request(method, url, data=None)

        if results.ok:
            return results.json()

        results.raise_for_status()
```



!!! success "You did it!"
    Launch iPython and see if your code works.

![image-20210819162115627](_images/image-20210819162115627.png)

## Add API Wrapper Method to Get Sites

Now that the basic mechanics of your API Client work and you can establish a session with a DNA Center it's time to **add** some functions to target specific REST Endpoints.  The first endpoint that will be added is the **site** endpoint.  

```python
    def get_sites(self):
        """
        Retreives site(s) from DNA Center
        """
        resource = "/dna/intent/api/v1/site"
        return self._make_request('GET', self.build_url(resource))

```



## Add API Wrapper Method to Get Network Devices 

```python
    def get_network_devices(self):
        """
        Retrieves network devices from DNA Center
        """
        resource = "/dna/intent/api/v1/network-device"
        return self._make_request('GET', self.build_url(resource))
```

## Full File

```python
#!/usr/bin/env python

from .session import dnacApiSession


class dnaCenterApi:
    """
    DNA Center API Wrapper Class
    """

    def __init__(self, host, username, password, verify=False):
        """
        Initializer
        """
        self.session = dnacApiSession()
        self.host = host
        self.base_url = f"https://{host}"

        if username and password:
            self.session.init_basic_auth(username, password)

        self.get_token()

    def get_token(self):
        """
        Authenticate to DNA Center and generate a token
        """

        _response = self.session.post(
            self.build_url('/dna/system/api/v1/auth/token')
            )

        if _response.ok:

            print(f"Successfully established a session with: {self.host}")

            self.session.headers.update(
                {
                    'x-auth-token': _response.json().get('Token')
                }
            )

    def build_url(self, resource):
        """
        Build the url
        """
        return self.base_url + resource

    def _make_request(self, method, url):
        """
        make rest request
        """
        results = self.session.request(method, url, data=None)

        if results.ok:
            return results.json()

        results.raise_for_status()

    # API Endpoints

    def get_sites(self):
        """
        Retreives site(s) from DNA Center
        """
        resource = "/dna/intent/api/v1/site"
        return self._make_request('GET', self.build_url(resource))

    def get_network_devices(self):
        """
        Retrieves network devices from DNA Center
        """
        resource = "/dna/intent/api/v1/network-device"
        return self._make_request('GET', self.build_url(resource))

```





