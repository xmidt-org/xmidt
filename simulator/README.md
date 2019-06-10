# rdkb-simulator
A docker file and assorted support files for an rdkb-simulator (from the Xmidt perspective)

# To Build

1. Install *docker-ce* locally.
    ```
    Instructions to install docker-ce on Ubuntu:
    
    1) Remove any old installation and update:
        > sudo apt-get remove docker docker-engine docker.io
        > sudo apt-get update
        > sudo apt autoremove
    2) Install essential packages:
        > sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
    3) Add key and verify if key is added:
        > curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        > sudo apt-key fingerprint 0EBFCD88
        > sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
          note: The command 'lsb_release -cs' should print the system codename e.g. xenial, otherwise replace with suitable command.
       
    4) Install docker-ce:
        > sudo apt-get update
        > sudo apt-get install docker-ce
    
    Test: verify if docker-ce installation is success by running hello-world:
    > sudo docker run hello-world
    
    ```
    
2. Run: ```sudo docker build -t rdkb-simulator .```


# To Execute

Run:
```sudo docker run -e CMAC=xxxx rdkb-simulator```
