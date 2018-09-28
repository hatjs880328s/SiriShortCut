//
//  IntentProgressCenter.swift
//  maidongxi
//
//  Created by Noah_Shan on 2018/9/27.
//  Copyright © 2018 Inspur. All rights reserved.
//

import Foundation
import UIKit

class IntentProgressCenter: NSObject {
    override init() {
        super.init()
    }
    
    func alertSomething() {
        let alert = UIAlertController(title:"买买买!", message:"Hey there! maigechuitou?!", preferredStyle:UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title:"OK", style:UIAlertAction.Style.default, handler:nil))
        //self.present(alert, animated:true, completion:nil)
        if let con = (UIApplication.shared.keyWindow?.rootViewController as? UIViewController) {
            con.present(alert, animated: true, completion: nil)
        }
    }
}
