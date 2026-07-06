
1. **Создание приватного и публичного ключа: PowerShell или командная строка (CMD)**
```bash
ssh-keygen -t ed25519
```

2. **Открываем файл по пути "C:\Users\UserName\.ssh\id_ed25519.pub" и копируем содержимое**

3. **Вставляем его в место настройки сервера сервиса предоставляющего услуги VPS хостинга или через команды в CMD, которые можно посмотреть на ресурсах по данному вопросу**
```bash
ssh-copy-id user@server_ip
```

```bash
cat ~/.ssh/id_ed25519.pub | ssh user@server_ip "mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys && chmod -R go= ~/.ssh && cat >> ~/.ssh/authorized_keys"
```

4. **Подключение к серверу в CMD:**
```bash
ssh -L 8000:localhost:8000 root@Server_Address
```

5. **Если уже по скрипту от гайдов на сервере стоит VLESS на голом ядре и имеются созданные функции то просмотреть их можно с помощью:**
```bash
cat help
```