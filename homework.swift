/*
author:Lyn
time:2018.10.5
*/
enum Gender:Int {
    case male,female
    static func >(g1: Gender, g2: Gender) -> Bool {
        return g1.rawValue < g2.rawValue
    }

}

class Person:CustomStringConvertible{
    var firstName:String
    var lastName:String
    var gender:Gender
    var age:Int
    var fullName:String{
        return firstName + " " + lastName
    }
    //构造函数
    init(firstName:String, lastName:String, gender:Gender, age:Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.age = age
    }
    //便利构造函数
    convenience init(firstName:String, lastName:String) {
        self.init(firstName:firstName, lastName:lastName, gender:Gender.male, age:18)
    }
    //能使用print直接打印对象
    var description: String {
        return "name=\(fullName),gender=\(gender), age=\(age)"
    }
    static func ==(p1:Person,p2:Person)->Bool{
        return p1.fullName==p2.fullName && p1.gender==p2.gender && p1.age==p2.age
    }
    static func !=(p1:Person,p2:Person)->Bool{
        return p1.fullName != p2.fullName
        
    }
    
}

class Teacher:Person{
    var title:String
    init(firstName:String, lastName:String, gender:Gender, age:Int, title:String) {
        self.title=title
        super.init(firstName:firstName, lastName:lastName, gender:gender, age:age)
        
    }
    convenience init(firstName:String, lastName:String, title:String) {
        self.init(firstName:firstName, lastName:lastName, gender:Gender.male, age:18, title:title)
    }
    //重载父类的属性
    override var description: String {
        return "name=\(fullName), gender=\(gender), age=\(age), title=\(title)"
    }
}

class Student:Person{
    var stuNo:String
    init(firstName:String, lastName:String, gender:Gender, age:Int, stuNo:String) {
        self.stuNo = stuNo
        super.init(firstName:firstName, lastName:lastName, gender:gender, age:age)
        
    }
    convenience init(firstName:String, lastName:String, stuNo:String) {
        self.init(firstName:firstName, lastName:lastName, gender:Gender.male, age:18, stuNo:stuNo)
    }
    //重载父类的属性
    override var description: String {
        return "name=\(fullName), stuNo=\(stuNo), gender=\(gender), age=\(age)"
    }
}


var p1 = Person(firstName:"Li", lastName:"Yin", gender: Gender.female, age:20)
var p2 = Person(firstName:"Xie", lastName:"Xin")
var s1=Student(firstName:"Xie",lastName:"Dabao",gender: Gender.male,age:16, stuNo:"2016110304")
var t1=Teacher(firstName:"liu",lastName:"Yue",gender: Gender.male, age:50, title:"IOS")

if p1 == p2 {
	print("P1,P2 are the same person")
}

if p1 != p2 {
	print("P1,P2 are different person")
}

var persons = [p1,p2,s1,t1]

var dictionary = ["pno": 0, "tno": 0, "sno": 0]

for p in persons {
    if p is Teacher {  
        dictionary["tno"]! += 1
    } 
	else if p is Student {  
        dictionary["sno"]! += 1
    } 
	else {  
        dictionary["pno"]! += 1
    }
}

for (key, value) in dictionary {
    print("There are \(value) \(key) ")
}

print("原始数组：")
for p in persons {
    print(p)
}

print("按照年龄从小到大：")
persons.sort {$0.age < $1.age}
for p in persons {
    print(p)
}

print("按照名字排序：")
persons.sort {$0.fullName < $1.fullName }
for p in persons {
    print(p)
}

print("按照性别和年龄排序")
persons.sort { return ($0.gender > $1.gender) && ($0.age > $1.age)  }
for p in persons {
    print(p)
}
