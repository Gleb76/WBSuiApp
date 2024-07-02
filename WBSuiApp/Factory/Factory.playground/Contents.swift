//Напишите программу, которая моделирует фабрику по производству строительных материалов. Опишите в программе два класса: Человек (ФИО, возраст, паспорт), Паспорт (Серия, Номер, дата выдачи, Человек) и инициализируйте их. Создавайте класс Person и Passport + инициализируйте их, потом деинициализируйте чтобы проверить, что все ок. Из памяти они уходят и так далее
import Foundation

class Person {
    let fullName: String
    var age: Int
    var pasport: Passport?
    
    init(fullName: String, age: Int) {
        self.fullName = fullName
        self.age = age
    }
    
    deinit {
        print("\(fullName) is being deinitialized")
    }
}

class Passport {
    let seria: String
    let number: String
    let dateOfIssue: String
    weak var person: Person?
    
    init(seria: String, number: String, dateOfIssue: String) {
        self.seria = seria
        self.number = number
        self.dateOfIssue = dateOfIssue
    }
    
    deinit {
        print("Passport \(seria) \(number) is being deinitialized")
    }
}


class Factory {
    
    var employees: [Person] = []
    
    func addEmployee(fullName:String, age: Int,  seria: String, number: String, dateOfIssue: String) {
        let newEmployee = Person(fullName: fullName, age: age)
        let newPassport = Passport(seria: seria, number: number, dateOfIssue: dateOfIssue)
        newEmployee.pasport = newPassport
        newPassport.person = newEmployee
        employees.append(newEmployee)
    }
    func removeEmployee(fullName: String) {
        if let index = employees.firstIndex(where: { $0.fullName == fullName }) {
            employees.remove(at: index)
        }
    }
    
    deinit {
        print("Factory is being deinitialized")
    }
}

var factory: Factory? = Factory()

factory?.addEmployee(fullName: "Gleb Klyha", age: 21, seria: "PPO", number: "1212", dateOfIssue: "02.04.2023")
factory?.addEmployee(fullName: "Anna Ivanova", age: 30, seria: "ABC", number: "3456", dateOfIssue: "15.03.2021")

factory?.removeEmployee(fullName: "Gleb Klyha")

factory = nil
