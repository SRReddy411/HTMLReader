//
//  ViewController.swift
//  HtmlReader
//
//  Created by volive solutions on 26/07/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var descLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        convertHTMLToString()
        
        let myURLString = "https://google.com"
        guard let myURL = URL(string: myURLString) else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            return
        }
        
        do {
            let myHTMLString = try String(contentsOf: myURL, encoding: .ascii)
            print("HTML : \(myHTMLString)")
        } catch let error {
            print("Error: \(error)")
        }
        
        let indexPath = Bundle.main.path(forResource: "index", ofType: "html", inDirectory: "/")
        if let indexPath = indexPath
        {
            do
            {
                let htmlContent = try String(contentsOfFile: indexPath, encoding: String.Encoding.utf8)
                
                let base = Bundle.main.resourceURL
                // self.webView.loadHTMLString(htmlContent, baseURL: base)
                
            }
            catch let err as NSError
            {
                print(err.debugDescription)
            }
        }
//        // Do any additional setup after loading the view, typically from a nib.
//        Alamofire.request("http://www.vehiclebuzzzz.com/index.php/JsonController/vehicledtls?veh_id=23&veh_category=car").responseJSON{response in
//
//            let request = response.result
//            if let json = request.value as? NSDictionary
//            {
//                //print(json)
//                let dict = json["server_vehicledtlsresponse"] as! NSDictionary
//                self.resposeArray = dict["veh_dtls"] as! NSArray
//                for i in 0..<self.resposeArray.count{
//                    print("count value\(i)")
//                    let imgString = (self.resposeArray[i] as! NSDictionary)["image_path"] as! String
//
//                    self.imagesArray  = imgString.components(separatedBy: "$$$") as [Any] as NSArray
//                    print( self.imagesArray.count)
//
//                    print("images array count : \(self.imagesArray.count)")
//
//                }
//                print("response of data :\(self.resposeArray)")
//                self.tableView.reloadData()
//            }
//        }
        //        guard
        //            let file = Bundle.main.path(forResource: "agreement", ofType: "html"),
        //            let html = try? String(contentsOfFile: file, encoding: String.Encoding.utf8)
        //            else {
        //                return
        //        }
        //        webView.loadHTMLString(html, baseURL: nil)
        
    }
    
    @IBAction func showAlertBtn_Action(_ sender: Any) {
        
        self.showToast(message:  "RamiReddy")
        
    }
    func convertHTMLToString( ) {
        Shared.sharedInstance.alertToUser(message: "Hi", inViewCtrl: self)
        
        
        descLbl.attributedText = "<!DOCTYPE html><html><body><h1>This is heading 1 for ios team in swift4 html to data reading processs</h1><h2>This is heading 2</h2><h3>This is heading 3</h3><h4>This is heading 4</h4><h5>This is heading 5</h5><h6>This is heading 6</h6></body></html>".convertHtml()
    }
    
    
    
}

extension String{
    
    func convertHtml() -> NSAttributedString{
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do{
            
            return try NSAttributedString(data: data, options:  [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
                ], documentAttributes: nil)
        }catch{
            return NSAttributedString()
        }
    }
}
