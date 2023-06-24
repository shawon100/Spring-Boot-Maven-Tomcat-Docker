# Docker Build
```
docker build -t springimage .
```

# Docker Image Run
```
docker run -d -p 8080:8080 --name springapp springimage
```

# Check
http://localhost:8080/sample/index?name=Shawon
