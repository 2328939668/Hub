# Android APK 安装完整指南

## 🚀 快速开始

### 推荐方案: 使用GitHub Actions获取APK(最简单)

#### 步骤1: 自动构建APK

1. 访问GitHub仓库的Actions页面:
   ```
   https://github.com/2328939668/Hub/actions
   ```

2. 找到"Build Android APK"工作流

3. 点击工作流右侧的"Run workflow"按钮

4. 选择分支`260213-feat-generate-android-app`

5. 点击绿色"Run workflow"按钮

6. 等待3-5分钟构建完成

#### 步骤2: 下载APK

1. 构建完成后,点击完成的构建任务

2. 滚动到底部找到"Artifacts"部分

3. 点击"app-debug"下载

4. 解压下载的zip文件,得到`app-debug.apk`

#### 步骤3: 安装到手机

**方法A: USB连接安装(推荐)**

1. **在手机上启用开发者选项**
   - 设置 > 关于手机
   - 连续点击"版本号"7次
   - 看到提示"您已处于开发者模式"

2. **启用USB调试**
   - 返回设置
   - 找到"开发者选项"
   - 打开"USB调试"

3. **连接手机到电脑**
   - 使用USB数据线连接
   - 手机上选择"文件传输"或点击"允许USB调试"

4. **在电脑上打开命令行**

   **Windows (CMD或PowerShell):**
   ```cmd
   # 下载APK到某个目录,比如D盘
   cd D:\

   # 解压后进入APK所在目录
   cd path\to\extracted\folder

   # 安装APK
   adb install app-debug.apk
   ```

   **Mac/Linux (Terminal):**
   ```bash
   # 进入APK所在目录
   cd ~/Downloads/

   # 解压zip文件
   unzip app-debug.zip

   # 进入解压后的目录
   cd app-debug/

   # 安装APK
   adb install app-debug.apk
   ```

5. **验证安装**
   ```bash
   # 检查应用是否安装成功
   adb shell pm list packages | grep decentralizedchat

   # 启动应用
   adb shell monkey -p com.hub.decentralizedchat 1
   ```

**方法B: 直接传输APK到手机**

1. **传输APK文件**
   - 微信/QQ: 将APK文件发送给自己
   - 邮件: 发送到自己的邮箱
   - 云盘: 上传到百度网盘/Google Drive
   - USB: 拔掉USB数据线,重新连接,选择"文件传输",复制APK到手机存储

2. **在手机上安装**
   - 打开文件管理器
   - 找到APK文件(通常在Download文件夹)
   - 点击APK文件
   - 如果提示"未知来源",点击"设置"
   - 允许安装来自此来源的应用
   - 点击"安装"

3. **完成安装**
   - 等待安装完成
   - 点击"打开"或去应用列表启动

---

## 🔧 方案二: 使用Android Studio本地构建

### 安装Android Studio

1. **下载Android Studio**
   - 官网: https://developer.android.com/studio
   - Windows: 下载.exe安装包
   - Mac: 下载.dmg文件
   - Linux: 下载.tar.gz

2. **安装Android Studio**
   - **Windows**: 双击.exe,按提示安装
   - **Mac**: 打开.dmg,拖到Applications文件夹
   - **Linux**: 解压.tar.gz,运行studio.sh

3. **首次启动配置**
   - 选择"Standard"安装
   - 等待下载SDK和工具(需要5-10分钟)
   - 接受许可证协议

### 打开项目

1. **克隆仓库到本地**
   ```bash
   git clone https://github.com/2328939668/Hub.git
   cd Hub
   ```

2. **打开Android项目**
   ```bash
   cd decentralized-chat-app
   npx cap open android
   ```

   或者在Android Studio中:
   - File > Open
   - 选择`decentralized-chat-app/android`文件夹

3. **等待Gradle同步**
   - 首次打开需要下载依赖
   - 右下角显示进度条
   - 等待"Sync Finished"提示

### 构建APK

1. **在Android Studio菜单栏**
   - 点击"Build"
   - 选择"Build Bundle(s) / APK(s)"
   - 选择"Build APK(s)"

2. **等待构建**
   - 右下角显示构建进度
   - 首次构建需要5-10分钟
   - 看到"BUILD SUCCESSFUL"

3. **找到APK位置**
   - 点击通知中的"locate"
   - 或手动打开:
     - `android/app/build/outputs/apk/debug/app-debug.apk`

4. **安装APK**
   - 按照上面的"方法A: USB连接安装"步骤操作

---

## 📱 方案三: 使用云端IDE

### GitHub Codespaces(无需安装,浏览器内操作)

