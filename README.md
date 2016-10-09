# Docker Chromium for LibreELEC on RPi
## Based on work by dead
To build the corresponding Docker image and run it in a Docker container:

```
wget https://github.com/awiouy/chromium-elec/archive/master.zip
unzip master.zip
cd chromium-elec-master
docker build -t chromium docker
chmod +x chromium.start
./chromium.start
```
