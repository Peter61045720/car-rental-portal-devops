terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "~> 3.0.0"
        }
    }
}

provider "docker" { }

resource "null_resource" "docker_compose" {
    triggers = {
        compose_hash = filesha1("../../docker-compose.yaml")
    }

    provisioner "local-exec" {
        command = "docker compose up -d"
        working_dir = "../../"
    }

    provisioner "local-exec" {
        when = destroy
        command = "docker compose down"
        working_dir = "../../"
    }
}

output "server_url" {
    value = "http://localhost:5000"
}

output "client_url" {
    value = "http://localhost:8100"
}