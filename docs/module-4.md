# Create a Python Script

Now that you have created the minimum elements of your DNAC SDK you can use it in a python script just like any other module or package.  

STEP 1. CREATE a file named `test_dnac_sdk.py`

STEP 2. PASTE the following code into the file

```python
from pprint import pprint
from dnac.client import dnaCenterApi

dnac = dnaCenterApi(
    'sandboxdnac2.cisco.com',
    'devnetuser',
    'Cisco123!',
    verify=False
)

sites = dnac.get_sites()
pprint(sites)

devices = dnac.get_network_devices()
pprint(devices)

```

STEP 3. SAVE the file

STEP 4. EXECUTE the script

```shell
python test_dnac_sdk.py
```

