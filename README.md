# 🚀 Churn Model MLOps Project

An end-to-end **MLOps project for customer churn prediction**, demonstrating how a machine learning model can be developed, versioned, containerized, deployed, and continuously delivered using modern MLOps, DevOps, Cloud, and Kubernetes technologies.

The project combines **Python, Scikit-learn, FastAPI, DVC, Amazon S3, Docker, Kubernetes, KServe, GitHub Actions, and Argo CD** to demonstrate a complete machine learning lifecycle.

---

## 👨‍💻 Author

**Milind Hanchate**

**Role Focus:** MLOps | DevOps | Cloud | Kubernetes | Linux

GitHub: https://github.com/milind55555

---

# 📌 Project Overview

Customer churn prediction is the process of identifying customers who are likely to stop using a company's service.

For example, a telecom company may have thousands of customers. Some customers remain loyal for years, while others may leave because of:

- High monthly charges
- Frequent customer support calls
- Short customer tenure
- Poor customer experience

This project builds a **Scikit-learn machine learning model** that predicts whether a customer is likely to churn.

The project does not stop at model training. It demonstrates the complete process of taking an ML model from development to a production-like serving environment.

---

# 🎯 Project Objectives

The main objectives of this project are:

1. Generate a customer churn dataset.
2. Train a machine learning classification model.
3. Version the model using DVC.
4. Store ML artifacts in Amazon S3.
5. Build a FastAPI inference API.
6. Containerize the application using Docker.
7. Apply Docker security best practices.
8. Deploy the model on Kubernetes.
9. Serve the model using KServe.
10. Automate the workflow using GitHub Actions.
11. Implement GitOps using Argo CD.
12. Demonstrate a complete MLOps lifecycle.

---

# 🧠 Machine Learning Problem

The model predicts whether a customer is likely to churn.

The model uses the following features:

| Feature | Description |
|---|---|
| `age` | Customer age |
| `tenure_months` | Number of months the customer has been with the company |
| `monthly_charges` | Customer's monthly charges |
| `total_charges` | Total amount paid by the customer |
| `num_support_calls` | Number of customer support calls |

### Target Variable

