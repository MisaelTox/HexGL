# Definimos el proveedor
provider "aws" {
  region = "eu-north-1" # Puedes cambiarla por la que prefieras
}

# Creamos el bucket de S3
resource "aws_s3_bucket" "game_hosting" {
  bucket = "misael-hexgl-portfolio-2026" # DEBE SER ÚNICO EN TODO EL MUNDO
}

# Configuramos el bucket para que funcione como un sitio web
resource "aws_s3_bucket_website_configuration" "hosting_config" {
  bucket = aws_s3_bucket.game_hosting.id

  index_document {
    suffix = "index.html"
  }
}

# Permitimos que el bucket sea público (necesario para hosting web)
resource "aws_s3_bucket_public_access_block" "public_block" {
  bucket = aws_s3_bucket.game_hosting.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "allow_public_read" {
  bucket = aws_s3_bucket.game_hosting.id

  # ESTA ES LA CLAVE:
  depends_on = [aws_s3_bucket_public_access_block.public_block]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.game_hosting.arn}/*"
      },
    ]
  })
}