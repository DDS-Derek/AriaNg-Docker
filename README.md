# AriaNg-Docker

## 介绍

AriaNg 是一个让 aria2 更容易使用的现代 Web 前端. AriaNg 使用纯 html & javascript 开发, 所以其不需要任何编译器或运行环境. 您只要将 AriaNg 放在您的 Web 服务器里并在浏览器中打开即可使用. AriaNg 使用响应式布局, 支持各种计算机或移动设备.

## 部署方法
**docker**
```
docker run -d \
    --name ariang \
    --log-opt max-size=1m \
    --restart unless-stopped \
    -p 6880:6880 \
    ddsderek/ariang
```
**docker-compose**
```
version: '3.3'
services:
    ariang:
        container_name: ariang
        logging:
            options:
                max-size: 1m
        restart: unless-stopped
        ports:
            - '6880:6880'
        image: ddsderek/ariang
```
