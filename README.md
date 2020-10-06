# Deploy .NET Core App to Kubernetes Engine on Microsoft Azure and configure its traffic managed by Istio

`dotnet --verison`
`3.1.108`

```bash
dotnet new mvc -o HelloWorldAspNetCore
The template "ASP.NET Core Web App (Model-View-Controller)" was created successfully.
This template contains technologies from parties other than Microsoft, see https://aka.ms/aspnetcore/3.1-third-party-notices for details.

Processing post-creation actions...
Running 'dotnet restore' on HelloWorldAspNetCore/HelloWorldAspNetCore.csproj...
  Restore completed in 82.71 ms for /home/auxyrii/Workspace/HelloWorldAspNetCore/HelloWorldAspNetCore.csproj.

Restore succeeded.
```

`cd HelloWorldAspNetCore`

```bash
tree .
.
├── appsettings.Development.json
├── appsettings.json
├── bin
│   └── Debug
│       └── netcoreapp3.1
│           ├── appsettings.Development.json
│           ├── appsettings.json
│           ├── HelloWorldAspNetCore
│           ├── HelloWorldAspNetCore.deps.json
│           ├── HelloWorldAspNetCore.dll
│           ├── HelloWorldAspNetCore.pdb
│           ├── HelloWorldAspNetCore.runtimeconfig.dev.json
│           ├── HelloWorldAspNetCore.runtimeconfig.json
│           ├── HelloWorldAspNetCore.Views.dll
│           ├── HelloWorldAspNetCore.Views.pdb
│           └── Properties
│               └── launchSettings.json
├── Controllers
│   └── HomeController.cs
├── HelloWorldAspNetCore.csproj
├── Models
│   └── ErrorViewModel.cs
├── obj
│   ├── Debug
│   │   └── netcoreapp3.1
│   │       ├── HelloWorldAspNetCore
│   │       ├── HelloWorldAspNetCore.AssemblyInfo.cs
│   │       ├── HelloWorldAspNetCore.AssemblyInfoInputs.cache
│   │       ├── HelloWorldAspNetCore.assets.cache
│   │       ├── HelloWorldAspNetCore.csprojAssemblyReference.cache
│   │       ├── HelloWorldAspNetCore.csproj.CopyComplete
│   │       ├── HelloWorldAspNetCore.csproj.FileListAbsolute.txt
│   │       ├── HelloWorldAspNetCore.dll
│   │       ├── HelloWorldAspNetCore.MvcApplicationPartsAssemblyInfo.cache
│   │       ├── HelloWorldAspNetCore.pdb
│   │       ├── HelloWorldAspNetCore.RazorAssemblyInfo.cache
│   │       ├── HelloWorldAspNetCore.RazorAssemblyInfo.cs
│   │       ├── HelloWorldAspNetCore.RazorCoreGenerate.cache
│   │       ├── HelloWorldAspNetCore.RazorTargetAssemblyInfo.cache
│   │       ├── HelloWorldAspNetCore.RazorTargetAssemblyInfo.cs
│   │       ├── HelloWorldAspNetCore.TagHelpers.input.cache
│   │       ├── HelloWorldAspNetCore.TagHelpers.output.cache
│   │       ├── HelloWorldAspNetCore.Views.dll
│   │       ├── HelloWorldAspNetCore.Views.pdb
│   │       ├── project.razor.json
│   │       ├── Razor
│   │       │   └── Views
│   │       │       ├── Home
│   │       │       │   ├── Index.cshtml.g.cs
│   │       │       │   └── Privacy.cshtml.g.cs
│   │       │       ├── Shared
│   │       │       │   ├── Error.cshtml.g.cs
│   │       │       │   ├── _Layout.cshtml.g.cs
│   │       │       │   └── _ValidationScriptsPartial.cshtml.g.cs
│   │       │       ├── _ViewImports.cshtml.g.cs
│   │       │       └── _ViewStart.cshtml.g.cs
│   │       └── staticwebassets
│   │           ├── HelloWorldAspNetCore.StaticWebAssets.Manifest.cache
│   │           └── HelloWorldAspNetCore.StaticWebAssets.xml
│   ├── HelloWorldAspNetCore.csproj.nuget.cache
│   ├── HelloWorldAspNetCore.csproj.nuget.dgspec.json
│   ├── HelloWorldAspNetCore.csproj.nuget.g.props
│   ├── HelloWorldAspNetCore.csproj.nuget.g.targets
│   └── project.assets.json
├── Program.cs
├── Properties
│   └── launchSettings.json
├── README.md
├── Startup.cs
├── Views
│   ├── Home
│   │   ├── Index.cshtml
│   │   └── Privacy.cshtml
│   ├── Shared
│   │   ├── Error.cshtml
│   │   ├── _Layout.cshtml
│   │   └── _ValidationScriptsPartial.cshtml
│   ├── _ViewImports.cshtml
│   └── _ViewStart.cshtml
└── wwwroot
    ├── css
    │   └── site.css
    ├── favicon.ico
    ├── js
    │   └── site.js
    └── lib
        ├── bootstrap
        │   ├── dist
        │   │   ├── css
        │   │   │   ├── bootstrap.css
        │   │   │   ├── bootstrap.css.map
        │   │   │   ├── bootstrap-grid.css
        │   │   │   ├── bootstrap-grid.css.map
        │   │   │   ├── bootstrap-grid.min.css
        │   │   │   ├── bootstrap-grid.min.css.map
        │   │   │   ├── bootstrap.min.css
        │   │   │   ├── bootstrap.min.css.map
        │   │   │   ├── bootstrap-reboot.css
        │   │   │   ├── bootstrap-reboot.css.map
        │   │   │   ├── bootstrap-reboot.min.css
        │   │   │   └── bootstrap-reboot.min.css.map
        │   │   └── js
        │   │       ├── bootstrap.bundle.js
        │   │       ├── bootstrap.bundle.js.map
        │   │       ├── bootstrap.bundle.min.js
        │   │       ├── bootstrap.bundle.min.js.map
        │   │       ├── bootstrap.js
        │   │       ├── bootstrap.js.map
        │   │       ├── bootstrap.min.js
        │   │       └── bootstrap.min.js.map
        │   └── LICENSE
        ├── jquery
        │   ├── dist
        │   │   ├── jquery.js
        │   │   ├── jquery.min.js
        │   │   └── jquery.min.map
        │   └── LICENSE.txt
        ├── jquery-validation
        │   ├── dist
        │   │   ├── additional-methods.js
        │   │   ├── additional-methods.min.js
        │   │   ├── jquery.validate.js
        │   │   └── jquery.validate.min.js
        │   └── LICENSE.md
        └── jquery-validation-unobtrusive
            ├── jquery.validate.unobtrusive.js
            ├── jquery.validate.unobtrusive.min.js
            └── LICENSE.txt

32 directories, 102 files
```

