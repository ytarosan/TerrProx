terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"  
      version = "3.0.2-rc03"       
    }
  }
}
provider "proxmox" {
  pm_api_url = var.proxmox_api_url
  pm_api_token_id = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_tls_insecure = true
}
resource "proxmox_lxc" "test_container" {
  vmid        = 230
  hostname    = "test-lxc"
  target_node = "thor"  # Укажите ваш узел Proxmox
  
  # Используйте существующий шаблон
  ostemplate = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  
  # Ресурсы
  cores  = 1
  memory = 512
  swap   = 512
  
  # Сеть
  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
  
  # Диск
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }
  
  # Настройки пользователя и пароля
  password = "hamster1"  # Пароль для root
  
  # Дополнительные настройки
  unprivileged = false  # Для root-доступа лучше отключить unprivileged
  start        = true
}
resource "proxmox_lxc" "test_container_2" {
  vmid        = 231
  hostname    = "test-lxc2"
  target_node = "thor"  # Укажите ваш узел Proxmox
  
  # Используйте существующий шаблон
  ostemplate = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  
  # Ресурсы
  cores  = 1
  memory = 512
  swap   = 512
  
  # Сеть
  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
  
  # Диск
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }
  
  # Настройки пользователя и пароля
  password = "hamster1"  # Пароль для root
  
  # Дополнительные настройки
  unprivileged = false  # Для root-доступа лучше отключить unprivileged
  start        = true
}