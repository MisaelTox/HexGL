# HexGL: Cloud Deployment Edition 🏎️💨

![CI/CD](https://github.com/MisaelTox/HexGL/actions/workflows/ci-cd.yml/badge.svg?branch=master)
![AWS](https://img.shields.io/badge/AWS-S3%20Static%20Hosting-orange?logo=amazon-aws)
![Terraform](https://img.shields.io/badge/IaC-Terraform-purple?logo=terraform)
![Docker](https://img.shields.io/badge/Container-Docker-blue?logo=docker)

Professional cloud deployment of [HexGL](http://hexgl.bkcore.com), a futuristic WebGL racing game, showcasing IaC, containerization, and automated CI/CD on AWS.

**🎮 [Play the game live on AWS S3](http://misael-hexgl-portfolio-2026.s3-website.eu-north-1.amazonaws.com)**

---

## 📸 Preview

![Game Preview](./screenshots/gameplay.png)

---

## 🏗️ Architecture

| Component | Technology |
|-----------|-----------|
| Hosting | AWS S3 Static Website |
| IaC | Terraform |
| Containerization | Docker + Nginx |
| CI/CD | GitHub Actions |
| Region | eu-north-1 |

---

## 🔄 CI/CD Pipeline

Every push to `master` automatically validates the infrastructure and syncs the game to S3:
```
Push to master
      ↓
✅ terraform fmt     → format validation
✅ terraform validate → syntax check
✅ terraform plan    → AWS impact preview
      ↓
⏸️  Manual approval gate (production environment)
      ↓
🚀 terraform apply   → provision infrastructure
🚀 aws s3 sync       → deploy game files to S3
```

AWS credentials stored as **GitHub Secrets** — never hardcoded.

---

## 🚀 Local Development (Docker)
```bash
docker build -t hexgl-game .
docker run -d -p 8080:80 hexgl-game
# Access at http://localhost:8080
```

## ☁️ Cloud Deployment (Terraform)
```bash
cd terraform
terraform init
terraform apply
```

---

## 📝 Lessons Learned

- **CI/CD with GitHub Actions** — automated Terraform validation + S3 sync pipeline with manual approval gate for production
- **Terraform race conditions** — resolved 403 errors caused by S3 Bucket Policy applying before PublicAccessBlock finished updating, fixed with explicit `depends_on`
- **AWS CLI authentication** — debugged credential precedence issues with legacy SSO sessions, resolved using temporary environment variables for `eu-north-1`
- **S3 static hosting** — configured index document routing for correct WebGL asset delivery

---

*Fork of [BKcore/HexGL](https://github.com/BKcore/HexGL) by Thibaut Despoulain. Cloud infrastructure and CI/CD pipeline added by MisaelTox.*