```bash
dotnet run --urls=http://localhost:8080
...
info: Microsoft.Hosting.Lifetime[0]
      Now listening on: http://localhost:8080
info: Microsoft.Hosting.Lifetime[0]
      Application started. Press Ctrl+C to shut down.
```


`touch Dockerfile`

```bash
FROM mcr.microsoft.com/dotnet/core/sdk:3.1

WORKDIR /app
COPY *.csproj .
RUN dotnet restore

COPY . .

RUN dotnet publish -c Release -o out

ENV ASPNETCORE_URLS http://*:8080

CMD ["dotnet", "out/HelloWorldAspNetCore.dll"]
```

```bash
podman build -t [USERNAME]/hello-dotnet:v1 .
STEP 1: FROM mcr.microsoft.com/dotnet/core/sdk:3.1
Getting image source signatures
Copying blob 1af28a55c3f3 done  
Copying blob 8bc534dd6017 done  
Copying blob 03f1c9932170 done  
Copying blob 57df1a1f1ad8 done  
Copying blob 71e126169501 done  
Copying blob 1e9f61add744 done  
Copying blob 7b0d6e95dc2c done  
Copying config c4155a9104 done  
Writing manifest to image destination
Storing signatures
STEP 2: WORKDIR /app
--> 1bde764148a
STEP 3: COPY *.csproj .
--> 75cb4cf1a87
STEP 4: RUN dotnet restore
  Determining projects to restore...
  Restored /app/HelloWorldAspNetCore.csproj (in 126 ms).
--> 5de58ac0839
STEP 5: COPY . .
--> 62b5daa7e40
STEP 6: RUN dotnet publish -c Release -o out
Microsoft (R) Build Engine version 16.7.0+7fb82e5b2 for .NET
Copyright (C) Microsoft Corporation. All rights reserved.

  Determining projects to restore...
  All projects are up-to-date for restore.
  HelloWorldAspNetCore -> /app/bin/Release/netcoreapp3.1/HelloWorldAspNetCore.dll
  HelloWorldAspNetCore -> /app/bin/Release/netcoreapp3.1/HelloWorldAspNetCore.Views.dll
  HelloWorldAspNetCore -> /app/out/
--> ad1cc39b0e7
STEP 7: ENV ASPNETCORE_URLS http://*:8080
--> 26885b03f63
STEP 8: CMD ["dotnet", "out/HelloWorldAspNetCore.dll"]
STEP 9: COMMIT [USERNAME]/hello-dotnet:v1
```

```bash
podman images
REPOSITORY                              TAG     IMAGE ID      CREATED         SIZE
localhost/[USERNAME]/hello-dotnet       v1      5d029c9f3f3a  11 minutes ago  733 MB
[CONTAINERNAME].azurecr.io/hello-dotnet latest  5d029c9f3f3a  11 minutes ago  733 MB
mcr.microsoft.com/dotnet/core/sdk       3.1     c4155a9104a8  3 weeks ago     721 MB
```

