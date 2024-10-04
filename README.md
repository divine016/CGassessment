# CGassessment
In this project, we deploy the flask app to a Kubernetes cluster, implement basic security practices, and set up a CI/CD pipeline to automate testing, building, and deploying the application.

## Step 1 Build and run the docker image

check the Dockerfile for more information on how to configure your docker file such that it can run the flask app

once this is done you need to build the image use the following command 

bash
```
docker build -t kouti/flask .
```
where ```flask``` is the name of the flask app.
since we did not append a tag the lastest tag was added autoatically.


then run the following command

bash
```
docker run -p 5000:5000 kouti/flask
```

then push the file docker to docker hub using 

bash
```
docker push kouti/flask
``` 
## Step 2 Adding it to a Kubernetics cluster

here we have 2 files services and deployments.

once this is done we would run the following commands 

bash
```
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