1. **创建Codespace**
   - 访问: https://github.com/2328939668/Hub
   - 点击绿色"Code"按钮
   - 选择"Codespaces"
   - 点击"Create codespace on main"

2. **等待环境启动** (1-2分钟)

3. **在浏览器终端执行**
   ```bash
   cd decentralized-chat-app
   npm ci
   npm run build
   npx cap sync android
   cd android
   ./gradlew assembleDebug
   ```

4. **下载APK**
   - 构建完成后,左侧文件浏览器找到:
     `android/app/build/outputs/apk/debug/app-debug.apk`
   - 右键点击 > Download

5. **安装到手机**
   - 下载到本地电脑后,按照上面的方法安装

### Gitpod(类似的云端开发环境)

1. 访问仓库主页
2. 点击"Code" > "Open with Gitpod"
3. 等待环境启动后,执行相同构建命令

---

## 🌐 方案四: 在线APK构建服务

### Appetize.io (在线测试)

1. 访问: https://appetize.io
2. 上传APK文件(需要先构建)
3. 生成在线预览链接
4. 在手机浏览器中访问测试

### Buildozer (Python构建工具)

如果使用Linux,可以尝试:
```bash
pip install buildozer
cd decentralized-chat-app
buildozer android debug
```

---

## 🔍 故障排除

### 问题1: ADB无法识别设备

**症状**: `adb devices`显示空列表

**解决方案**:
```bash
# 重启ADB
adb kill-server
adb start-server

# 重新连接USB线
adb devices

# 检查手机USB调试是否启用
# 检查USB连接模式(选择文件传输)
```

### 问题2: 安装失败: INSTALL_FAILED_UPDATE_INCOMPATIBLE

**原因**: 已安装的版本与APK签名不匹配

**解决方案**:
```bash
# 卸载旧版本
adb uninstall com.hub.decentralizedchat

# 重新安装
adb install app-debug.apk

# 或使用强制覆盖
adb install -r app-debug.apk
```

### 问题3: 安装失败: INSTALL_FAILED_INSUFFICIENT_STORAGE

**原因**: 手机存储空间不足

**解决方案**:
```bash
# 清理手机存储,删除不必要的应用
# 或使用低内存安装
adb install -g app-debug.apk
```

### 问题4: 构建失败: SDK not found

**解决方案**:
- 在Android Studio中打开项目
- 让Android Studio自动下载SDK
- 或手动设置ANDROID_HOME环境变量

### 问题5: 手机提示"危险应用"

**说明**: Debug APK未经过Google签名

**解决方案**:
- 这是正常现象
- 点击"详细信息"
- 选择"仍然安装"
- 或在设置中允许未知来源

---

## 📊 应用信息

| 项目 | 值 |
|------|-----|
| **应用名称** | Decentralized Chat |
| **包名** | com.hub.decentralizedchat |
| **版本** | 1.0 |
| **版本代码** | 1 |
| **最低Android** | 7.0 (API 24) |
| **目标Android** | 11 (API 30) |
| **架构** | armeabi-v7a, arm64-v8a, x86, x86_64 |
| **签名** | Debug签名(测试用) |

---

## ✅ 安装后验证

### 检查应用是否安装成功

**ADB命令:**
```bash
# 列出已安装的包
adb shell pm list packages | grep decentralizedchat

# 输出应该显示:
# package:com.hub.decentralizedchat
```

**手动验证:**
1. 在手机应用列表中找到"Decentralized Chat"
2. 点击启动应用
3. 检查5个功能模块是否显示

### 测试应用功能

1. **切换底部导航标签**
   - 点击不同图标查看5个模块

2. **检查UI显示**
   - 验证图标和文字正常显示
   - 检查暗黑主题是否正确应用

3. **性能测试**
   - 检查应用是否流畅
   - 切换标签是否快速

---

## 📞 获取帮助

如果遇到问题:

1. **GitHub Issues**
   - https://github.com/2328939668/Hub/issues

2. **查看构建日志**
   - GitHub Actions页面查看详细日志

3. **查看文档**
   - `BUILD_ANDROID.md`
   - `BUILD_INSTRUCTIONS.md`

---

## 🎯 推荐流程

**最简单:**
1. 访问GitHub Actions
2. 运行构建
3. 下载APK
4. 传到手机安装

**最可靠:**
1. 克隆仓库
2. 使用Android Studio构建
3. ADB安装到手机

**最快测试:**
1. 使用GitHub Codespaces
2. 在线构建APK
3. 下载并安装

选择最适合您的方案开始安装!
