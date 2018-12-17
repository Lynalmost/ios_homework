import Foundation
//task 1:显示当前准确的中文时间，包括北京、东京、纽约、伦敦，格式为（2016年9月28日星期三 上午10:25）
let currentDate = Date()
var formatter = DateFormatter()
formatter.dateFormat = "yyyy 年 M 月 dd 日 EEEE aa KK:mm"
formatter.locale = Locale(identifier: "zh_CN")
//北京时间
formatter.timeZone = TimeZone(abbreviation: "UTC+8:00")
let beijing = formatter.string(from: currentDate)
print("Beijing time:" + beijing)
//东京时间
formatter.timeZone = TimeZone(abbreviation: "UTC+9:00")
let tokyo = formatter.string(from: currentDate)
print("Tokyog time:" + tokyo)
//纽约时间
formatter.timeZone = TimeZone(abbreviation: "UTC-5:00")
let newyork = formatter.string(from: currentDate)
print("NewYork time:" + newyork)
formatter.timeZone = TimeZone(abbreviation: "UTC+0:00")
//伦敦时间
let london = formatter.string(from: currentDate)
print("London time:" + london)

var str = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS.";
//分别找到起始点和结束点
let index1 = str.index(str.startIndex, offsetBy: 6)
let index2 = str.index(str.startIndex, offsetBy: 21)

//task 2:处理字符串
var str = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS.";
//分别找到起始点和结束点
let index1 = str.index(str.startIndex, offsetBy: 6)
let index2 = str.index(str.startIndex, offsetBy: 21)

let str1 = str[index1..<index2]
print(str1)

let str2 = str.replacingOccurrences(of:"OS", with:"")

print(str2)
//task3:将1、2题的时间和字符串存入一个字典中，并存入沙盒中的Document某文件中；
let dic = ["date": ["Beijing": beijing, "Tokyo": tokyo, "NewYork": newyork, "London":london, "subString": str1]] as! AnyObject  //将字典转换为任意类型，便于后面写入文件

//获取工作路径下的Document文件夹
let fileManager = FileManager.default
var path = fileManager.urls(for: .documentDirectory, in:.userDomainMask).first!

path.appendPathComponent("dic.txt")

try? dic.write(to: path, atomically: true)
