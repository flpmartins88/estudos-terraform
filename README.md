# Estudos terraform

Baixar o terraform no site: [terraform.io](http://terraform.io)

## Comandos básicos

Iniciar o terraform na pasta do projeto:

```bash
$ terraform init
output ...
```

Visualizar mudanças:

```bash
$ terraform plan
output ...
```

Aplicar mudanças

```bash
$ terraform apply
output ...
```

Remover

``` bash
$ terraform destroy [--resource resource_id]
output ...
```

Recarregar

```bash
$ terraform refresh
output ...
```

## Informações

O **Terraform Cloud** é um serviço que mantém o **state** do terraform na nuvem e versionado, o que permite que outras pessoas possam terraformar. Dar uma olhada em *remote* no *terraform cli*.
