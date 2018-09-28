//
//  IntentViewController.swift
//  TestIntentssssUI
//
//  Created by Noah_Shan on 2018/9/27.
//  Copyright © 2018 Inspur. All rights reserved.
//

import IntentsUI

// As an example, this extension's Info.plist has been configured to handle interactions for INSendMessageIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Send a message using <myApp>"

class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    let name = UILabel()
    let number = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Prepare your view controller for the interaction to handle.
    func configureView(for parameters: Set<INParameter>, of interaction: INInteraction, interactiveBehavior: INUIInteractiveBehavior, context: INUIHostedViewContext, completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
        if interaction.intentHandlingStatus == .success {
            let viewController = ConfirmViewController()
            viewController.setIntent(color: UIColor.purple)
            attachChild(viewController)
            completion(true, parameters, desiredSize)
        }
        if interaction.intentHandlingStatus == .ready {
            let viewController = ConfirmViewController()
            viewController.setIntent(color: UIColor.yellow)
            attachChild(viewController)
            completion(true, parameters, desiredSize)
        }
        completion(true, parameters, self.desiredSize)
    }
    
    var desiredSize: CGSize {
        //return self.extensionContext!.hostedViewMaximumAllowedSize
        return CGSize(width: 320, height: 170)
    }
    
    private func attachChild(_ viewController: UIViewController) {
        addChild(viewController)
        
        if let subview = viewController.view {
            view.addSubview(subview)
            subview.translatesAutoresizingMaskIntoConstraints = false
            
            // Set the child controller's view to be the exact same size as the parent controller's view.
            subview.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            subview.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
            
            subview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            subview.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
        
        viewController.didMove(toParent: self)
    }
    
}
