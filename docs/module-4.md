# Create a Python Script

Now that you have created the minimum elements of your DNAC SDK you can use it in a python script just like any other module or package.  This section will illustrate creating and executing a simple python script that utilizes the Python package just created. 

## Steps

**STEP 1.** *CREATE* a file named `test_dnac_sdk.py` in the root of the project

`touch test_dnac_sdk.py`

**STEP 2.** *OPEN* the `test_dnac_sdk.py` file in your editor

**STEP 3.** *PASTE* the following code into the file

```python
from pprint import pprint
from dnac.client import dnaCenterApi

dnac = dnaCenterApi(
    'sandboxdnac2.cisco.com',
    'devnetuser',
    'Cisco123!',
    verify=True
)

# Retrieve and Print DNA Center Sites
site_query = {
    "type": "building"
}
sites = dnac.get_sites(params=site_query)
pprint(sites)

# Retrieve and Pring DNA Center Network Devices
devices = dnac.get_network_devices()
pprint(devices)

```

**STEP 4.** SAVE the file

**STEP 5.** *EXECUTE* the script

This step is executed in the development environment (Docker Container).  Please ensure your terminal is connected to that container. 

```shell
python test_dnac_sdk.py
```

