//
//  DITest.swift
//  TDDLearningDemo
//
//  Created by 沈海超 on 2021/6/28.
//

import UIKit


protocol Pet {
    func eat(foodName: String)
}
class Dog: Pet {
    func eat(foodName: String) {
        print("吃\(foodName)")
    }
}
class Person {
    let pet: Pet
    let foodName: String

    init(pet: Pet, foodName: String) {
        self.pet = pet
        self.foodName = foodName
    }
    
    func feed(){
        pet.eat(foodName: foodName)
    }
}

class MockPet: Pet {
    var wasFeed = false
    func eat(foodName: String) {
        wasFeed = true
    }
}