```text
0 = Customer is not expected to churn
1 = Customer is expected to churn

👤 Example Customer

Consider the following customer:

Feature	Value
Age	45
Tenure	24 months
Monthly Charges	$79.99
Total Charges	$1,920
Support Calls	3

Example prediction:

{
  "churn": 1,
  "churn_probability": 0.73
}
Interpretation

The model predicts that this customer has approximately a 73% probability of churning.

A business could use this prediction to:

Offer a personalized discount
Provide additional customer support
Identify dissatisfied customers
Launch customer retention campaigns
Proactively contact high-risk customers
🏗️ System Architecture

The project follows an end-to-end MLOps architecture:

                         ┌─────────────────────┐
                         │      Developer      │
                         │                     │
                         │  Python / ML Code   │
                         └──────────┬──────────┘
                                    │
                                    │ git push
                                    ▼
                         ┌─────────────────────┐
                         │       GitHub        │
                         │                     │
                         │ Source Code         │
                         │ DVC Metadata        │
                         │ Kubernetes YAML     │
                         └──────────┬──────────┘
                                    │
                                    │ Trigger
                                    ▼
                    ┌──────────────────────────────┐
                    │       GitHub Actions         │
                    │                              │
                    │ 1. Generate Dataset          │
                    │ 2. Train Model               │
                    │ 3. Validate Model            │
                    │ 4. DVC Push                  │
                    │ 5. Build Docker Image        │
                    │ 6. Security Scan             │
                    │ 7. Push Image                │
                    │ 8. Update Deployment         │
                    └──────────────┬───────────────┘
                                   │
                  ┌────────────────┴────────────────┐
                  │                                 │
                  ▼                                 ▼
        ┌──────────────────┐              ┌──────────────────┐
        │   Amazon S3      │              │ Container        │
        │                  │              │ Registry / ECR   │
        │ Dataset          │              │                  │
        │ ML Model         │              │ Docker Image     │
        │ DVC Artifacts    │              │                  │
        └────────┬─────────┘              └─────────┬────────┘
                 │                                  │
                 │                                  │
                 └────────────────┬─────────────────┘
                                  │
                                  ▼
                         ┌─────────────────┐
                         │     Argo CD     │
                         │                 │
                         │     GitOps      │
                         │   Deployment    │
                         └────────┬────────┘
                                  │
                                  ▼
                         ┌─────────────────┐
                         │   Kubernetes    │
                         │                 │
                         │     KServe      │
                         │                 │
                         │ InferenceService│
                         └────────┬────────┘
                                  │
                                  ▼
                         ┌─────────────────┐
                         │  ML Prediction  │
                         │                 │
                         │ Churn / No Churn│
                         │  Probability    │
                         └─────────────────┘
🔄 End-to-End MLOps Workflow
Developer
    │
    │ git push
    ▼
GitHub Repository
    │
    ▼
GitHub Actions
    │
    ├── Generate Dataset
    │
    ├── Train Model
    │
    ├── Evaluate Model
    │
    ├── Version Model with DVC
    │
    ├── Push Model to Amazon S3
    │
    ├── Build Docker Image
    │
    ├── Scan Docker Image
    │
    ├── Push Image to Container Registry
    │
    └── Update Kubernetes Configuration
                    │
                    ▼
                 Argo CD
                    │
                    ▼
              Kubernetes
                    │
                    ▼
                 KServe
                    │
                    ▼
             Model Inference
🧰 Technology Stack
Technology	Purpose
🐍 Python	Machine learning and application development
🤖 Scikit-learn	Churn prediction model
⚡ FastAPI	Model inference API
📦 DVC	Data and model versioning
☁️ Amazon S3	ML model and artifact storage
🐳 Docker	Application containerization
☸️ Kubernetes	Container orchestration
🚀 KServe	Kubernetes-native ML model serving
🔄 GitHub Actions	CI/CD automation
🔱 Argo CD	GitOps continuous deployment
🧪 KIND	Local Kubernetes development
🔐 AWS IAM	Authentication and authorization
📁 Project Structure
churn-prediction-model/
│
├── generate_data.py
│   └── Generate synthetic customer churn dataset
│
├── train.py
│   └── Train the churn prediction model
│
├── api.py
│   └── FastAPI inference server
│
├── requirements.txt
│   └── Python dependencies
│
├── Dockerfile
│   └── Docker image configuration
│
├── .dockerignore
│   └── Files excluded from Docker build context
│
├── .gitignore
│   └── Files excluded from Git
│
├── data/
│   └── Dataset files
│
├── models/
│   └── churn_model.pkl.dvc
│       └── DVC metadata for model versioning
│
├── k8s/
│   ├── deployment.yaml
│   ├── inference.yaml
│   └── serviceaccount.yaml
│
├── .github/
│   └── workflows/
│       └── mlops-pipeline.yaml
│
├── argocd/
│   └── application.yaml
│
├── .dvc/
│   └── DVC configuration
│
├── LICENSE
│
└── README.md
🧠 Machine Learning Pipeline
1. Generate Dataset

The project uses a synthetic customer churn dataset.

Run:

python generate_data.py

The generated dataset contains customer-related features such as:

Age
Tenure
Monthly charges
Total charges
Number of support calls
Churn label
2. Train the Model

Run:

python train.py

The training workflow is:

Dataset
   │
   ▼
Data Preprocessing
   │
   ▼
Feature Selection
   │
   ▼
Model Training
   │
   ▼
Model Evaluation
   │
   ▼
Model Serialization
   │
   ▼
churn_model.pkl

The trained model is stored as:

models/churn_model.pkl
📦 DVC - Data and Model Versioning

DVC is used to version machine learning artifacts while keeping large files outside Git.

Initialize DVC
dvc init
Configure S3 Remote
dvc remote add -d myremote s3://YOUR-BUCKET/churn-model
Track the Model
dvc add models/churn_model.pkl
Push Model to S3
dvc push
Commit DVC Metadata
git add models/churn_model.pkl.dvc .dvc/ .gitignore
git commit -m "Track model with DVC"
🤔 Why DVC?

Git is excellent for source code, but machine learning projects frequently contain large:

Datasets
Model files
Training artifacts

DVC separates source code from large ML artifacts.

Git
 │
 ├── Source Code
 ├── Configuration
 └── DVC Metadata
Amazon S3
 │
 ├── Dataset
 ├── Model
 └── Large ML Artifacts

This improves:

Reproducibility
Model versioning
Data versioning
Collaboration
Experiment tracking
☁️ Amazon S3

Amazon S3 is used as remote storage for machine learning artifacts.

Example:

s3://YOUR-BUCKET/
│
└── churn-model/
    │
    ├── data/
    │
    └── model/
        └── churn_model.pkl

The actual S3 location used by the KServe deployment is:

s3://churn-model-prediction-demo/model
🔐 AWS Credentials and Security

AWS credentials must never be committed to GitHub.

Never put real credentials inside:

Dockerfile
README.md
inference.yaml
serviceaccount.yaml
Python source code
.env files committed to Git
GitHub workflow files

Do not commit:

AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY

Use secure mechanisms such as:

GitHub Actions Secrets
Kubernetes Secrets
AWS IAM Roles
External Secrets
AWS-native identity mechanisms

For production AWS environments, prefer IAM roles and short-lived credentials instead of long-lived access keys.

⚡ FastAPI Inference API

The project includes a FastAPI application for local model inference.

Start the API:

python api.py

The API will be available at:

http://localhost:8000

Swagger documentation:

http://localhost:8000/docs
🧪 Test FastAPI

Example request:

curl -X POST http://localhost:8000/predict \
  -H "Content-Type: application/json" \
  -d '{
    "age": 45,
    "tenure_months": 24,
    "monthly_charges": 79.99,
    "total_charges": 1920.00,
    "num_support_calls": 3
  }'

Example response:

{
  "churn": 1,
  "churn_probability": 0.73
}
🐳 Docker Containerization

The FastAPI inference application can be packaged into a Docker image.

Build Image
docker build -t churn-model:latest .
Run Container
docker run -p 8000:8000 churn-model:latest

Access:

http://localhost:8000/docs
🔒 Docker Security

The Docker image follows container security best practices.

Multi-stage Build

The Dockerfile uses a multi-stage build:

Builder Stage
     │
     ├── Install dependencies
     │
     ▼
Production Stage
     │
     ├── Copy required dependencies
     ├── Copy application
     ├── Copy model
     └── Run application

This helps keep unnecessary build dependencies out of the final image.

👤 Non-root Container

The application runs using a dedicated non-root user instead of root.

Example:

USER appuser

Verify:

docker run --rm churn-model:latest whoami

Expected:

appuser

Running containers as non-root reduces the impact of a potential container compromise.

🛡️ Container Security Practices

The project follows or recommends:

Multi-stage Docker builds
Non-root user
Minimal base image
.dockerignore
Pinned dependencies
No secrets inside images
Vulnerability scanning
Read-only filesystem where supported
Dropped Linux capabilities
Disabled privilege escalation
Container health checks

Example secure runtime:

docker run \
  --read-only \
  --cap-drop=ALL \
  --security-opt=no-new-privileges:true \
  --tmpfs /tmp \
  -p 8000:8000 \
  churn-model:latest
🔍 Docker Image Scanning

The container image can be scanned for known vulnerabilities using Trivy.

Install Trivy and run:

trivy image churn-model:latest

Alternatively, Docker Scout can be used:

docker scout cves churn-model:latest

Container scanning can also be integrated into GitHub Actions.

☸️ Kubernetes with KIND

KIND provides a lightweight local Kubernetes cluster for development and testing.

Create the cluster:

kind create cluster --name churn-model

Verify:

kubectl get nodes

Expected:

NAME                         STATUS   ROLES
churn-model-control-plane   Ready    control-plane

Create the ML namespace:

kubectl create namespace ml
🚀 KServe

KServe is used to deploy and serve the machine learning model on Kubernetes.

The current implementation uses:

KServe v0.16.0

with:

Standard / RawDeployment mode

Standard deployment mode is used so the deployment does not depend on Knative.

🛠️ Install KServe
Install KServe CRDs
helm install kserve-crd \
  oci://ghcr.io/kserve/charts/kserve-crd \
  --version v0.16.0 \
  -n kserve \
  --create-namespace \
  --wait
Install KServe
helm install kserve \
  oci://ghcr.io/kserve/charts/kserve \
  --version v0.16.0 \
  -n kserve \
  --set kserve.controller.deploymentMode=RawDeployment \
  --wait

Verify:

kubectl get pods -n kserve
🔐 KServe S3 Authentication

The model is stored in Amazon S3.

KServe requires permission to download the model.

The predictor uses:

ServiceAccount:
sa-s3-access

The InferenceService references this ServiceAccount:

serviceAccountName: sa-s3-access

The model location is:

s3://churn-model-prediction-demo/model

The model directory contains:

model/
└── churn_model.pkl
🤖 KServe InferenceService

Example inference.yaml:

apiVersion: serving.kserve.io/v1beta1
kind: InferenceService

metadata:
  name: churn-predictor
  namespace: ml
  annotations:
    serving.kserve.io/deploymentMode: "Standard"

spec:
  predictor:
    serviceAccountName: sa-s3-access

    model:
      modelFormat:
        name: sklearn

      runtime: kserve-sklearnserver

      storageUri: s3://churn-model-prediction-demo/model

Deploy:

kubectl apply -f k8s/inference.yaml

Check:

kubectl get isvc -n ml

Watch the predictor:

kubectl get pods -n ml -w
🔍 Verify Model Deployment

Check the InferenceService:

kubectl get inferenceservice -n ml

Detailed information:

kubectl describe inferenceservice churn-predictor -n ml

Check Pods:

kubectl get pods -n ml

Check Services:

kubectl get svc -n ml
🧪 Test KServe Inference

For a local KIND cluster, port-forward the predictor service:

kubectl port-forward \
  -n ml \
  service/churn-predictor-predictor \
  8080:80

Then send a prediction request:

curl -X POST \
  http://localhost:8080/v1/models/churn-predictor:predict \
  -H "Content-Type: application/json" \
  -d '{
    "instances": [
      [45, 24, 79.99, 1920.00, 3]
    ]
  }'

Expected response:

{
  "predictions": [1]
}
🔄 GitHub Actions CI/CD

GitHub Actions is used to automate the MLOps pipeline.

The CI/CD workflow is:

Git Push
    │
    ▼
GitHub Actions
    │
    ├── Checkout Repository
    │
    ├── Install Dependencies
    │
    ├── Generate Dataset
    │
    ├── Train Model
    │
    ├── Evaluate Model
    │
    ├── DVC Push
    │
    ├── Build Docker Image
    │
    ├── Security Scan
    │
    ├── Push Image
    │
    └── Update Kubernetes Configuration
🔐 GitHub Actions Secrets

Sensitive values should be configured as GitHub repository secrets.

Examples:

AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_DEFAULT_REGION

Depending on the deployment architecture, additional values may include:

AWS_ACCOUNT_ID
ECR_REPOSITORY

Never hardcode credentials inside a workflow file.

🛡️ CI/CD Security

The CI/CD pipeline can include:

Secret scanning
Dependency scanning
Unit tests
Model validation
Docker vulnerability scanning
Least-privilege GitHub Actions permissions
Protected branches
Environment protection
Artifact verification
🔱 Argo CD GitOps

Argo CD is used to implement GitOps-based continuous deployment.

The desired Kubernetes state is stored in Git.

Git Repository
      │
      │ Desired State
      ▼
    Argo CD
      │
      │ Synchronization
      ▼
Kubernetes Cluster
      │
      ▼
    KServe
      │
      ▼
ML Inference
📦 Install Argo CD

Create namespace:

kubectl create namespace argocd

Install Argo CD:

kubectl apply \
  -n argocd \
  -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

Check:

kubectl get pods -n argocd
🚀 Deploy Argo CD Application

Apply:

kubectl apply -f argocd/application.yaml

Check:

kubectl get applications -n argocd
🌐 Access Argo CD

Port-forward:

kubectl port-forward \
  svc/argocd-server \
  -n argocd \
  8080:443

Get the initial admin password:

kubectl -n argocd get secret \
  argocd-initial-admin-secret \
  -o jsonpath="{.data.password}" | base64 -d
🔁 Complete MLOps Lifecycle
                         ┌───────────────┐
                         │   Developer   │
                         └───────┬───────┘
                                 │
                                 │ git push
                                 ▼
                         ┌───────────────┐
                         │    GitHub     │
                         └───────┬───────┘
                                 │
                                 ▼
                    ┌────────────────────────┐
                    │    GitHub Actions      │
                    │                        │
                    │ Generate Data           │
                    │ Train Model             │
                    │ Test Model              │
                    │ DVC Push                │
                    │ Docker Build             │
                    │ Security Scan            │
                    │ Push Image               │
                    └────────────┬───────────┘
                                 │
                  ┌──────────────┴──────────────┐
                  │                             │
                  ▼                             ▼
            ┌───────────┐                ┌───────────────┐
            │ Amazon S3 │                │ Container     │
            │           │                │ Registry      │
            │ ML Model  │                │ Docker Image  │
            │ Artifacts │                │               │
            └─────┬─────┘                └───────┬───────┘
                  │                              │
                  └──────────────┬───────────────┘
                                 │
                                 ▼
                          ┌─────────────┐
                          │   Argo CD   │
                          └──────┬──────┘
                                 │
                                 ▼
                         ┌─────────────┐
                         │ Kubernetes  │
                         └──────┬──────┘
                                │
                                ▼
                           ┌─────────┐
                           │ KServe  │
                           └────┬────┘
                                │
                                ▼
                         Model Prediction
🧩 MLOps Components Explained
DVC

Used for:

Dataset versioning
Model versioning
Reproducibility
Remote artifact storage
Amazon S3

Used for:

ML model storage
DVC remote storage
Large ML artifacts
Docker

Used for:

Packaging the inference application
Creating reproducible environments
Containerizing the ML API
Kubernetes

Used for:

Container orchestration
Service management
Deployment management
Resource management
Scaling
KServe

Used for:

Machine learning model serving
Inference APIs
Model lifecycle management
Kubernetes-native ML deployment
GitHub Actions

Used for:

CI/CD
Automated testing
Model training
DVC operations
Docker builds
Container publishing
Argo CD

Used for:

GitOps
Continuous deployment
Kubernetes synchronization
Declarative deployment management
🛡️ Security Best Practices

Security is an important part of the project.

Never Commit

Never commit:

AWS credentials
API keys
Passwords
Private keys
Tokens
Cloud credentials
.env files containing secrets

Use:

GitHub Secrets
Kubernetes Secrets
AWS IAM Roles
External Secrets
Secret Managers
🔐 Kubernetes Security

Recommended Kubernetes security controls include:

securityContext:
  runAsNonRoot: true
  runAsUser: 10001
  runAsGroup: 10001
  fsGroup: 10001
  seccompProfile:
    type: RuntimeDefault

Container-level security:

securityContext:
  allowPrivilegeEscalation: false
  readOnlyRootFilesystem: true
  capabilities:
    drop:
      - ALL

These controls help implement the principle of least privilege.

🔐 AWS Security

Recommended AWS security practices:

Least-privilege IAM policies
IAM roles instead of long-lived access keys
Credential rotation
Restricted S3 permissions
S3 encryption
CloudTrail logging
Secure bucket policies
🐳 Docker Security

Recommended Docker security practices:

Multi-stage builds
Minimal base images
Non-root user
No secrets inside images
.dockerignore
Dependency pinning
Image vulnerability scanning
Read-only filesystem
Dropped Linux capabilities
No privilege escalation
📊 Monitoring and Observability

A production implementation can include monitoring for both infrastructure and machine learning.

Recommended stack:

Kubernetes
    │
    ├── Prometheus
    │
    ├── Grafana
    │
    ├── Application Logs
    │
    └── KServe Metrics

Useful infrastructure metrics include:

CPU usage
Memory usage
Pod restarts
Request count
Request latency
Error rate
Network traffic

Machine learning monitoring can include:

Prediction distribution
Model accuracy
Data drift
Model drift
Inference latency
🧪 Testing Strategy

The project can be extended with multiple testing layers.

Unit Testing

Test individual Python functions.

pytest
API Testing

Test FastAPI endpoints and request validation.

Model Testing

Validate:

Model loading
Input format
Prediction output
Prediction probability
Model serialization
Container Testing

Validate:

Image starts successfully
API responds correctly
Container runs as non-root
Kubernetes Testing

Validate:

Kubernetes manifests
Pods
Services
ServiceAccounts
InferenceService
KServe runtime
🚨 Troubleshooting
Check KServe Pods
kubectl get pods -n kserve
Check InferenceService
kubectl get isvc -n ml
Describe InferenceService
kubectl describe isvc churn-predictor -n ml
Check Predictor Pods
kubectl get pods -n ml
Check Pod Events
kubectl describe pod <POD_NAME> -n ml
Check Kubernetes Events
kubectl get events \
  -n ml \
  --sort-by=.lastTimestamp
Check KServe Controller Logs
kubectl logs \
  deployment/kserve-controller-manager \
  -n kserve \
  -c manager
Check Services
kubectl get svc -n ml
🔮 Future Improvements

The project can be extended with:

MLflow experiment tracking
Prometheus monitoring
Grafana dashboards
Model performance monitoring
Data drift detection
Model drift detection
Automated model retraining
Feature stores
Model registry
HPA autoscaling
NetworkPolicies
Kubernetes RBAC hardening
OPA/Gatekeeper
Kyverno
Trivy CI/CD scanning
SBOM generation
Container image signing
Centralized logging
OpenTelemetry
Canary deployments
A/B testing
Model explainability
Production deployment on AWS EKS
🎯 Learning Objectives

This project demonstrates practical understanding of:

Machine Learning
Data generation
Feature preparation
Model training
Model evaluation
Model serialization
Model inference
MLOps
Data versioning
Model versioning
Reproducibility
Model serving
ML CI/CD
Automated deployment
DevOps
Git
GitHub
Docker
CI/CD
Kubernetes
GitOps
Infrastructure automation
Cloud
Amazon S3
AWS IAM
Container registries
Cloud-based ML workflows
💡 Key MLOps Principles

The project demonstrates the following MLOps principles:

Reproducibility
       ↓
Version Control
       ↓
Automation
       ↓
Continuous Integration
       ↓
Continuous Delivery
       ↓
Monitoring
       ↓
Continuous Improvement

The goal is to move from:

"The model works on my laptop."

to:

"The model can be reproducibly trained, versioned, containerized, deployed, served, and continuously delivered."
