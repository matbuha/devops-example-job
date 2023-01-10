# devops-example-job
a simple DevOps job including bunch of tools

1. Create new GitHub project
2. Push any code from any language that you want (it can be hello world)
3. Write multistage DockerFile (reduce docker image size)
4. Write helm chart for this service
5. Create ci pipeline (with any system that you preferred)
  a. main branch:
    i. Manage versioning — bump version for each commit
    ii. Build and push the docker to any registry (Docker hub, ecr etc.)
    iii. Update helm chart with the new docker
  b. PR (both are optional):
    i. Build temporary docker and scan it with Trivy
    ii. Scan your helm with datree/Polaris
6. Install Argo-cd on k3s/minikube/microk8s/kind/eks etc.
7. Setup helm repo within Argo-CD
8. Push new commit and verify your Cl-CD
9. Install the following application with ApplicationSet : Polaris dashboard , goldilocks

Bonus: Be creative and share/implement something cool that you familiar with it