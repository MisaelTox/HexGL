## 🌐 Live Demo
The game is live and hosted on AWS S3:
[Check out HexGL on AWS](http://misael-hexgl-portfolio-2026.s3-website.eu-north-1.amazonaws.com)

# HexGL - Cloud Deployment Edition 🏎️💨

## 📸 Preview
![HexGL running on AWS S3](./screenshots/deployment-hero.png)

*Deployment URL:* [Visit the game](http://misael-hexgl-portfolio-2026.s3-website.eu-north-1.amazonaws.com)

## 🛠 Deployment Journey (Lessons Learned)

### 1. Terraform Dependency Management
I encountered a race condition where the S3 Bucket Policy was being applied before the Public Access Block was fully removed. 
**Solution:** Implemented `depends_on` to enforce a strict resource creation order.

### 2. Multi-Account AWS CLI Management
Faced `AuthorizationHeaderMalformed` errors due to legacy SSO sessions. 
**Solution:** Successfully bypassed credential corruption by utilizing temporary environment variables and explicitly defining regional endpoints for the `eu-north-1` region.

### 3. Static Web Hosting
Configured S3 for high-availability static hosting, ensuring `index.html` is correctly routed as the entry point.


HexGL
=========

Source code of [HexGL](http://hexgl.bkcore.com), the futuristic HTML5 racing game by [Thibaut Despoulain](http://bkcore.com)

## Branches
  * **[Master](https://github.com/BKcore/HexGL)** - Public release (stable).

## License

Unless specified in the file, HexGL's code and resources are now licensed under the *MIT License*.

## Installation

	cd ~/
	git clone git://github.com/BKcore/HexGL.git
	cd HexGL
	python -m SimpleHTTPServer
	chromium index.html

To use full size textures, swap the two textures/ and textures.full/ directories.

## Note

The development of HexGL is in a hiatus for now until I find some time and interest to work on it again.
That said, feel free to post issues, patches, or anything to make the game better and I'll gladly review and merge them.
