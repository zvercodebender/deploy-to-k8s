# deploy-to-k8s
This Repo has the sample code to demonstrate how to create an automated release and deployment pipeline to deploy applications to a Kubernetes cluster in the cloud using Digital.ai Deploy and Release.

Here's the [link to the step-by-step documentation](https://docs.xebialabs.com/v.10.2/digital.ai-by-example/kubernetes/release-and-deploy-to-aws-eks/).

How to run this workflow:

1. Fork this repo to your personal git hub repo
2. Enable workflow in Git hub action
3. Clone repo to your local machine
4. Fill details in aws/release and aws/deploy secrete.xlvals and valules.xlvals
5. Use xl-cli to apply dairelease.yaml and daideploy.yaml
6. Make sure infra is created properly on both release and deploy server
7. On git hub add below secret
    ![image](https://user-images.githubusercontent.com/37649735/127658296-2b670f84-cb68-43fc-b236-dd139abc5213.png)
7. Create a webhook and select Pull request event, do not add any secret to webhook
![image](https://user-images.githubusercontent.com/37649735/127658463-0c8c4a71-be28-4ccf-981d-1eb479249b69.png)
8. Create a Pull request and merge it to master and see application is deployed to aws EKS cluster using DAI Release/Deploy Pipeline.

# References:
1. https://docs.aws.amazon.com/eks/latest/userguide/create-cluster.html
2. https://aws.amazon.com/blogs/opensource/network-load-balancer-nginx-ingress-controller-eks/
3. https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html
4. https://docs.aws.amazon.com/emr/latest/EMR-on-EKS-DevelopmentGuide/setting-up-eksctl.html
5. https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
6. https://docs.xebialabs.com/v.10.2/release/how-to/install-the-xl-cli#manage-the-xl-cli-config-file
