# Create a Python Module: session

Packages are directories that contain the `__init.py__` file and some number of Python files called modules.   This section will guide you through creating the first Python module to accomplish the REST Client functionality. 

> *Modules in Python are simply Python files with a .py extension. The name of the module will be the name of the file. A Python module can have a set of functions, classes or variables defined and implemented.*
>
> ​	*ref: https://www.learnpython.org/en/Modules_and_Packages*

## Create the File

**STEP 1**. *CREATE* a file named **session.py** in the `dnac` folder

This Python file (module) will sub-class the `requests.Session` class and serve as our object to handle all things related to the HTTP(S) session with DNA Center.  

**STEP 2**. *ADD* the base session text

!!! note
    The `requests` package is the de facto standard Python package for making HTTP requests.  You can read more about the Python package :arrow_right: [requests](https://docs.python-requests.org/en/master/)

```python
#!/usr/bin/env python

import requests


class dnacApiSession(requests.Session):
    """
    Session Wrapper for DNAC
    """

    def __init__(self, *args, **kwargs):
        """
        Initialize Object
        """
        super(dnacApiSession, self).__init__(*args, **kwargs)

        self.headers.update(
            {
                'Content-Type': 'application/json'
            }
        )

    def set_basic_auth(self, username, password):
        """
        Set the auth attribute of the session object
        params:

          username (str) - login username
          password (str) - login password
        """
        self.auth = (username, password)
```

### What does this do?

This Python module illustrates the use of sub-classing, a key concept in object-oriented programming, to utilize all of the existing functionality in the `requests` package while providing the ability to customize settings for our specific use case.  

The `__init__` method calls the `__init__` method of the parent class (`requests.sessions.Session`) and sets a header value for all calls.

The `set_basic_auth` method sets the attribute named `auth` of the `Session` object. 

This simple example illustrates the power and simplicity of object oriented programming. 

