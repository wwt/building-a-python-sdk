# Create a Python Module: session

<img src="../_images/python_module_icon.png" alt="Python Module" style="zoom:25%;" />

Packages are directories that contain the `__init.py__` file and some number of Python files called modules.   This section will guide you through creating the first Python module which will handle the `session` functionality.

> *Modules in Python are simply Python files with a .py extension. The name of the module will be the name of the file. A Python module can have a set of functions, classes or variables defined and implemented.*
>
> ​	*ref: https://www.learnpython.org/en/Modules_and_Packages*

## Create the Module File

**STEP 1**. *CREATE* a file named **session.py** in the `dnac` folder

This Python file (module) will sub-class the `requests.Session` class and serve as our object to handle all things related to the HTTP(S) session with DNA Center.

!!! info "Read More About Class Inheritance in Python"
    [Real Python 'Super Change Your Classes with super()'](https://realpython.com/python-super/){target=_blank}

**STEP 2**. *ADD* the base session **text** (copy and paste the code below)

!!! note
    The `requests` package is the de facto standard Python package for making HTTP requests.  You can read more about the Python package :arrow_right: [requests](https://docs.python-requests.org/en/master/)

```python
#!/usr/bin/env python

import requests


class dnaCenterSession(requests.Session):
    """DNA Center Session Object

    Args:
        requests (Session): Sub-classes requests.Session
    """

    def __init__(self, *args: list, **kwargs: dict):
        """
        Initialize dnaCenterSession
        """
        super(dnaCenterSession, self).__init__(*args, **kwargs)

        self.headers.update(
            {
                'Content-Type': 'application/json'
            }
        )

    def set_basic_auth(self, username: str, password: str):
        """Set the credentials for Basic Auth on the session object

        Args:
            username (str): username for basic auth
            password (str): password for basic auth
        """
        self.auth = (username, password)

    def set_verify(self, verify: bool):
        """Sets the verify boolean of a request.Session object

        Args:
            verify (bool): Boolean for validating certificates
        """
        self.verify = verify

```

**STEP 3 .** *SAVE* the **file**

### What does this do?

This Python module illustrates the use of sub-classing, a key concept in object-oriented programming, to utilize all of the existing functionality in the `requests` package while providing the ability to customize settings for our specific use case.

The `__init__` method calls the `__init__` method of the parent class (`requests.sessions.Session`) using the `super()`  function and sets a header value for all calls.

The `set_basic_auth` method sets the attribute named `auth` of the `Session` object.

The `set_verify` method sets the boolean value for checking the validity of certificates or not during session establishment.

This simple example illustrates the power and simplicity of object oriented programming.

See [`requests` documentation](https://docs.python-requests.org/en/master/){target=_blank} for more info on the library.

