# What
Docker images for vscode in a browser(aka code server) plus couple of miscellaneous docker images.

# Why
According to coder.com's recommendation, it's best to dedicate one docker image for one purpose. Here is the hierarchy.

```
  base       (absolutely essensial libraries and linux tools for all docker images)
   ^
   |
  laguages   (python and golang)
   ^
   |
  tools      (like the name says, tools for coding and deploying)
   ^
   |
  codeserver-base (installs code server and vscode plugins)
   ^
   |
  codeserver (user specific configuration)
```

