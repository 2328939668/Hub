#!/bin/bash

# Android APK 构建脚本
# 此脚本用于生成Android APK文件

echo "================================"
echo "开始构建 Android APK"
echo "================================"

# 检查Java环境
if ! command -v java &> /dev/null; then
    echo "错误: 未安装Java JDK"
    echo "请访问 https://adoptium.net/ 下载并安装Java 17或更高版本"
    exit 1
fi

# 检查Android SDK
if [ -z "$ANDROID_HOME" ]; then
    echo "警告: 未设置 ANDROID_HOME 环境变量"
    echo "请设置 Android SDK 路径,例如:"
    echo "export ANDROID_HOME=/path/to/android/sdk"
fi

# 进入项目目录
cd "$(dirname "$0")"

echo ""
echo "步骤 1: 构建Web应用..."
npm run build

if [ $? -ne 0 ]; then
    echo "错误: Web应用构建失败"
    exit 1
fi

echo ""
echo "步骤 2: 同步到Android平台..."
npx cap sync android

if [ $? -ne 0 ]; then
    echo "错误: 同步到Android平台失败"
    exit 1
fi

echo ""
echo "步骤 3: 构建Debug APK..."
cd android

# 使用Gradle构建Debug APK
./gradlew assembleDebug

if [ $? -ne 0 ]; then
    echo "错误: Android APK构建失败"
    exit 1
fi

# 返回项目根目录
cd ..

echo ""
echo "================================"
echo "构建完成!"
echo "================================"
echo "APK文件位置: android/app/build/outputs/apk/debug/app-debug.apk"
echo ""
echo "要在Android设备上安装APK,请执行:"
echo "adb install android/app/build/outputs/apk/debug/app-debug.apk"
echo ""
echo "================================"
