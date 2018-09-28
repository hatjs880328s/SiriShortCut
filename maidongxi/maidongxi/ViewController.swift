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
 https://developer.apple.com/videos/play/wwdc2018/211/   19:51
 
 注意：
 对于extention=module如果需要引入第三方oc库也需要创建一个bridge文件，并引入
 如果需要使用之前创建的swift文件，则需要在他的compile选项下面选择
 
 Response 的 code 如果是系统自动创建的，会和 interaction.intentHandlingStatus 相互对应。
 但如果是自定义的状态，他们的 intentHandlingStatus 都对应着 INIntentHandlingStatusSuccess。
 
 
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
        attribute.contentDescription = "你可以说：买地瓜"
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
        let intent = TestIntent()
        intent.number = 4
        let inaction = INInteraction(intent: intent, response: nil)
        inaction.donate { (error) in
            print(error)
        }
        let short = INShortcut(intent: intent)
        let con = INUIAddVoiceShortcutViewController(shortcut: short!)
        con.delegate = self
        self.present(con, animated: true, completion: nil)
    }
    
    public func sayHi() {
        let alert = UIAlertController(title:"买买买!", message:"Hey there! 买东西买东西买东西!", preferredStyle:UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title:"OK", style:UIAlertAction.Style.default, handler:nil))
        self.present(alert, animated:true, completion:nil)
    }
}

