import Foundation

class Account {
    let owner: String
    var balance: Double
    
    init(owner: String, balance: Double) {
        self.owner = owner
        self.balance = balance
    }
    
    func deposit(amount: Double) {
        self.balance += amount
    }
    
    func withdraw(amount: Double) {
        self.balance -= amount
    }
}

class Bank {
    private var accounts: [Account] = []
    
    func createAccount(owner: String, initialBalance: Double) {
        let newAccount = Account(owner: owner, balance: initialBalance)
        accounts.append(newAccount)
    }
    
    func transfer(from: Int, to: Int, amount: Double) {
        guard accounts.indices.contains(from) && accounts.indices.contains(to) else {
            return
        }
        
        let fromAccount = accounts[from]
        let toAccount = accounts[to]
        
        fromAccount.withdraw(amount: amount)
        toAccount.deposit(amount: amount)
    }
    
    func depositToAccount(index: Int, amount: Double) {
        guard accounts.indices.contains(index) else {
            return
        }
        accounts[index].deposit(amount: amount)
    }
    
    func withdrawFromAccount(index: Int, amount: Double) {
        guard accounts.indices.contains(index) else {
            return
        }
        accounts[index].withdraw(amount: amount)
    }
    
    func printAccountDetails() {
        for (index, account) in accounts.enumerated() {
            print("Account \(index + 1): Owner - \(account.owner), Balance - \(account.balance)")
        }
    }
}

let bank = Bank()

bank.createAccount(owner: "Gleb", initialBalance: 1000.0)
bank.createAccount(owner: "Nikitka", initialBalance: 500.0)
bank.createAccount(owner: "Anton", initialBalance: 750.0)

print("Accounts before operations:")
bank.printAccountDetails()

bank.transfer(from: 0, to: 1, amount: 200.0)
bank.depositToAccount(index: 0, amount: 300.0)

print("\nAccounts after operations:")
bank.printAccountDetails()
