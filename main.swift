//Основная функция преобразования чисел в названия
func numbToStringExternal(_ a: String) -> String {
    //Создание словарей основных единиц
    let dic09 = ["1": "один", "2": "два", "3": "три", "4": "четыре", "5": "пять", "6": "шесть", "7": "семь", "8": "восемь", "9": "девять"]
    let dic1019 = ["10": "десять", "11": "одиннадцать", "12": "двенадцать", "13": "тринадцать", "14": "четырнадцать", "15": "пятнадцать", "16": "шестнадцать", "17": "семнадцать", "18": "восемнадцать", "19": "девятнадцать"]
    let dic2090 = ["20": "двадцать", "30": "тридцать", "40": "сорок", "50": "пятьдесят", "60": "шестьдесят", "70": "семьдесят", "80": "восемьдесят", "90": "девяносто"]
    let dic100900 = ["100": "сто", "200": "двести", "300": "триста", "400": "четыреста", "500": "пятьсот", "600": "шестьсот", "700": "семьсот", "800": "восемьсот", "900": "девятьсот"]
    //Преобразование входного параметра функции numbToStringExternal в строковый массив
    var arrayToSeparate = a.map{ String($0) }
    //Обьявление числового массива, для записи троек цифр: "1234567" -> [1, 234, 567]
    var separatedArray: [Int16] = []
    //Цикл разделения входного параметра на тройки цифр
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
    //Клоужер для нахождение названия числа: findNumb(12, dic1019) -> двенадцать
    let findNumb = { ( a: Int16, b: [String: String] ) -> String in
        b[String(a)] ?? ""
    }
    //Функция для фильтрации троек входных чисел из массива separatedArray: switchFunc(24) -> ("", "двадцать", "четыре")
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
    //Функция для вставки названия единиц
    func thousandWord(_ a: Int16) -> [String] {
        var result = ["тысяч", "миллионов", "миллиардов", "триллионов", "квадриллионов", "квинтиллионов", "секстиллионов", "септиллионов", "октиллионов", "нониллионов", "дециллионов", "ундециллионов", "додециллионов", "тредециллионов", "кваттуордециллионов", "квиндециллионов", "седециллионов", "септдециллионов", "октодециллионов", "новемдециллионов", "вигинтиллионов", "анвигинтиллионов", "дуовигинтиллионов", "тревигинтиллионов", "кватторвигинтиллионов", "квинвигинтиллионов", "сексвигинтиллионов", "септемвигинтиллионов", "октовигинтиллионов", "новемвигинтиллионов", "тригинтиллионов", "антригинтиллионов", "дуотригинтиллионов", "квадрагинтиллионов", "квинквагинтиллионов", "сексагинтиллионов", "септуагинтиллионов", "октогинтиллионов", "нонагинтиллионов", "центиллионов", "анцентиллионов", "дуоцентиллионов", "трецентиллионов", "кватторцентиллионов", "децицентиллионов", "ундецицентиллионов", "вигинтицентиллионов", "третригинтацентиллионов", "дуцентиллионов", "трицентиллионов", "квадрингентиллионов", "квингентиллионов", "сесцентиллионов", "септингентиллионов", "октингентиллионов", "нонгентиллионов", "миллиллионов", "дуомилиаллионов", "тремиллиаллионов", "кваттормиллиаллионов", "квинквемилиаллионов", "дуцентдуомилианонгентновемдециллионов", "милиамилиаиллионов", "дуомилиамилиаиллионов"]
        //Switch для коррекции падежа единиц
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
    //Функция для вставки в результирующий массив resultString названия чисел по тройкам
    func insertValues() {
        resultString.insert(switchFunc(separatedArray[separatedArray.count - 1]).2, at: 0)
        resultString.insert(switchFunc(separatedArray[separatedArray.count - 1]).1, at: 0)
        resultString.insert(switchFunc(separatedArray[separatedArray.count - 1]).0, at: 0)
    }
    //Обьявление результирующего массива строк
    var resultString: [String] = []
    //Обьявление результирующей строки вывода названия числа
    var result = ""
    //Вызов первой функции вставки чисел до 1000 исключительно
    insertValues()
    //Удаление тройки цифр или другими словами последнего параметра массива separatedArray
    separatedArray.removeLast()
    //Обьявление каунтер для контроля вставки названия единиц из функции thousandWord
    var k = 0
    //Цикл для вставки чисел больше 1000 включительно, в том числе вставки названия единиц
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
    //Условие для регулирования падежа тысяч (одна, две)
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
    //Удаление из результирующего массива пустых параметров + добавление пробелов между словами + преобразование массива в строку
    for i in 0..<resultString.count {
        guard resultString[i] == "" else {
            result += resultString[i]
            result += " "
            continue
        }
    }
    //Удаление последнего пробела из строки
    result.remove(at: result.index(result.endIndex, offsetBy: -1))
    //Возвращение итогового результата названия числа
    return result
}
//Обьявление итоговой строки для преобразования числа
var someString = "Привет! У меня есть 1022034 рубля."
//Создание массива для записи выделенных цифр из текста
var someArrayString: [String] = []
//Цикл для выделения цифр из текста и вставки в массив
for i in someString {
    if let x = Int(String(i)) {
        someArrayString.append(String(x))
    }
}
//Преобразование массива из текстовых цифр, в строку для передачи в основную функцию numbToStringExternal
var resString = ""
for i in someArrayString {
    resString += i
}
//Создание массива для замены цифр на ключевое слово
var secondString: [String] = []
//Цикл для удаления цифр из массива строк и заменой их ключевым словом
for i in someString {
    guard let _ = Int(String(i)) else {
        secondString.append(String(i))
        continue
    }
    if secondString.contains("MyOwnPointToInsertValueDontUseTHis!!!") {
        continue
    } else {
        secondString.append("MyOwnPointToInsertValueDontUseTHis!!!")
    }
}
//Замена ключевого слова на литературное название числа, посредством вызова основной функции numbToStringExternal
for i in 0..<secondString.count {
    if secondString[i] == "MyOwnPointToInsertValueDontUseTHis!!!" {
        secondString[i] = numbToStringExternal(resString)
    }
}
//Преобразование массива в строку
var endResult = ""
for i in 0..<secondString.count {
    endResult += secondString[i]
}
//Вывод результата
print(endResult)
