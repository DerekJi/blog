# Piechowski.io Development Blog

本项目为基于 Jekyll + GitHub Pages 的静态博客，支持 Markdown 文章自动聚合、标签、摘要、缩略图等功能。

---

## 🚀 快速开始

### 1. 本地启动（推荐 Docker）

无需本地安装 Ruby，只需：

```bash
docker-compose up
```

- 首次运行会自动构建镜像并安装依赖。
- 启动后访问：http://localhost:4000/blog/

### 2. 本地验证（可选）

运行：

```bash
bash verify-local.sh
```

- 检查配置、目录、frontmatter 等，全部通过会显示 “All verifications passed!”

---

## 📦 目录结构

```
blog/
├── published/           # 已发布文章（Markdown，带 frontmatter）
├── drafts/              # 草稿区（不会被发布）
├── images/              # 文章配图、缩略图
├── _layouts/            # Jekyll 模板
├── _config.yml          # Jekyll 配置
├── index.html           # 博客首页模板
├── Gemfile              # Ruby 依赖
├── Dockerfile           # Docker 构建文件
├── docker-compose.yml   # Docker Compose 配置
├── .github/workflows/   # GitHub Actions 自动部署
├── verify-local.sh      # 本地验证脚本
└── README.md            # 项目说明
```

---

## ✍️ 写文章

1. 在 `published/` 下新建 Markdown 文件，文件名建议：`YYYY-MM-DD-title.md`
2. 必须包含 YAML frontmatter，例如：

```markdown
---
title: 文章标题
date: 2026-04-12
tags: [tag1, tag2]
description: 简短摘要
image: /images/xxx-thumb.png
---

正文内容...
```

3. 保存后，`docker-compose up` 自动热更新。

---

## 🌐 部署上线

- 推送到 GitHub 后，Actions 会自动构建并部署到 GitHub Pages。
- 访问地址：`https://derekji.github.io/blog/`
- 配置见 `.github/workflows/jekyll.yml`

---

## 🛠️ 常见问题

- **端口冲突**：如 4000 被占用，可修改 `docker-compose.yml` 的端口映射。
- **页面 404 或样式丢失**：确认 baseurl 配置为 `/blog`，并强制刷新浏览器缓存。
- **Actions 构建失败**：请查看 Actions 日志，或运行 `bash verify-local.sh` 本地排查。

---

## 📄 参考
- [Jekyll 官方文档](https://jekyllrb.com/)
- [GitHub Pages 指南](https://docs.github.com/en/pages)

---

如有问题欢迎提 Issue 或 PR！
