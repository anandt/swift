//
//  SecondView.swift
//  protocol
//
//  Created by Anand tellabati on 04/09/16.
//  Copyright © 2016 Anand tellabati. All rights reserved.
//

import UIKit
protocol dipayMessage {
    func displayMessage(info:String)
}


class SecondView: UIViewController {
    

    var delegate:dipayMessage? = nil
 
    
    @IBOutlet weak var tetxfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "second View"
    }
    
    @IBAction func dissmiseSecondView(sender: AnyObject) {
        
        if (delegate != nil){
            delegate?.displayMessage(tetxfield.text!)
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
    }
}
