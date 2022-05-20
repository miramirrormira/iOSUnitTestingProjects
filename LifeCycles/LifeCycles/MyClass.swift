//
//  MyClass.swift
//  LifeCycles
//
//  Created by Mira Yang on 5/19/22.
//

import Foundation

class MyClass {
    
    private static var allInstances = 0
    private let instance: Int
    
    init() {
        MyClass.allInstances += 1
        instance = MyClass.allInstances
        print(">> MyClass.init() #\(instance)")
    }
    
    deinit {
        print(">> MyClass.deinit #\(instance)")
    }
    
    func methodOne(){
        print(">> methodOne")
        
    }
    
    func methodTwo(){
        print(">> methodTwo")
    }
    
    private func methodThree(){
        print(">> methodThree")
    }
    
}
