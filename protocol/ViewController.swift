//
//  ViewController.swift
//  protocol
//
//  Created by Anand tellabati on 04/09/16.
//  Copyright © 2016 Anand tellabati. All rights reserved.
//

import UIKit

class ViewController: UIViewController,dipayMessage {

    @IBOutlet weak var displayLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Protocol"
        
     navigationController?.navigationBar.tintColor = UIColor.whiteColor()
     navigationController?.navigationBar.barTintColor = UIColor.grayColor()
    }
    
    func displayMessage(info: String) {
        print(info)
        displayLabel.text! = info
         self.navigationItem.title = info
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "SeguID" {
            if let fullUserDetails:SecondView = segue.destinationViewController as? SecondView {
                 fullUserDetails.delegate = self
        }
    }
    
    }

}

