import Foundation

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
