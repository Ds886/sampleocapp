This repo is an example for a simple node project with connection to postgres

Postgres contain hardcoded password for demo purposes

Images pushed manually to the following docker hub repo `https://hub.docker.com/r/dash886/php-ws/tags`
For example of a fuller pipeline see the following Java [repo](https://github.com/Ds886/simplejava) (originally for flux/kpack setup)

# Openshift
run the following command from the root directory to install postgres
```
helm install pgsql infra/postgresql
```

# Running locally

## Prereqs
1. After deploying postgres to the cluster expose locally the postgres pos
```
kubectl port-forward pgsql-postgresql-0 5432:5432
```
2. Update the .env with the details
  user - postgres
  password - The output of the command `kubectl get secrets pgsql-postgresql -ojson|jq -r '.data."postgres-password"' |base64 -d`
  port - 5432
  host - 127.0.0.1

## Run local container build 
```
./run.sh
````

## Build production image
```
./build-prod.sh
  
```

## Build and run production image
```
./build-prod.sh run
  
```

## deploy a dev build to openshift using nodeshift(deprecated)
npx nodeshift --deploy.port 8080 --expose