```bash
podman run -p 8080:8080 localhost/[USERNAME]/hello-dotnet:v1
...
info: Microsoft.Hosting.Lifetime[0]
      Now listening on: http://[::]:8080
info: Microsoft.Hosting.Lifetime[0]
      Application started. Press Ctrl+C to shut down.
```

```bash
podman login [CONTAINERNAME].azurecr.io
podman tag [CONTAINER_ID] [CONTAINERNAME].azurecr.io/hello-dotnet:v1
podman push [CONTAINERNAME].azurecr.io/hello-dotnet:v1
```

# Create a Kubernetes/AKS cluster with Istio
`az aks get-versions --location "<location>" --query "orchestrators[].orchestratorVersion"`

`az group create --name [RESOURCE-GROUP] --location "<location>"`

`az aks create --resource-group [RESOURCE-GROUP] --name [CLUSTER-NAME] --node-count 2 --kubernetes-version [VERSION]--generate-ssh-`

`az acr create -n [CONTAINER-REGISTRY-NAME] -g [RESOURCE-GROUP] --sku basic`

`az aks get-credentials --resource-group [RESOURCE-GROUP] --name [CLUSTER-NAME] --attach-acr [CONTAINER-REGISTRY-NAME]`

(https://docs.microsoft.com/en-us/azure/aks/servicemesh-istio-install?pivots=client-operating-system-linux)
(https://istio.io/latest/docs/setup/platform-setup/azure/)

`curl -sL https://istio.io/downloadIstioctl | sh -`

`export PATH=$PATH:$HOME/.istioctl/bin`

`istioctl x precheck`

`istioctl operator init`

`kubectl get all -n istio-`operator`

`istioctl profile dump `default`

`touch istio.aks.yaml`

```bash
apiVersion: install.istio.io/v1alpha1
kind: IstioOperator
metadata:
  namespace: istio-system
  name: istio-control-plane
spec:
  # Use the default profile as the base
  # More details at: https://istio.io/docs/setup/additional-setup/config-profiles/
  profile: default
  # Enable the addons that we will want to use
  addonComponents:
    grafana:
      enabled: true
    prometheus:
      enabled: true
    tracing:
      enabled: true
    kiali:
      enabled: true
  values:
    global:
      # Ensure that the Istio pods are only scheduled to run on Linux nodes
      defaultNodeSelector:
        beta.kubernetes.io/os: linux
    kiali:
      dashboard:
        auth:
          strategy: anonymous
```

`kubectl create ns istio-system`

`kubectl apply -f istio.aks.yaml   `

`kubectl get all -n istio-system`

`istio label namespace default istio-injection=enabled`

`kubectl get namespace -L istio-injection`

`kubectl get svc -n istio-system`

`kubectl get pods -n istio-`system`

`touch aspnetcore.yaml`

```bash
kind: Service
apiVersion: v1
metadata:
    name: aspnetcore-service
    labels:
        app: aspnetcore
spec:
    ports:
    - port: 8080
      name: http
    selector:
        app: aspnetcore
---
apiVersion: apps/v1
kind: Deployment
metadata:
    name: aspnetcore-v1
spec:
    replicas: 
    selector:
        matchLabels:
            app: aspnetcore
    template:
        metadata:
            labels:
                app: aspnetcore
                version: v1
        spec:
            containers:
            - name: aspnetcore
              image: [CONTAINERNAME].azurecr.io/hello-dotnet:v1
              imagePullPolicy: IfNotPresent
              ports:
                - containerPort: 8080
```

`kubectl apply -f aspnetcore.yaml`

`az aks update -n aspnet-istio-aks -g aspnet-istio-rg-dev --attach-acr aspnetprojects`
(https://docs.microsoft.com/en-us/azure/aks/cluster-container-registry-integration?toc=/azure/container-registry/toc.json&bc=/azure/container-registry/breadcrumb/toc.json)

`kubectl get pods`

`touch aspnetcore-gateway.yaml`

```bash
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: aspnetcore-gateway
spec:
  selector:
    istio: ingressgateway # use istio default controller
  servers:
  - port:
      number: 80
      name: http
      protocol: HTTP
    hosts:
    - "*"
```

`touch aspnetcore-virtualservice.yaml`

```bash
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: aspnetcore-virtualservice
spec:
  hosts:
  - "*"
  gateways:
  - aspnetcore-gateway
  http:
  - route:
    - destination:
        host: aspnetcore-service
```

`kubectl apply -f aspnetcore-gateway.yaml`

`kubectl apply -f aspnetcore-virtualservice.yaml`

`kubectl get gateway`

`kubectl get virtualservice`

`kubectl get svc istio-ingressgateway -n istio-system`

`export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')`

`export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')`

`export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT`

`echo $GATEWAY_URL`

`curl -o /dev/null -s -w "%{http_code}\n" http://${GATEWAY_URL}/`