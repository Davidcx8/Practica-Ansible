# Práctica Ansible: Automatización de servidores Ubuntu con Docker

## Descripción
Este proyecto implementa la práctica de automatización con **Ansible** sobre **5 servidores Ubuntu** desplegados con **Docker Compose**.

Se cumple el mandato de:
- Crear imagen Ubuntu con SSH y usuario `ansible` con sudo sin contraseña.
- Levantar 5 servidores con Docker Compose.
- Configurar inventario y `ansible.cfg`.
- Ejecutar playbooks para automatizar tareas administrativas.

## Objetivo
Automatizar en los 5 servidores:
- Actualización de caché APT.
- Creación del usuario `itla`.
- Creación del directorio `/app`.
- Creación de `/app/hola.txt`.
- Instalación de `cowsay` y `htop`.

## Estructura del proyecto
- `Dockerfile`: imagen base Ubuntu 24.04 con SSH y usuario `ansible`.
- `docker-compose.yml`: definición de `server1` a `server5`.
- `inventario.ini`: inventario de Ansible con host, puerto, usuario y clave.
- `ansible.cfg`: configuración de Ansible.
- `playbook.yml`: playbook principal que importa todos los playbooks de tareas.
- `actualizar-cache.yml`: actualización de caché APT.
- `crear-usuario-itla.yml`: creación del usuario `itla`.
- `crear-carpeta-app.yml`: creación de `/app`.
- `crear-archivo-hola.yml`: creación de `/app/hola.txt`.
- `instalar-apps.yml`: instalación de `htop` y `cowsay`.

## Requisitos
- Docker y Docker Compose instalados.
- Ansible instalado.
- En Windows, usar WSL para ejecutar Ansible.

Instalación de referencia en WSL/Ubuntu:
```bash
wsl --install
sudo apt update
sudo apt install -y ansible
```

## Implementación

### 1. Construir la imagen Docker
```bash
docker build -t ubuntu24 .
```

### 2. Levantar los 5 servidores
```bash
docker compose up -d
```

Puertos publicados:
- `server1`: `2221 -> 22`
- `server2`: `2222 -> 22`
- `server3`: `2223 -> 22`
- `server4`: `2224 -> 22`
- `server5`: `2225 -> 22`

### 3. Verificar conectividad con Ansible
```bash
ansible all -m ping
```

### 4. Ejecutar automatización completa
```bash
ansible-playbook playbook.yml
```

## Resultado esperado
Al finalizar la ejecución del playbook principal:
- Los paquetes APT quedan actualizados.
- El usuario `itla` existe en todos los servidores.
- Existe la carpeta `/app`.
- Existe el archivo `/app/hola.txt` con el texto `Hola desde Ansible`.
- Quedan instaladas las aplicaciones `htop` y `cowsay`.

## Evidencias

### Evidencia 1
![Evidencia 1](./Screenshot%202026-03-07%20215453.png)

### Evidencia 2
![Evidencia 2](./Screenshot%202026-03-09%20131346.png)

### Evidencia 3
![Evidencia 3](./Screenshot%202026-03-09%20132716.png)

### Evidencia 4
![Evidencia 4](./Screenshot%202026-03-09%20133658.png)
