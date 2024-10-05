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

where ``` flask ``` is the name of the flask app.
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

NB: at times you would have to first login to docker hub to this use the command

bash 

``` 
docker login 
``` 

and provide your credentials. if your new to docker hub create a new account on [Docker](https://hub.docker.com/)

**hurray step one is done you have successfully push your first docker image to dockerhub**

## Step 2 Adding it to a Kubernetics cluster

In this part we are going to use KinD.

* First we need to install kind using the following command 

bash
```
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.18.0/kind-linux-amd64

chmod +x ./kind

sudo mv ./kind /usr/local/bin/kind
```

once that is done we can now create a cluster using the following command

bash
```
kind create cluster --name kouti-flask-cluster
```

NB: if this is your first time creating a cluster it would take some time to create the cluster.

then we load the docker image into the cluster using this command

bash
```
kind load docker-image kouti/flask:latest --name kouti-flask-cluster
```

we have 2 files services and deployments so we run this

bash
```
kubectl apply -f deployment.yaml

kubectl apply -f service.yaml
```

once that is done run the following comand to verify the deployment and get an external ip adress.

bash
```
kubectl get pods -n kouti-flask-app-namespace #this is to see if the service is running

kubectl get services -n kouti-flask-app-namespace #this is to get the services that are under the namespace

kubectl get svc  my-api-service #to get an external ip
```
yup yup yup you have successfully added your docker image to kubernetes cluster.

well done

## step 3 Creating the CI/CD pipeline

Now each time we make a change we do not wanT to redo this whole process again by our selves so what do we do?? **we automate the whole process**

And we can do this using dfferent tools like Jenkins and Github actions but in this case we are going to use **Github actions**

So to do this we would:

* create a file called deploy.yml (you can name it anything but we would use deploy.yml here) in the .github/workflows

NB: note that we did not create any folder like this so you would have to create the folders. 

* once this is done enter your code and then push to github.(the code we are entering are the things we did in step 1 and 2 above). also we would have to create an additional file called namespace.yaml this is so as to define the namespace you can just use the command

* check out the ````deploy.yml```` file to see how to go about it.

## step 4 some security measure implemented

* using Github secretes to configure Dockerhub secrets
* deploying the app in a different namespace for isolation
* using upto date dependencies
* usinf security headers like Flask Talisman

## Conclusion

PLease bear with me if there are any inconsistencies between the names or writing. Please let me know what you think :)


Well had some troubles at the beginning with kubernets because i tried installing kubectl on its own. then a fellow sister explained that once i had KinD installed there was no need installing kubectl again.

overall this was cool and fun even though i finished late. 

I was able to containerise a simple web app and also deploy it to kubernets and also create a CI/CD pipeline to automate the whole process.

I learned alot and looking forward to the next project. 