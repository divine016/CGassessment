# CGassessment
In this project, we deploy the flask app to a Kubernetes cluster, implement basic security practices, and set up a CI/CD pipeline to automate testing, building, and deploying the application.

#### Author: Kouti Divine (Cybergirl 4.0)

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

once that is done run the following comand to get an external ip adress.

bash
```
kubectl get pods -n kouti-flask-app-namespace #this is to see if the service is running

kubectl get services -n kouti-flask-app-namespace #this is to get the services that are under the namespace

kubectl get svc  my-api-service #to get an external ip
```

## step 3 creating the CI/CD pipeline
create a .github/workflows/deploy.yml. once this is done enter your code and then push to github..
## step 4 some security measure implemented
* using Github environment varibales to configure Dockerhub secrets
* deploying the app in a different namespace for isolation
* using uoto date dependencies
* usinf security headers like Flask Talisman

Well had some troubles at the beginning with kubernets because i tried installing kubectl on its own. then a fellow sister explained that once i had KinD installed there was no need installing kubectl again so this was cool and fun. I was able to containerise a simple web app and also deploy it to kubernets and also create a CI/CD pipeline to automate the whole process.