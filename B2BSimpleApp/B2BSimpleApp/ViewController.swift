//
//  ViewController.swift
//  B2BSimpleApp
//
//  Created by 张喜来 on 8/5/16.
//  Copyright © 2016 张喜来. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        
        NSLog("View did load.")
        
        
        let or = OrderRemoteManagerImpl()
        
        or.loadOrderDetail("O000001", orderSuccessAction: orderOK, orderErrorAction: orderError)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func orderOK(order:Order)->String{
        
        
        NSLog(order.description)
        
        return order.description
    }
    func orderError(message:String) -> String{
    
        return message
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

