func numbToStringExternal(_ a: String) -> String {
    
    let dic09 = ["1": "один", "2": "два", "3": "три", "4": "четыре", "5": "пять", "6": "шесть", "7": "семь", "8": "восемь", "9": "девять"]
    let dic1019 = ["10": "десять", "11": "одиннадцать", "12": "двенадцать", "13": "тринадцать", "14": "четырнадцать", "15": "пятнадцать", "16": "шестнадцать", "17": "семнадцать", "18": "восемнадцать", "19": "девятнадцать"]
    let dic2090 = ["20": "двадцать", "30": "тридцать", "40": "сорок", "50": "пятьдесят", "60": "шестьдесят", "70": "семьдесят", "80": "восемьдесят", "90": "девяносто"]
    let dic100900 = ["100": "сто", "200": "двести", "300": "триста", "400": "четыреста", "500": "пятьсот", "600": "шестьсот", "700": "семьсот", "800": "восемьсот", "900": "девятьсот"]
    
    var arrayToSeparate = a.map{ String($0) }
    var separatedArray: [Int16] = []
    repeat {
        var a = ""
        for _ in 1...3 {
            if arrayToSeparate.count != 0 {
                a.insert(contentsOf: arrayToSeparate[arrayToSeparate.count - 1], at: a.startIndex)
                arrayToSeparate.removeLast()
                
            }
        }
        separatedArray.insert(Int16(a)!, at: 0)
    } while arrayToSeparate.count != 0
 
    let findNumb = { ( a: Int16, b: [String: String] ) -> String in
        b[String(a)] ?? ""
    }

    func switchFunc(_ a: Int16) -> (String, String, String) {
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
    
    func thousandWord(_ a: Int16) -> [String] {
        var result = ["тысяч", "миллионов", "миллиардов", "триллионов", "квадриллионов", "квинтиллионов", "секстиллионов", "септиллионов", "октиллионов", "нониллионов", "дециллионов", "ундециллионов", "додециллионов", "тредециллионов", "кваттуордециллионов", "квиндециллионов", "седециллионов", "септдециллионов", "октодециллионов", "новемдециллионов", "вигинтиллионов", "анвигинтиллионов", "дуовигинтиллионов", "тревигинтиллионов", "кватторвигинтиллионов", "квинвигинтиллионов", "сексвигинтиллионов", "септемвигинтиллионов", "октовигинтиллионов", "новемвигинтиллионов", "тригинтиллионов", "антригинтиллионов", "дуотригинтиллионов", "квадрагинтиллионов", "квинквагинтиллионов", "сексагинтиллионов", "септуагинтиллионов", "октогинтиллионов", "нонагинтиллионов", "центиллионов", "анцентиллионов", "дуоцентиллионов", "трецентиллионов", "кватторцентиллионов", "децицентиллионов", "ундецицентиллионов", "вигинтицентиллионов", "третригинтацентиллионов", "дуцентиллионов", "трицентиллионов", "квадрингентиллионов", "квингентиллионов", "сесцентиллионов", "септингентиллионов", "октингентиллионов", "нонгентиллионов", "миллиллионов", "дуомилиаллионов", "тремиллиаллионов", "кваттормиллиаллионов", "квинквемилиаллионов", "дуцентдуомилианонгентновемдециллионов", "милиамилиаиллионов", "дуомилиамилиаиллионов"]
        switch a % 100 {
        case 1:
            result[0] += "а"
            for i in 1..<result.count {
                result[i].removeLast(2)
            }
        case 2...4:
            result[0] += "и"
            for i in 1..<result.count {
                result[i].removeLast(2)
                result[i] += "а"
            }
        case 20...99:
            switch a % 100 % 10 {
            case 1:
                result[0] += "а"
                for i in 1..<result.count {
                    result[i].removeLast(2)
                }
            case 2...4:
                result[0] += "и"
                for i in 1..<result.count {
                    result[i].removeLast(2)
                    result[i] += "а"
                }
            default:
                break
        }
        default:
            break
        }
        return result
    }
    func insertValues() {
        resultString.insert(switchFunc(separatedArray[separatedArray.count - 1]).2, at: 0)
        resultString.insert(switchFunc(separatedArray[separatedArray.count - 1]).1, at: 0)
        resultString.insert(switchFunc(separatedArray[separatedArray.count - 1]).0, at: 0)
    }
    
    var resultString: [String] = []
    var result = ""
    
    insertValues()
    separatedArray.removeLast()
    
    var k = 0
    while separatedArray.count >= 1 {
        insertValues()
        switch resultString[0...2] {
        case ["", "", ""]:
            break
        default:
            resultString.insert(thousandWord(separatedArray[separatedArray.count - 1])[k], at: 3)
        }
        k += 1
        separatedArray.removeLast()
    }

    if resultString.count >= 4 {
        switch resultString[resultString.count - 5] {
        case "один":
            resultString[resultString.count - 5] = "одна"
        case "два":
            resultString[resultString.count - 5] = "две"
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
