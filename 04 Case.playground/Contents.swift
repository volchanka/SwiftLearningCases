//: Playground - noun: a place where people can play

//1. Объявить протокол Food, который будет иметь проперти name (только чтение) и метод taste(), который будет выводить текст со вкусовыми ощущениями

protocol Food {
    var name: String { get }
    func taste()
}

protocol Storable : Food{
    var expired : Bool { get }
}

//
//2. Все продукты разных типов, которые вы принесли из супермаркета, находятся в сумке (массив) и все, как ни странно, реализуют протокол Food. Вам нужно пройтись по сумке, назвать предмет и откусить кусочек. Можете отсортировать продукты до имени. Используйте для этого отдельную функцию, которая принимает массив продуктов

class Potato : Food {
    var name: String = "Potato"
    func taste() {
        print("Potato taste")
    }
    
}

class Tomato : Food {
    var name: String = "Tomato"
    func taste() {
        print("Tomato taste")
    }
}

class Apple : Food {
    var name: String = "Apple"
    func taste() {
        print("Apple taste")
    }
}

class Cheese : Storable {
    var name: String = "Cheese"
    var expired: Bool = true
    func taste() {
        print("Cheese taste")
    }
}

class Milk : Storable {
    var name: String = "Milk"
    var expired: Bool = false
    func taste() {
        print("Milk taste")
    }
}

class SoySauce: Food {
    var name: String = "Soy sauce"
    func taste() {
        print("Soy sauce taste")
    }
}

let food1 = Potato()
let food2 = Tomato()
let food3 = Apple()
let food4 = Cheese()
let food5 = Milk()
let food6 = SoySauce()


let bag: [AnyObject] = [food1, food2, food3, food4, food5, food6]

//func taste1(food: Array<Food>){
//    for item in food {
//        item.taste()
//    }
//}

func taste(sourceArray: Array<Any>){
    for item in sourceArray {
        if let food  = item as? Food {
            food.taste()
        }
    }
}

//taste(food: bag as! Array<Food>)
print("Let's taste it!")
taste(sourceArray: bag)

//
//3. Некоторые продукты могут испортиться, если их не положить в холодильник. Создайте новый протокол Storable, он наследуется от протокола Food и содержит еще булевую проперти - expired. У некоторых продуктов замените Food на Storable. Теперь пройдитесь по всем продуктам и, если продукт надо хранить в холодильнике, то перенесите его туда, но только если продукт не испорчен уже, иначе просто избавьтесь от него. Используйте функцию для вывода продуктов для вывода содержимого холодильника

func sortExpiredFood (bag: Array<Any>){
    var fridge = [Storable]()
    var freshBag = [Food]()
    for item in bag {
        if let food = item as? Storable {
            if !food.expired { freshBag.append(food) }
        }
    }
    for item in freshBag {
        if let food = item as? Storable{
            fridge.append(food)
        }
    }
    print("Fridge contains tastes: ")
    taste(sourceArray: fridge)
}

sortExpiredFood(bag: bag)
//
//4. Добавьте проперти daysToExpire в протокол Storable. Отсортируйте массив продуктов в холодильнике. Сначала пусть идут те, кто быстрее портятся. Если срок совпадает, то сортируйте по имени.
//
//5. Не все, что мы кладем в холодильник, является едой. Поэтому сделайте так, чтобы Storable не наследовался от Food. Мы по прежнему приносим еду домой, но некоторые продукты реализуют теперь 2 протокола. Холодильник принимает только те продукты, которые еще и Storable. функция сортировки должна по прежнему работать.
