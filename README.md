<p align="center"><strong>node-gyp-offline-install</strong></p>

<p align="center">
<a href="https://github.com/itas109/node-gyp-offline-install/releases"><img alt="Version" src="https://img.shields.io/github/release/itas109/node-gyp-offline-install"/></a>
<a href="https://github.com/itas109/node-gyp-offline-install/stargazers"><img alt="Stars" src="https://img.shields.io/github/stars/itas109/node-gyp-offline-install"/></a>
<a href="https://gitee.com/itas109/node-gyp-offline-install"><img alt="Stars" src="https://gitee.com/itas109/node-gyp-offline-install/badge/star.svg?theme=dark"/></a>
<a href="https://github.com/itas109/node-gyp-offline-install/network/members"><img alt="Forks" src="https://img.shields.io/github/forks/itas109/node-gyp-offline-install"/></a>
<a href="https://github.com/itas109/node-gyp-offline-install/blob/master/LICENSE"><img alt="License" src="https://img.shields.io/badge/License-MIT-orange"/></a>
<img alt="platform" src="https://img.shields.io/badge/platform-windows%20%7C%20linux-lightgrey"/>
<img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/itas109/node-gyp-offline-install">
</p>

<p align="center">
语言：<a href="README-EN.md">English</a> / <strong>中文</strong>
</p>

---

## 简介

**node-gyp-offline-install** 是一个用于 Node.js C++ 插件的 `node-gyp` 离线安装工具。它允许你在没有网络连接的环境中，快速搭建 `node-gyp` 开发环境。

## 特性

-   **离线安装**：无需网络即可安装 `node-gyp` 及其依赖。
-   **多平台支持**：支持 Windows 和 Linux 平台。
-   **多架构支持**：支持 x86、x64、armv7l、arm64 等架构。
-   **自定义 Node.js 镜像**：可配置 Node.js 镜像地址。
-   **自动 LTS 版本下载**：自动下载指定数量的 LTS 版本。

## 平台支持

-   Windows (x86, x64)
-   Linux (x86, x64, armv7l, aarch64)

## 最新版本

**Version:** 1.1.0 (2022-02-28)

## 快速开始

### 1. 克隆项目

```bash
git clone --depth=1 https://github.com/itas109/node-gyp-offline-install.git
cd node-gyp-offline-install
cd Node.js
npm install
```

### 2. 生成离线安装包

#### Windows

```bash
node index.js -p win32 -a x64 -v 16.14.0 -m https://npmmirror.com/mirrors/node/
```

#### Linux

```bash
node index.js -p linux -a x64 -v 16.14.0 -m https://npmmirror.com/mirrors/node/
```

### 3. 复制到目标机器

将生成的 `node-gyp-offline-install-{platform}-{arch}-v{version}` 文件夹复制到目标离线机器上。

### 4. 执行安装脚本

#### Windows

双击运行 `node-gyp-offline-install.bat`。

#### Linux

```bash
cd node-gyp-offline-install-linux-x64-v16.14.0
chmod +x ./node-gyp-offline-install.sh
./node-gyp-offline-install.sh
```

### 5. 测试安装

```bash
cd test/node-gyp-demo
node-gyp configure
node-gyp build
node index.js
```

如果输出 "hello world"，则表示安装成功。

## 命令行参数

-   `-p, --platform`: 目标平台 (win32/linux)，默认当前平台
-   `-a, --arch`: 目标架构 (x86/x64/armv7l/arm64)，默认当前架构
-   `-v, --version`: 目标 Node.js 版本，默认当前版本
-   `-alc, --autoLTSCount`: 自动下载指定数量的 LTS 版本，默认为 1
-   `-m, --mirror`: Node.js 镜像地址，默认使用淘宝镜像
-   `-nm, --npmMirror`: NPM 镜像地址，默认使用淘宝镜像

## 目录结构

```
node-gyp-offline-install/
├── Node.js/
│   ├── index.js          # 主程序
│   ├── package.json      # 依赖配置文件
│   └── ...
├── test/
│   ├── node-gyp-demo/    # 测试项目
│   └── ...
├── README.md             # 说明文档
└── ...
```

## 示例代码

`test/node-gyp-demo/index.js` 用于加载和测试 C++ 插件。

```javascript
try {
  module.exports = require('./build/Debug/addon');
} catch (e) {
  module.exports = require('./build/Release/addon');
}
```