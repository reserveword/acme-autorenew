# ACME AutoRenew

- 使用 Github Actions 自动更新证书有效期
- 基于 [acme.sh](https://github.com/acmesh-official/acme.sh)
- 本项目不能自动申请证书，具体操作看[使用方法](#使用方法)一节
- 本项目需要使用者了解基本的 git 操作，或者了解基本的搜索引擎使用

## 使用方法

- 首先 [fork](https://github.com/reserveword/IMBlocker/fork) 本项目
- 将本项目克隆到你自己的 Linux 机器中（Windows 用户可以使用 [WSL]()）
- 使用本项目附带的 acme.sh 程序申请证书（也可以自己使用 acme.sh 申请证书）
- 运行 ``before-commit.sh``，该程序会将 acme.sh 运行所需的数据复制到仓库中，并把关键秘密数据聚集输出到 SECRET_FILES.key 文件中
- 到仓库的 Secrets 页面中添加 Secret 条目，名称为 `SECRET_FILES`，值为 SECRET_FILES.key 文件中的内容。
- 保存并提交仓库（注：秘密数据已使用 `.gitignore` 忽略，不会被一并提交）
- 由于 github 会在仓库 60 天内没有动过的情况下停用 Actions，需要用你自己的电脑周期性激活它。
- 设置任务计划程序或 `crontab` 每个月运行 ``enable-actions.sh``