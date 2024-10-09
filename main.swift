import Glibc
print("Добро пожаловать в консольный калькулятор S W I F T !")

var history: [String] = []

showActions()

func calculate () {
    
    guard let character = getOperationInput(),
          let firstNum = getDoubleInput("Введи первое число:"),
          let secondNum = getDoubleInput("Введи второе число:"),
          let characterOperation = characterOperation(character) else {
        return
    }
    
    let result: Double?
    
    switch character {
    case "1":
        result = firstNum + secondNum
    case "2":
        result = firstNum - secondNum
    case "3":
        result = firstNum * secondNum
    case "4" where secondNum == 0.0 :
        print(">>> Ошибка: на 0 делить нельзя!"); return
    case "4":
        result = firstNum / secondNum
    default:
        result = nil
    }
    
    guard let result else {
        print("Ошибка: результат не определён."); return
    }
    
    let printResult = "\(firstNum) \(characterOperation) \(secondNum) = \(result)"
    
    print("")
    print(printResult)
    print("----------------------------------------------------------------->>>>")
    history.append(printResult)
}


func getDoubleInput (_ description: String)-> Double? {
    print(description)
    guard let input = readLine(), let value = Double(input) else {
        print("Ошибка ввода числового значения!")
        return nil
    }
    return value
}

func getOperationInput() -> Character? {
    while true {
        
        let operations = """
        
Что вы хотите сделать? :
1. Сложение
2. Вычитание
3. Умножение
4. Деление

"""
        
        print(operations)
        
        guard let character = readLine()?.first(where: { $0 == "1" || $0 == "2" || $0 == "3" || $0 == "4"}) else {
            print("Ошибка: Введите корректный номер команды.")
            continue
        }
        return character
    }
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

func showHistory (_ history: [String]) {
    if history.isEmpty {
        print("История пока что отсутствует...")
        return
    }
    
    print("История вычислений:")
    for item in history {
        print(item)
    }
}

func showActions () {
    
    while true {
        
        let actions = """
        
Что вы хотите сделать? :
1. Воспользоваться калькулятором
2. Показать историю
3. Выйти из программы

"""
        print(actions)
        
        guard let character = readLine()?.first(where: {$0 == "1" || $0 == "2" || $0 == "3"}) else {
            print("Ошибка: Введите корректный номер команды.")
            continue
        }
        
        switch character {
        case "1": calculate()
        case "2": showHistory(history)
        case "3": exit(0)
        default:
            continue
        }
    }
}
