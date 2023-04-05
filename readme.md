# Signaling server for jupyterlite
Dockerfile and Helm chart deploying the signaling server for jupyterlite real time collobroation.

## Building and pushing the server image
Build the docker image using the `dockerfile` in the root folder<br />

Example on building and pushing the images to localhost: <br />

```
docker build --no-cache -t localhost:32000/signal-server:tag1 .
docker push localhost:32000/signal-server:tag1
```
## Deploy the server using Kubernetes

Modify the `values.yaml` for configuring your own image name, domain name, URL, and ip whitelist, if applicable.

Create a new namespace
```
kubectl create namespace my_namespace
```
Install a new helm release
```
sudo helm install release1 --debug . --values values.yaml --namespace=my_namespace
```

## Testing the signaling server

Use wss connection tool such as wscat, or online tools like https://www.piesocket.com/websocket-tester to connect the server. Ther server url should be `wss://<your domain name>/<your path`> or `ws://<your domain name>/<your path>`.

After connection is established, try send the message `{"type":"ping"}`, if the sever should return `{"type":"pong"}`.















