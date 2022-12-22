# Truth & Insurance Office Blog

> https://www.bowxeon.com

![Logo](assets/img/logo_logo_zhenxinhuaxian_tiw_600_150.png)

> 用 **Gitee Pages** 服务部署总是提示 

```text
部署失败
错误信息: 可能包含违禁违规内容，请排查调整后再行重试。
```

> 改用 Gitee Pages + 云机器 Docker 混合模式

## Assets 静态文件

通过 `Gitee Pages` + `_config.yml` 部署 `assets` 目录

## HTML 页面

通过 `Dockerfile` 构建镜像，在服务器部署容器服务 

> 服务器只需要承载小文件，节约服务器使用流量
