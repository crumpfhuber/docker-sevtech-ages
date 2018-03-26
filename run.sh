#! /bin/sh
docker run -d -p 25565:25565 --name minecraft --mount source=minecraft_world,target=/opt/ftb/world beyond
