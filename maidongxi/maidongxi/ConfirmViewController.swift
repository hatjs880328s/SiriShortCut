//
//  ConfirmViewController.swift
//  maidongxi
//
//  Created by Noah_Shan on 2018/9/28.
//  Copyright © 2018 Inspur. All rights reserved.
//

import UIKit

import UIKit
import Intents
//import TestIntent

class ConfirmViewController: UIViewController {
    
    //var intents: TestIntent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
    }
    
    func setIntent(color: UIColor) {
//        if intent.st
        self.view.backgroundColor = color
        let name = UILabel()
        let number = UILabel()
        
        name.frame = CGRect(x: 10, y: 10, width: 120, height: 30)
        number.frame = CGRect(x: 10, y: 50, width: 120, height: 30)
        name.text = "siri宛如智障"
        number.text = "是的"
        self.view.addSubview(name)
        self.view.addSubview(number)
    }
}
