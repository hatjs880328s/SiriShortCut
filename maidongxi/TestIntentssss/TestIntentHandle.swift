//
//  TestIntentHandle.swift
//  TestIntentssss
//
//  Created by Noah_Shan on 2018/9/27.
//  Copyright © 2018 Inspur. All rights reserved.
//

import Foundation


class TestIntentHandle: NSObject,TestIntentHandling {
    func handle(intent: TestIntent, completion: @escaping (TestIntentResponse) -> Void) {
        let response = TestIntentResponse(code: TestIntentResponseCode.success, userActivity: nil)
        completion(response)
    }
    
    
    func confirm(intent: TestIntent, completion: @escaping (TestIntentResponse) -> Void) {
        let response = TestIntentResponse(code: TestIntentResponseCode.ready, userActivity: nil)
        completion(response)
    }
    
}
