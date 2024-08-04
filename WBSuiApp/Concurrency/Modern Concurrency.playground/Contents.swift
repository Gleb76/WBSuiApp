import Foundation
//Создайте распределенную систему обработки данных, в которой несколько устройств могут совместно обрабатывать большие объемы данных в реальном времени. Система должна:  Поддерживать подключение нескольких клиентов. Асинхронно распределять задачи между клиентами. Синхронизировать результаты обработки между клиентами. Обеспечивать корректную обработку ошибок и восстановление после сбоев.

// Решил разобрать Проблему обедающих философов
//В этой задаче пять философов сидят за круглым столом, и каждый из них может либо думать, либо есть. Между каждым философом лежит одна вилка, и философы должны использовать две вилки (соседние) для еды. Проблема заключается в том, чтобы избежать взаимоблокировки, когда все философы берут одну вилку и ждут другой.


actor Fork {
    private var isTaken: Bool = false
    
    func pickUp() async -> Bool {
        if !isTaken {
            isTaken = true
            return true
        }
        return false
    }
    
    func putDown() {
        isTaken = false
    }
}

actor Philosopher {
    private let id: Int
    private let leftFork: Fork
    private let rightFork: Fork
    
    init(id: Int, leftFork: Fork, rightFork: Fork) {
        self.id = id
        self.leftFork = leftFork
        self.rightFork = rightFork
    }
    
    func dine() async {
        while true {
            print("Philosopher \(id) is thinking.")
            try? await Task.sleep(nanoseconds: UInt64.random(in: 1_000_000_000...2_000_000_000))
            await pickUpForks()
            print("Philosopher \(id) is eating.")
            try? await Task.sleep(nanoseconds: UInt64.random(in: 1_000_000_000...2_000_000_000))
            await putDownForks()
        }
    }
    
    private func pickUpForks() async {
        while true {
            if await leftFork.pickUp() {
                if await rightFork.pickUp() {
                    return
                } else {
                    await leftFork.putDown()
                }
            }
            try? await Task.sleep(nanoseconds: 500_000_000)
        }
    }
    
    private func putDownForks() async {
        await leftFork.putDown()
        await rightFork.putDown()
    }
}

let forks = (0..<5).map { _ in Fork() }

let philosophers = (0..<5).map { i in
    Philosopher(id: i, leftFork: forks[i], rightFork: forks[(i + 1) % 5])
}

let tasks = philosophers.map { philosopher in
    Task {
        await philosopher.dine()
    }
}

Thread.sleep(forTimeInterval: 10)
