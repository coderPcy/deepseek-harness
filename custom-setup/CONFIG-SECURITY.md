# 私有配置管理指南

## ⚠️ 重要提示

**永远不要将包含 API Key 的 `.env` 文件提交到 GitHub！**

## 📋 配置管理方案

### 方案 1：本地加密备份（推荐）

使用加密工具备份你的配置文件到云盘：

1. **使用 7-Zip 加密压缩**
   ```bash
   # 压缩并加密 .env 文件
   7z a -p -mhe=on my-deepseek-config.7z .env
   # 会提示输入密码
   ```

2. **上传到私有云盘**
   - OneDrive
   - Google Drive
   - 百度网盘
   - 阿里云盘

3. **在新电脑上恢复**
   ```bash
   # 从云盘下载 my-deepseek-config.7z
   # 解压到项目根目录
   7z x my-deepseek-config.7z
   ```

### 方案 2：使用环境变量

不使用 `.env` 文件，改用系统环境变量：

**Windows 设置：**
```cmd
# 打开系统环境变量设置
rundll32 sysdm.cpl,EditEnvironmentVariables

# 或使用命令行（需要管理员权限）
setx DEEPSEEK_API_KEY "your_api_key_here" /M
setx DEEPSEEK_BASE_URL "https://api.deepseek.com" /M
```

**优点**：
- 不需要 .env 文件
- 所有应用共享
- 更安全

**缺点**：
- 每台电脑需要手动设置
- 修改后需要重启应用

### 方案 3：使用密码管理器

推荐使用密码管理器（如 1Password、Bitwarden）存储配置：

1. 在密码管理器中创建一个安全笔记
2. 保存完整的 `.env` 文件内容
3. 在新电脑上复制粘贴

### 方案 4：使用 Git 加密（高级）

使用 `git-crypt` 或 `git-secret` 加密特定文件：

```bash
# 安装 git-crypt
# 然后加密 .env 文件
git-crypt init
echo ".env filter=git-crypt diff=git-crypt" >> .gitattributes
git add .env .gitattributes
git commit -m "Add encrypted config"
```

**注意**：需要在每台电脑上配置加密密钥。

## 📝 推荐的工作流程

### 初始设置（第一台电脑）

1. 克隆仓库
   ```bash
   git clone https://github.com/coderPcy/deepseek-harness.git
   cd deepseek-harness
   pnpm install
   ```

2. 创建配置文件
   ```bash
   copy custom-setup\config-template.env .env
   notepad .env
   # 填入你的 API Key
   ```

3. 加密备份到云盘
   ```bash
   7z a -p -mhe=on deepseek-config-backup.7z .env
   # 上传 deepseek-config-backup.7z 到你的私有云盘
   ```

4. 创建快捷方式
   ```bash
   cscript custom-setup\create-shortcut.vbs
   ```

### 新电脑设置

1. 克隆仓库
   ```bash
   git clone https://github.com/coderPcy/deepseek-harness.git
   cd deepseek-harness
   pnpm install
   ```

2. 从云盘恢复配置
   ```bash
   # 下载 deepseek-config-backup.7z
   7z x deepseek-config-backup.7z
   ```

3. 创建快捷方式
   ```bash
   cscript custom-setup\create-shortcut.vbs
   ```

## 🔒 安全检查清单

- [ ] `.env` 在 `.gitignore` 中
- [ ] 从未 `git add .env`
- [ ] 配置已加密备份到私有位置
- [ ] GitHub 仓库中不包含任何密钥
- [ ] 使用了强密码保护加密文件

## 🚨 如果不小心上传了 API Key

1. **立即撤销 API Key**
   - 访问 https://platform.deepseek.com/
   - 撤销泄露的 Key
   - 生成新的 Key

2. **从 Git 历史中删除**
   ```bash
   # 使用 BFG Repo-Cleaner 或 git-filter-repo
   git filter-repo --path .env --invert-paths
   git push --force
   ```

3. **检查 GitHub**
   - GitHub 会自动扫描并警告泄露的密钥

## 📚 更多资源

- [GitHub: Removing sensitive data](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository)
- [12-Factor App: Config](https://12factor.net/config)
- [git-crypt GitHub](https://github.com/AGWA/git-crypt)
