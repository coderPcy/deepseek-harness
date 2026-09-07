# DeepSeek Harness 自定义配置

这个目录包含了 DeepSeek Harness 的自定义配置和启动脚本，方便在多台电脑上快速部署。

## 📦 包含内容

- `start-deepseek.bat` - 启动脚本（自动检测端口、智能启动）
- `stop-deepseek.bat` - 停止脚本
- `create-shortcut.vbs` - 创建桌面快捷方式
- `config-template.env` - 配置文件模板
- `deepseek-icon.ico` - DeepSeek 官方鲸鱼图标
- `README.md` - 本说明文档

## 🚀 快速开始

### 1. 克隆仓库

```bash
git clone https://github.com/YOUR_USERNAME/deepseek-harness.git
cd deepseek-harness
```

### 2. 安装依赖

确保已安装 Node.js (v22+)，然后运行：

```bash
pnpm install
```

如果没有 pnpm，先安装：
```bash
npm install -g pnpm
```

### 3. 配置 API Key（可选）

如果需要使用自定义 API：

```bash
# 复制配置模板
copy custom-setup\config-template.env .env

# 编辑 .env 文件，填入你的 API Key
notepad .env
```

`.env` 文件示例：
```env
DEEPSEEK_API_KEY=sk-your-api-key-here
DEEPSEEK_BASE_URL=https://api.deepseek.com
```

### 4. 创建桌面快捷方式

双击运行：
```
custom-setup\create-shortcut.vbs
```

或在命令行运行：
```bash
cscript custom-setup\create-shortcut.vbs
```

### 5. 启动服务

**方式一：双击桌面快捷方式**
- 桌面上会出现 "DeepSeek Harness" 快捷方式
- 双击即可启动

**方式二：手动运行脚本**
```bash
custom-setup\start-deepseek.bat
```

## ✨ 功能特点

### 智能启动检测
- ✅ 自动检测端口占用
- ✅ 如果已运行，直接打开浏览器
- ✅ 如果未运行，启动服务并在 8 秒后打开浏览器

### 优雅的服务管理
- ✅ 关闭命令行窗口 = 停止服务
- ✅ 可以随意关闭浏览器，服务继续运行
- ✅ 提供专门的停止脚本

### DeepSeek 官方图标
- ✅ 使用 DeepSeek 官方鲸鱼 logo
- ✅ 桌面快捷方式更美观

## 🛠️ 使用说明

### 启动服务

**方法 1：桌面快捷方式**
```
双击 "DeepSeek Harness" 快捷方式
```

**方法 2：命令行**
```bash
custom-setup\start-deepseek.bat
```

### 停止服务

**方法 1：关闭命令行窗口**
- 直接关闭启动脚本的窗口即可

**方法 2：使用停止脚本**
```bash
custom-setup\stop-deepseek.bat
```

**方法 3：任务管理器**
- 找到 node.exe 进程并结束

### 访问 Web UI

服务启动后，浏览器会自动打开，或手动访问：
```
http://127.0.0.1:3080
```

## 📊 查看缓存命中率

在命令行中运行：

```bash
# Windows (Git Bash)
awk 'BEGIN {tc=0; tr=0} {if (match($0, /"cache_creation_input_tokens":([0-9]+)/, a)) tc+=a[1]; if (match($0, /"cache_read_input_tokens":([0-9]+)/, a)) tr+=a[1]} END {printf "Cache Hit Rate: %.2f%%\n", (tr/(tc+tr))*100}' ~/.zcode/cli/rollout/model-io-sess_*.jsonl
```

或在 Web UI 中查看会话统计信息。

## 🔧 自定义配置

### 修改端口

在 `.env` 文件中添加：
```env
PORT=3080
```

### 使用自定义 API 端点

```env
DEEPSEEK_BASE_URL=https://your-custom-api.com
```

## 📝 目录结构

```
deepseek-harness/
├── custom-setup/              # 自定义配置目录
│   ├── start-deepseek.bat    # 启动脚本
│   ├── stop-deepseek.bat     # 停止脚本
│   ├── create-shortcut.vbs   # 快捷方式创建脚本
│   ├── config-template.env   # 配置模板
│   ├── deepseek-icon.ico     # 图标
│   └── README.md             # 本文档
├── .env                       # 配置文件（需手动创建）
├── packages/                  # 源代码
├── docs/                      # 文档
└── ...
```

## ❓ 常见问题

### Q: 双击快捷方式后窗口立即关闭？

**A:** 可能是以下原因：

1. **端口已被占用** - 再次双击会直接打开浏览器
2. **Node.js 未安装** - 请安装 Node.js v22+
3. **依赖未安装** - 运行 `pnpm install`

### Q: 如何在新电脑上快速部署？

**A:** 按以下步骤：

```bash
# 1. 克隆仓库
git clone https://github.com/YOUR_USERNAME/deepseek-harness.git
cd deepseek-harness

# 2. 安装依赖
pnpm install

# 3. 配置 API（可选）
copy custom-setup\config-template.env .env
notepad .env

# 4. 创建快捷方式
cscript custom-setup\create-shortcut.vbs

# 5. 启动
双击桌面快捷方式
```

### Q: 如何更新到最新版本？

**A:**

```bash
cd deepseek-harness
git pull
pnpm install
```

### Q: 配置文件会被提交到 Git 吗？

**A:** 不会。`.env` 文件已在 `.gitignore` 中，不会被提交。只有 `config-template.env` 模板会被提交。

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

本项目遵循 DeepSeek Harness 的原始许可证。

## 🔗 相关链接

- [DeepSeek 官网](https://www.deepseek.com)
- [DeepSeek API 文档](https://api-docs.deepseek.com/)
- [DeepSeek Harness 官方仓库](https://github.com/deepseek-ai/deepseek-harness)

---

**提示**: 首次启动可能需要较长时间下载依赖，请耐心等待。
