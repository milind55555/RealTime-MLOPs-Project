# 🚀 Churn Model MLOps Demo

An end-to-end **MLOps project for customer churn prediction**, demonstrating how machine learning models can be developed, versioned, containerized, deployed, and continuously delivered using modern DevOps and MLOps tools.

The project combines **Python, Scikit-learn, FastAPI, DVC, Amazon S3, Docker, Kubernetes, KServe, GitHub Actions, and Argo CD** to demonstrate a complete machine learning lifecycle.

---

## 👨‍💻 Author

**Milind Hanchate**

GitHub: [Milind Hanchate](https://github.com/milind55555)

---

## 📌 Project Overview

Customer churn prediction is the process of identifying customers who are likely to stop using a company's service.

For example, a telecom company may have thousands of customers. Some customers remain loyal for years, while others may leave because of:

- High monthly charges
- Frequent customer support calls
- Short customer tenure
- Poor customer experience

This project builds a machine learning model that predicts whether a customer is likely to churn.

### Example Customer

| Feature | Value |
|---|---:|
| Age | 45 |
| Tenure | 24 months |
| Monthly Charges | $79.99 |
| Total Charges | $1,920 |
| Support Calls | 3 |

Example prediction:

```json
{
  "churn": 1,
  "churn_probability": 0.73
}
Interpretation

The model predicts that the customer has approximately a 73% probability of churning.

A business could use this prediction to:

Offer personalized discounts
Provide additional customer support
Identify dissatisfied customers
Launch retention campaigns
Reduce customer acquisition costs
🏗️ Architecture

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
                         │ Kubernetes YAML     │
                         │ DVC Metadata        │
                         └──────────┬──────────┘
                                    │
                                    │ Trigger
                                    ▼
                    ┌──────────────────────────────┐
                    │       GitHub Actions          │
                    │                              │
                    │ 1. Generate Data             │
                    │ 2. Train Model               │
                    │ 3. DVC Push                  │
                    │ 4. Build Docker Image        │
                    │ 5. Push Image                │
                    │ 6. Update Deployment         │
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
                         │ GitOps          │
                         │ Continuous      │
                         │ Deployment      │
                         └────────┬────────┘
                                  │
                                  ▼
                    ┌─────────────────────────┐
                    │       Kubernetes        │
                    │                         │
                    │        KServe           │
                    │                         │
                    │  InferenceService       │
                    │  churn-predictor        │
                    └────────────┬────────────┘
                                 │
                                 ▼
                       ┌────────────────────┐
                       │   ML Prediction    │
                       │                    │
                       │  Churn / No Churn  │
                       │  Probability       │
                       └────────────────────┘
🔄 End-to-End MLOps Workflow
Developer
    │
    ▼
GitHub
    │
    ▼
GitHub Actions
    │
    ├── Generate Dataset
    │
    ├── Train Model
    │
    ├── Version Model with DVC
    │
    ├── Upload Model → Amazon S3
    │
    ├── Build Docker Image
    │
    ├── Push Image → Container Registry
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
⚡ FastAPI	Local model inference API
📦 DVC	Data and model versioning
☁️ Amazon S3	Model and artifact storage
🐳 Docker	Containerization
☸️ Kubernetes	Container orchestration
🚀 KServe	ML model serving
🔄 GitHub Actions	CI/CD automation
🔱 Argo CD	GitOps continuous delivery
🧪 KIND	Local Kubernetes development
🔐 AWS IAM	Cloud authentication and authorization
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
├── .gitignore
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

The training process:

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
churn_model.pkl

The trained model is saved as:

models/churn_model.pkl
📦 DVC - Data & Model Versioning

DVC is used to version machine learning artifacts while keeping large files outside Git.

Initialize DVC:

dvc init

Configure an S3 remote:

dvc remote add -d myremote s3://YOUR-BUCKET/churn-model

Track the model:

dvc add models/churn_model.pkl

Push the model to S3:

dvc push

Commit DVC metadata:

git add models/churn_model.pkl.dvc .dvc/ .gitignore
git commit -m "Track model with DVC"
Why DVC?

Git is excellent for source code, but machine learning projects frequently contain large datasets and model files.

DVC allows the project to separate:

Git
 └── Code + Configuration + DVC Metadata

Amazon S3
 └── Dataset + Model + Large Artifacts
☁️ Amazon S3

Amazon S3 is used as remote storage for machine learning artifacts.

Example:

s3://YOUR-BUCKET/
│
└── churn-model/
    │
    └── model/
        └── churn_model.pkl

Configure AWS credentials securely through your environment or CI/CD secrets.

Linux / Git Bash
export AWS_ACCESS_KEY_ID=your-key
export AWS_SECRET_ACCESS_KEY=your-secret
export AWS_DEFAULT_REGION=ap-south-1

Never commit real AWS credentials to GitHub.

🐳 Docker

The model API can be containerized using Docker.

Build the image:

docker build -t churn-model .

Run the container:

docker run -p 8000:8000 churn-model

The API can then be accessed at:

http://localhost:8000

Swagger documentation:

http://localhost:8000/docs
⚡ FastAPI Inference API

The project includes a FastAPI application for local inference.

Run:

python api.py

Open:

http://localhost:8000/docs

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

This project uses KServe v0.16.0 with Standard deployment mode.

The project originally experimented with KServe v0.11, but the current implementation uses KServe v0.16.0.

Install KServe CRDs:

helm install kserve-crd oci://ghcr.io/kserve/charts/kserve-crd \
  --version v0.16.0 \
  -n kserve \
  --create-namespace \
  --wait

Install KServe:

helm install kserve oci://ghcr.io/kserve/charts/kserve \
  --version v0.16.0 \
  -n kserve \
  --set kserve.controller.deploymentMode=RawDeployment \
  --wait

Verify:

kubectl get pods -n kserve
🔐 KServe S3 Authentication

The model is stored in Amazon S3 and KServe needs permission to download it.

The Kubernetes ServiceAccount used by the predictor is:

sa-s3-access

The model is configured using:

serviceAccountName: sa-s3-access

The S3 model location:

s3://churn-model-prediction-demo/model

The directory contains:

model/
└── churn_model.pkl
Security Warning

Never commit AWS credentials to GitHub.

Do NOT put:

AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY

directly inside a Git-tracked YAML file.

Use:

Kubernetes Secrets
AWS IAM roles
GitHub Actions Secrets
External Secrets
AWS-native identity mechanisms

depending on the deployment environment.

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

The project uses GitHub Actions to automate the ML pipeline.

Pipeline
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
   ├── Push Model using DVC
   │
   ├── Build Docker Image
   │
   ├── Push Image to Container Registry
   │
   └── Update Kubernetes Configuration

Example workflow:

Developer
    │
    │ git push
    ▼
GitHub Actions
    │
    ├── Test
    ├── Train
    ├── DVC Push
    ├── Docker Build
    └── Image Push
            │
            ▼
        Container Registry
🔐 GitHub Actions Secrets

The following values should be configured as GitHub Actions Secrets, not committed to the repository:

AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_DEFAULT_REGION

Depending on your deployment architecture, you may also configure:

AWS_ACCOUNT_ID
ECR_REPOSITORY
Never do this:
AWS_ACCESS_KEY_ID: AKIAxxxxxxxxxxxx
AWS_SECRET_ACCESS_KEY: xxxxxxxxxxxx

inside a Git-tracked file.

🔱 Argo CD GitOps

Argo CD is used to implement GitOps-based continuous deployment.

The desired Kubernetes state is stored in Git.

Git Repository
      │
      │ Desired State
      ▼
    Argo CD
      │
      │ Sync
      ▼
 Kubernetes Cluster
      │
      ▼
    KServe
      │
      ▼
 ML Inference

Install Argo CD:

kubectl create namespace argocd
kubectl apply \
  -n argocd \
  -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

Check:

kubectl get pods -n argocd

Deploy the Argo CD application:

kubectl apply -f argocd/application.yaml

Access the Argo CD UI:

kubectl port-forward svc/argocd-server \
  -n argocd \
  8080:443

Get the initial admin password:

kubectl -n argocd get secret \
  argocd-initial-admin-secret \
  -o jsonpath="{.data.password}" | base64 -d
🔁 Complete MLOps Lifecycle

The complete project workflow is:

                 ┌───────────────┐
                 │   Developer   │
                 └───────┬───────┘
                         │
                         ▼
                 ┌───────────────┐
                 │    GitHub     │
                 └───────┬───────┘
                         │
                         ▼
               ┌───────────────────┐
               │  GitHub Actions   │
               └─────────┬─────────┘
                         │
              ┌──────────┼───────────┐
              │          │           │
              ▼          ▼           ▼
          Training     DVC        Docker
              │          │           │
              │          ▼           ▼
              │         S3       Container Registry
              │          │           │
              └──────────┼───────────┘
                         │
                         ▼
                    ┌─────────┐
                    │ Argo CD │
                    └────┬────┘
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
📊 MLOps Components Explained
DVC

Used for:

Dataset versioning
Model versioning
Reproducibility
Remote artifact storage
Amazon S3

Used for:

Model storage
DVC remote storage
Large ML artifacts
Docker

Used for:

Packaging applications
Creating reproducible environments
Containerizing the inference API
Kubernetes

Used for:

Container orchestration
Service management
Deployment management
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
Automated training
Automated testing
Docker builds
Model publishing
Argo CD

Used for:

GitOps
Continuous deployment
Kubernetes synchronization
Declarative infrastructure management
🛡️ Security Best Practices

This project demonstrates a development environment, but production environments should follow stronger security practices.

Never commit:
AWS credentials
API keys
Passwords
Private keys
Tokens
Cloud credentials

Use:

GitHub Secrets
Kubernetes Secrets
AWS IAM
External Secrets
Secret Managers

Also consider:

Least-privilege IAM policies
Network policies
TLS
Container image scanning
Dependency scanning
RBAC
Audit logging
Secret rotation
🧪 Troubleshooting
Check KServe
kubectl get pods -n kserve
Check InferenceService
kubectl get isvc -n ml
Describe InferenceService
kubectl describe isvc churn-predictor -n ml
Check predictor Pods
kubectl get pods -n ml
Check Pod events
kubectl describe pod <POD_NAME> -n ml
Check KServe logs
kubectl logs \
  deployment/kserve-controller-manager \
  -n kserve \
  -c manager
Check Kubernetes events
kubectl get events \
  -n ml \
  --sort-by=.lastTimestamp
📈 Future Improvements

This project can be extended with:

Prometheus monitoring
Grafana dashboards
Model performance monitoring
Data drift detection
Model drift detection
Automated model retraining
MLflow experiment tracking
Feature stores
Automated testing
Security scanning
Kubernetes autoscaling
Canary deployments
A/B testing
Model explainability
Centralized logging
Production-grade AWS deployment
🎯 Learning Objectives

This project demonstrates practical understanding of:

Machine Learning
Data generation
Feature engineering
Model training
Model serialization
Model inference
MLOps
Data versioning
Model versioning
Reproducibility
Model serving
ML CI/CD
DevOps
Docker
Kubernetes
CI/CD
GitOps
Infrastructure automation
Cloud
Amazon S3
AWS IAM
Container registries
Cloud-based ML workflows
💡 Key MLOps Principles Demonstrated
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

"The model can be reproducibly trained, versioned, deployed, and served through an automated production-like workflow."

📜 License

This project is licensed under the MIT License.

See the LICENSE file for details.

⭐ If You Find This Project Useful

If this project helped you understand MLOps, Kubernetes, KServe, DVC, or GitOps:

⭐ Star the repository
🍴 Fork the repository
🐛 Open an issue
💡 Submit improvements
👨‍💻 Author

Milind Hanchate

MLOps | DevOps | Cloud | Kubernetes | Linux

GitHub:
https://github.com/milind55555
