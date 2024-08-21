extends Node2D;

# 数据类型：bool，int，float，String，Array，Object，null，未定义的数据默认是null
var myBool = true;
var myInt = 114514;
var myFloat = 1.23;
var myString = "我是谁";
var myArray = [1,2,3,4];
var myObject = {"a": 1, "b": 2};
var myNull = null;
#print(myObject.a);

func _init():
	print("init");

# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print("process");
	pass;
