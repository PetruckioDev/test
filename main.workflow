workflow "Deploy Nginx" {
  on = "push"  # Defina o evento que irá acionar o fluxo de trabalho, como um push para o repositório
  resolves = ["Deploy Nginx 1", "Deploy Nginx 2"]  # Nomes das etapas que serão resolvidas na ordem especificada
}

action "Deploy Nginx 1" {
  uses = "docker://nginx:latest"  # Imagem Docker a ser usada
  args = ["-d", "--name", "Nginx_test", "-p", "3080:80"]  # Argumentos do comando Docker para criar o contêiner
}

action "Deploy Nginx 2" {
  uses = "docker://nginx:latest"  # Imagem Docker a ser usada
  args = ["-d", "--name", "Nginx_test_2", "-p", "3180:80"]  # Argumentos do comando Docker para criar o contêiner
}
