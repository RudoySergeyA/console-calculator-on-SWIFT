print("Добро пожаловать в консольный калькулятор S W I F T !")

while true {
    
    if let firstNum = getDoubleInput("Введи первое число:"),
       let character = getOperationInput(),
       let secondNum = getDoubleInput("Введи второе число:"),
       let characterOperation = characterOperation(character){
        
        let result: Double?
        
        switch character {
        case "1":
            result = firstNum + secondNum
        case "2":
            result = firstNum - secondNum
        case "3":
            result = firstNum * secondNum
        case  "4":
            result = (!secondNum.isZero) ? firstNum / secondNum : nil
        default:
            result = nil
        }
        
        if let result = result {
            print(">>>>>>>>\nИдет вычисление:\n\(firstNum) \(characterOperation) \(secondNum) = \(result)\n----------------\nРезультат: \(result)\n<<<")
        } else {
            print(">>>>>>>>\nОшибка: на 0 делить нельзя!\n<<<<<<<<")
        }
    } else {
        print("Ошибка ввода!")
    }
    
    print("Хотите продолжить? Если да, введи 'y'")
    if let continueInput = readLine(), continueInput.lowercased() != "у" && continueInput.lowercased() != "y" {
        break
    }
    
}


func getDoubleInput (_ description: String)-> Double? {
    print(description)
    if let input = readLine(), let value = Double(input) {
        return value
    } else {
        return nil
    }
}

func getOperationInput() -> Character? {
    
    let operations = """
=====================
Введи номер операции:
1. Сложение
2. Вычитание
3. Умножение
4. Деление
=====================
"""
    
    print(operations)
    
    if let character = readLine()?.first(where: { $0 == "1" || $0 == "2" || $0 == "3" || $0 == "4"}) {
        return character
    }
    return nil
}

func characterOperation(_ getOperationInput: Character?)-> String? {
    switch getOperationInput {
    case "1": return "+"
    case "2": return "-"
    case "3": return "x"
    case "4": return ":"
    default: return nil
    }
}
