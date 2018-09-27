//
//  ViewController.swift
//  maidongxi
//
//  Created by Noah_Shan on 2018/9/27.
//  Copyright © 2018 Inspur. All rights reserved.
//

import UIKit
import IntentsUI
import Intents
import CoreSpotlight


/*
 https://blog.csdn.net/u013749108/article/details/80961560
 https://blog.csdn.net/u013749108/article/details/81413817
 
 */

class ViewController: UIViewController,INUIAddVoiceShortcutViewControllerDelegate {
    
    func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    let activity = NSUserActivity(activityType:"com.inspur.openapp")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SiriTest"
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        INPreferences.requestSiriAuthorization { (status) in
            switch status {
            case .notDetermined:
                print("用户尚未对该应用程序作出选择")
            case .restricted:
                print("此应用程序无权使用Siri服务")
            case .denied :
                print("用户已明确拒绝此应用程序的授权")
            case .authorized :
                print("用户可以使用此应用程序的授权")
            }
        }
        activity.title="购买东西"
        activity.userInfo = ["speech":"买东西"]
        activity.isEligibleForSearch=true
        activity.isEligibleForPrediction = true
        let attribute = CSSearchableItemAttributeSet()
        attribute.contentDescription = "想什么呢？"
        activity.contentAttributeSet = attribute
        view.userActivity = activity
        activity.becomeCurrent()
        
        let btn = UIButton()
        btn.backgroundColor = UIColor.yellow
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 35)
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(self.addvoice), for: UIControl.Event.touchUpInside)
    }
    
    @objc func addvoice() {
        let short = INShortcut(userActivity: self.activity)
        let con = INUIAddVoiceShortcutViewController(shortcut: short)
        con.delegate = self
        self.present(con, animated: true, completion: nil)
    }
    
    public func sayHi() {
        let alert = UIAlertController(title:"买买买!", message:"Hey there! 买东西买东西买东西!", preferredStyle:UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title:"OK", style:UIAlertAction.Style.default, handler:nil))
        self.present(alert, animated:true, completion:nil)
    }
}

