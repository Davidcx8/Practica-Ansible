# Imagen base
FROM ubuntu:24.04

# Evita preguntas interactivas durante instalación
ENV DEBIAN_FRONTEND=noninteractive

# Instalar openssh-server y sudo
RUN apt-get update && \
    apt-get install -y openssh-server sudo && \
    mkdir /var/run/sshd

# Crear usuario ansible con password ansible
RUN useradd -m -s /bin/bash ansible && \
    echo "ansible:ansible" | chpasswd

# Dar permisos sudo sin contraseña
RUN usermod -aG sudo ansible && \
    echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Permitir login con password por SSH
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Exponer puerto SSH
EXPOSE 22

# Ejecutar SSH
CMD ["/usr/sbin/sshd", "-D"]