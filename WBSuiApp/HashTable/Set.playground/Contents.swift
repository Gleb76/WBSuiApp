//3. Set:
//Создайте множество (set) из целых чисел.
//Добавьте несколько элементов в это множество.
//Удалите один элемент.
//Проверьте, существует ли определенный элемент в множестве.
//Примените операции объединения, пересечения и разности на множествах

import Foundation

// Инициализация множества set
var set: Set = [1, 2, 3, 4, 5, 6, 7, 8, 9]

// Добавление нескольких элементов в множество
set.insert(20)
set.insert(21)
set.insert(22)
set.insert(23)

// Удаление одного элемента из множества
set.remove(1)

// Проверка, существует ли определенный элемент в множестве
let isElementPresent = set.contains(1)
print("Элемент 1 присутствует в множестве: \(isElementPresent)")

// Пример set целых чисел
let exampleSet: Set = [12, 13, 4, 15, 6, 17, 18]

// Применение операции объединения
set.formUnion(exampleSet)
print("После объединения: \(set)")

// Применение операции пересечения
set.formIntersection(exampleSet)
print("После пересечения: \(set)")

// Применение операции симметрической разности
let symmetricDifferenceSet = set.symmetricDifference(exampleSet)
print("После симметрической разности: \(symmetricDifferenceSet)")

// Применение операции разности
let differenceSet = set.subtracting(exampleSet)
print("После разности: \(differenceSet)")

// Сравнение множеств
let anotherSet: Set = [3, 4, 5, 6, 7]
print("Множества равны: \(set == anotherSet)")
print("anotherSet является подмножеством set: \(anotherSet.isSubset(of: set))")
print("set является надмножеством anotherSet: \(set.isSuperset(of: anotherSet))")
