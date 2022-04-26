func numbToStringExternal(_ a: String) -> String {
    
    let dic09 = ["1": "один", "2": "два", "3": "три", "4": "четыре", "5": "пять", "6": "шесть", "7": "семь", "8": "восемь", "9": "девять", "0": "ноль"]
    let dic1019 = ["10": "десять", "11": "одиннадцать", "12": "двенадцать", "13": "тринадцать", "14": "четырнадцать", "15": "пятнадцать", "16": "шестнадцать", "17": "семнадцать", "18": "восемнадцать", "19": "девятнадцать"]
    let dic2090 = ["20": "двадцать", "30": "тридцать", "40": "сорок", "50": "пятдесят", "60": "шестдесят", "70": "семьдесят", "80": "восемьдесят", "90": "девяноста"]
    let dic100900 = ["100": "сто", "200": "двести", "300": "триста", "400": "четыреста", "500": "пятсот", "600": "шестьсот", "700": "семьсот", "800": "восемьсот", "900": "девятсот"]
    var array = a.map { UInt(String($0))! }
    var arrayForThousandWord = array
    if arrayForThousandWord.count >= 4 {
        arrayForThousandWord.removeLast(3)
    }
 
    let findNumb = { ( a: UInt, b: [String: String] ) -> String in
        b[String(a)] ?? ""
    }

    func switchFunc(_ a: UInt) -> (String, String, String) {
        var res = ("", "", "")
        switch a {
        case 1...9:
            res.2 = findNumb(a, dic09)
        case 10...19:
            res.2 = findNumb(a, dic1019)
        case 20...99:
            if a % 10 == 0 {
                res.2 = findNumb(a / 10 * 10, dic2090)
            } else {
                res.2 = findNumb(a % 10, dic09)
                res.1 = findNumb(a / 10 * 10, dic2090)
            }
        case 100...999:
            if a % 10 == 0 {
                res.2 = findNumb(a / 10 % 10 * 10, dic2090)
                res.1 = findNumb(a / 100 * 100, dic100900)
            } else {
                switch a % 100 {
                case 1...9:
                    res.2 = findNumb(a % 100, dic09)
                    res.1 = findNumb(a / 100 * 100, dic100900)
                case 10...19:
                    res.2 = findNumb(a % 100, dic1019)
                    res.1 = findNumb(a / 100 * 100, dic100900)
                case 20...99:
                    res.2 = findNumb(a % 10, dic09)
                    res.1 = findNumb(a / 10 % 10 * 10, dic2090)
                    res.0 = findNumb(a / 100 * 100, dic100900)
                default:
                    break
                }
            }
        default:
            break
        }
        return res
    }
    
    func thousand(_ a: [UInt]) -> UInt {
        var intValue = UInt()
        switch a.count {
        case 3...:
            intValue = UInt(String(a[array.count - 3]) + String(a[array.count - 2]) + String(a[array.count - 1]))!
        case 2:
            intValue = UInt(String(a[array.count - 2]) + String(a[array.count - 1]))!
        case 1:
            intValue = UInt(String(a[array.count - 1]))!
        default:
            break
        }
        return intValue
    }
    
    func thousandWord(_ a: [UInt]) -> (UInt, String, String, String) {
        var intValue = UInt()
        var stringValue = "тысяч"
        var stringValue2 = "миллионов"
        var stringValue3 = "миллиардов"
        switch a.count {
        case 3...:
            intValue = UInt(String(a[arrayForThousandWord.count - 3]) + String(a[arrayForThousandWord.count - 2]) + String(a[arrayForThousandWord.count - 1]))!
        case 2:
            intValue = UInt(String(a[arrayForThousandWord.count - 2]) + String(a[arrayForThousandWord.count - 1]))!
        case 1:
            intValue = UInt(String(a[arrayForThousandWord.count - 1]))!
        default:
            break
        }
        switch intValue % 100 {
        case 1:
            stringValue += "а"
            stringValue2 = "миллион"
            stringValue3 = "миллиард"
        case 2...4:
            stringValue += "и"
            stringValue2 = "миллиона"
            stringValue3 = "миллиарда"
        case 20...99:
            switch intValue % 100 % 10 {
            case 1:
                stringValue += "а"
                stringValue2 = "миллион"
                stringValue3 = "миллиард"
            case 2...4:
                stringValue += "и"
                stringValue2 = "миллиона"
                stringValue3 = "миллиарда"
            default:
                break
        }
        default:
            break
        }
        return (intValue, stringValue, stringValue2, stringValue3)
    }
    
    
    var resultString: [String] = []
    var result = ""
    repeat {
        resultString.insert(switchFunc(thousand(array)).2, at: 0)
        resultString.insert(switchFunc(thousand(array)).1, at: 0)
        resultString.insert(switchFunc(thousand(array)).0, at: 0)
        if array.count <= 3 {
            array.removeAll()
        } else {
            array.removeLast(3)
        }
    } while array.count != 0

    if resultString.count >= 4 {
        switch resultString[resultString.count - 4] {
        case "один":
            resultString[resultString.count - 4] = "одна"
        case "два":
            resultString[resultString.count - 4] = "две"
        default:
            break
        }
    }

    for i in 0..<resultString.count {
        if resultString[i] != "" {
            result += resultString[i]
            result += " "
        }
    }
    result.remove(at: result.index(result.endIndex, offsetBy: -1))
    return result
}
