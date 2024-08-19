# 用于保存学习Godot的代码库

### 学习链接，感谢制作教程的大佬们：

1. [哔哩哔哩 - godot 4.x 100集入门教程](https://www.bilibili.com/video/av253177516/)
2. Brackeys的Godot教程1，一款平台跳跃实战体验项目

   * [b站精翻熟肉 - 想在2024年做游戏？跟着Brackeys来学Godot引擎吧！](https://www.bilibili.com/video/av1153814621/)
   * [油管原视频生肉 - How to make a Video Game - Godot Beginner Tutorial](https://www.youtube.com/watch?v=LOhfqjmasi0)
3. Brackeys的Godot教程2，GDScript教程

   * [b站精翻熟肉 - 一小时学会Godot编程！跟着Brackeys学GD Script](https://www.bilibili.com/video/av1004605166/)
   * [油管原视频生肉 - How to program in Godot - GDScript Tutorial](https://www.youtube.com/watch?v=e1zJS31tr88)
4. [哔哩哔哩 - godot 4.x 200集进阶教程](https://space.bilibili.com/479412933/channel/collectiondetail?sid=546592)

### HelloWorld

就是HelloWorld而已

### GodotTest

初次进入godot测试项目

### GDSStudy

GDScript的一些基础

### GDSStudy2

GDScript和游戏引擎关联比较大的一些语法等

### Dodge the creeps

实战项目1，官方的2d示例项目，独自完成

实现：

* UI界面，点击Start开始游戏，每秒增加1分
* 死亡后停止增加分数，并且在gameover字样后返回初始界面，重新开始后归零重新计数
* 开始游戏后播放音乐，死亡时播放死亡音效并停止音乐
* 上下左右移动角色，不能移动超出边界
* 角色上下左右会做出不同的动画，并且移动时有拖尾装饰
* 怪物生成时会随机在三种动画中选择一种，并且始终朝向自身朝向的前方移动，在移动到游戏窗口外时销毁
* 怪物每0.1秒生成1个，随机生成在游戏窗口的外围，并且移动方向为朝向游戏窗口的随机角度
* 角色与怪物发生碰撞时游戏结束

### Brackeys Plantform Game

实战项目2，Brackeys的教程实战体验项目，跟视频完成

实现：

* UI界面，点击Start开始游戏，每秒增加1分
