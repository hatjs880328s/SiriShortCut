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
        self.view.backgroundColor = UIColor.white
    }
    
    func setIntent(names:String,numbers: String) {
        self.view.backgroundColor = UIColor.white
        let name = UILabel()
        let number = UILabel()
        
        name.frame = CGRect(x: 10, y: 10, width: 250, height: 30)
        name.font = UIFont.systemFont(ofSize: 12)
        number.frame = CGRect(x: 10, y: 50, width: 250, height: 30)
        number.font = UIFont.systemFont(ofSize: 12)
        name.text = names
        number.text = numbers
        self.view.addSubview(name)
        self.view.addSubview(number)
    }
}
