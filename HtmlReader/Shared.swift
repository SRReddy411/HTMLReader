//
//  Shared.swift
//  HtmlReader
//
//  Created by volive solutions on 26/07/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

import UIKit

class Shared: NSObject {
    
    static let sharedInstance = Shared()
    
    
    func alertToUser( message: String, inViewCtrl:UIViewController) -> ()
    {
        let alert = UIAlertController(title: "Alert",
                                      message: message,
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "OK",
                                         style: .cancel, handler: nil)
        
        alert.view.tintColor = UIColor.lightGray
        alert.addAction(cancelAction)
        inViewCtrl.present(alert, animated: true, completion: nil)
        
    }
}
extension UIViewController {
    
    func showToast(message : String) {
        
        let message = message
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        self.present(alert, animated: true)
        
        // duration in seconds
        let duration: Double = 2
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
            alert.dismiss(animated: true)
        }
    }
}
