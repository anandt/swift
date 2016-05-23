//
//  ViewController.swift
//  DataType
//
//  Created by others on 23/05/16.
//  Copyright © 2016 Quadratics Software systems Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayText: UILabel!
    var sample:Int=20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(sample)
        displayText.text=String(sample)
        
        let list = ["Car", "Bike", "Plane", "Boat"]
        
        for (index, element) in list.enumerate() {
            print(index, ":", element)
        }
        
        var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
        print( "Value of key = 1 is \(someDict)" )
        
        var oldVal = someDict[1]
        someDict[1] = "New value of one"
        var someVar = someDict[1]
        print( "Old value of key = 1 is \(oldVal)" )
    }
}

