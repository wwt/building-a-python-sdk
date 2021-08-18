# Clone the Repo

One of the very first skills you learn when starting the journey to becoming an automation engineer is version control. 

There are multiple ways to clone a repository so feel free to use whatever method you are comfortable with. 

The steps below show how to clone a repo from a terminal window.

## STEPS

1. *NAVIGATE* to the repo on GitHub :arrow_right: [devasc-building-a-python-sdk](https://github.com/wwt/devasc-building-a-python-sdk)

2. *CLICK* the **Code** button 

3. *SELECT* the transport (HTTPS or SSH)

4. *CLICK* the **Copy** icon

5. *OPEN* a new **Terminal**

6. *PASTE* `git clone` plus that string into your **Terminal**

   !!! example
       **SSH** `git clone git@github.com:wwt/devasc-building-a-python-sdk.git`

   ​    **HTTPS** `git clone https://github.com/wwt/devasc-building-a-python-sdk.git`

   !!! important
       The command above will clone down the repository creating a subfolder with the name of the repo in the folder where you ran the command.

7. *OPEN* the new Folder in Visual Studio Code using **Open Folder**

This repo contains a starting framework from which you will expand to build a Python SDK. 

The repository also contains a portable development environment in the form of a `Dockerfile`, `requirements.txt`, and `.devcontainer.json` files.  

If you are using Visual Studio Code you will be prompted to *"reopen in container"* when the`.devcontainer.json` file is detected. 

If you are not using Visual Studio Code you will need to build the Docker image, then launch it to utilize. 

