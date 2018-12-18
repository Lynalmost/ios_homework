/*
author:Lyn
version1: 2018.10.5
version2: 2018.10.8
*/
var primes=[Int]()
var isPrimes=true;
for i in 2...100 {
    isPrimes = true
    for j in 2..<i {
        if (j%i == 0) {
            isPrimes=false
        }
    }
    if (isPrimes) {
        primes.append(i);
    }
}

func compare(x:Int, y:Int)->Bool {
    return x>y
}

print("原数组：")
print(primes)
print("方法1 逆序：")
primes.sort(by:compare)
print(primes)

primes.sort(by:{
    (x:Int, y:Int)->Bool in
    return x>y
})
print("方法2 逆序：")
print(primes)
primes.sort(by:{
    (x,y) in
    return x>y
})
print("方法3 逆序：")
print(primes)
primes.sort(by:{
    (x,y) in
    x>y
})
print("方法4 逆序：")
print(primes)
print("方法5 逆序：")
primes.sort(by:{$0>$1})
print(primes)

enum Gender:Int {
    case male,female
    static func >(g1: Gender, g2: Gender) -> Bool {
        return g1.rawValue < g2.rawValue
    }

}
enum Department:String {
        case CS,Math,Chinese,English,Unknown
}
protocol SchoolProtocol {
    var department:Department {set get}
    func lendBook()
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
    func run() {
        print("Person \(self.fullName) is running")
    }
    
}

class Teacher:Person, SchoolProtocol{
    var title:String
    var department:Department
    init(firstName:String, lastName:String, gender:Gender, age:Int, title:String, department:Department) {
        self.title = title
        self.department = department
        super.init(firstName:firstName, lastName:lastName, gender:gender, age:age)
        
    }
    convenience init(firstName:String, lastName:String, title:String) {
        self.init(firstName:firstName, lastName:lastName, gender:Gender.male, age:18, title:title, department:Department.Unknown)
    }
    //重载父类的属性
    override var description: String {
        return "name=\(fullName), gender=\(gender), age=\(age), title=\(title), department=\(department)"
    }
    override func run() {
        print("Teacher \(self.fullName) is running")
    }

    func lendBook() {
        print("Teacher \(self.fullName) lend successful")
    } 
}

class Student:Person, SchoolProtocol{
    var stuNo:String
    var department:Department
    init(firstName:String, lastName:String, gender:Gender, age:Int, stuNo:String, department:Department) {
        self.stuNo = stuNo
        self.department = department
        super.init(firstName:firstName, lastName:lastName, gender:gender, age:age)
        
    }
    convenience init(firstName:String, lastName:String, stuNo:String) {
        self.init(firstName:firstName, lastName:lastName, gender:Gender.male, age:18, stuNo:stuNo, department:Department.Unknown)
    }
    //重载父类的属性
    override var description: String {
        return "name=\(fullName), stuNo=\(stuNo), gender=\(gender), age=\(age), department=\(department)"
    }
    override func run() {
        print("Student \(self.fullName) is running")
    }
    func lendBook() {
        print("Student \(self.fullName) lend successful")
    } 
}


var p1 = Person(firstName:"Li", lastName:"Yin", gender: Gender.female, age:20)
var p2 = Person(firstName:"Xie", lastName:"Xin")
var s1 = Student(firstName:"Xie",lastName:"Dabao",gender: Gender.male,age:16, stuNo:"2016110304", department:Department.Math)
var t1 = Teacher(firstName:"liu",lastName:"Yue",gender: Gender.male, age:50, title:"IOS", department:Department.CS)

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

for p in persons {
   if let t = p as? Teacher {  
       t.run()
       t.lendBook()
    } 
	else if let s = p as? Student {  
       s.run()
       s.lendBook()
    } 
	else {  
        p.run()
    }
}
