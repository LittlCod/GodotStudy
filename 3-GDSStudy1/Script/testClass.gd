extends Node

class Animal:
	extends Object; # 如果没有继承，就默认是Object
	const THIS_NAME = "动物"; # 定义一个常量
	var height: int; # 添加一个身高属性
	
	func _init():
		print("构造方法，实例化对象的时候触发");
	func move():
		print("移动了");
		
	static func hello():
		print("hello");
	
class Dog:
	extends Animal;
	func _init(height):
		print("小狗狗");
		self.height = height;
		
	func move():
		print("狗狗移动了");
		super.move()
	
	func talk():
		print("汪汪汪，我的身高是", height);

# Called when the node enters the scene tree for the first time.
func _ready():
	var dog = Dog.new(100);
	print("身高：", dog.height);
	print("是", dog.THIS_NAME);
	dog.talk();
	dog.move();
	Animal.hello(); # 静态方法可以直接调用
	dog.hello();
	var animal = Animal.new();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
