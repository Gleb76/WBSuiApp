
//Цель: закрепить полученные знания о хешировании, Dictionary, Set, Linked List
//1. Напишите функцию на Swift, которая принимает строку и возвращает её хеш, используя встроенную функцию hash().
//2. Придумайте и реализуйте собственную простую хеш-функцию для строк.

//Отправка результатов:
//
//Создайте отдельный файл Swift для каждого задания.
//Комментируйте код, чтобы объяснить вашу логику.
//Отправьте все файлы на проверку через GitHub в формате Pull Request
import Foundation

func getHash(string: String) -> Int {
    return string.hash
}

let checkHashValue = getHash(string: "Gleb")
print(checkHashValue)

// Создаем свою HashFunction и пользуемся 4-ымя советами:
//1. Использует всю информацию, предоставленную ключом.
//2. Равномерно распределяет выходные значения по таблице.
//3. Преобразует похожие ключи в сильно отличающиеся хеш-значения.
//4. Использует только быстрые операции.

func customHashFunction(_ string: String) -> Int {
    // Используемое большое простое число для модификации значений
    let prime = 31
    let mod = 1_000_000_007 // Большое простое число для уменьшения вероятности коллизий

    // Переменная для хранения значения хеша
    var hashValue = 0
    
    // Итерация по символам строки
    for character in string.utf8 {
        // Сдвигаем текущее значение хеша влево (умножаем на prime) и добавляем значение символа
        hashValue = (hashValue * prime + Int(character)) % mod
    }
    
    // Возвращаем полученное хеш-значение
    return hashValue
}

// Примеры использования:
let hash1 = customHashFunction("example")
let hash2 = customHashFunction("test")
let hash3 = customHashFunction("example")

print("Hash of 'example': \(hash1)")
print("Hash of 'test': \(hash2)")
print("Hash of 'example!': \(hash3)")
// От колизии не убежал :(



// Просто тренировка и изучение:

func naiveHash(_ string: String) -> Int {
  let unicodeScalars = string.unicodeScalars.map { Int($0.value) }
  return unicodeScalars.reduce(0, +)
}
naiveHash("abc") // outputs 294
naiveHash("bca") // also outputs 294
// демонстрация коммутативности и возникновения коллизий

// Уберем колизии с помощью SipHash
func djb2Hash(_ string: String) -> Int {
  let unicodeScalars = string.unicodeScalars.map { $0.value }
  return unicodeScalars.reduce(5381) {
    ($0 << 5) &+ $0 &+ Int($1)
  }
}

djb2Hash("abc") // outputs 193485963
djb2Hash("bca") // outputs 193487083
djb2Hash("firstName") % 2 // outputs 0
djb2Hash("lastName") % 2 // outputs 0


public struct HashTable<Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = [Element]
    private var buckets: [Bucket]
    
    private(set) public var count = 0
    public var isEmpty: Bool {
        return count == 0
    }
    
    public init(capacity: Int) {
        assert(capacity > 0)
        buckets = Array<Bucket>(repeating: [], count: capacity)
    }
    
    private func index(for key: Key) -> Int {
        return abs(key.hashValue) % buckets.count
    }
    
    public subscript(key: Key) -> Value? {
        get {
            return value(for: key)
        }
        set {
            if let newValue = newValue {
                insert(value: newValue, for: key)
            } else {
                remove(for: key)
            }
        }
    }
    
    public func value(for key: Key) -> Value? {
        let index = self.index(for: key)
        return buckets[index].first { $0.key == key }?.value
    }
    
    private mutating func insert(value: Value, for key: Key) {
        let index = self.index(for: key)
        if let i = buckets[index].firstIndex(where: { $0.key == key }) {
            buckets[index][i].value = value
        } else {
            buckets[index].append((key: key, value: value))
            count += 1
        }
    }
    
    private mutating func remove(for key: Key) {
        let index = self.index(for: key)
        if let i = buckets[index].firstIndex(where: { $0.key == key }) {
            buckets[index].remove(at: i)
            count -= 1
        }
    }
}
