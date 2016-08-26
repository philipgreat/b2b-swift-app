//
//  LineItemCell.swift
//  PureCodeUI
//
//  Created by 张喜来 on 7/16/16.
//  Copyright © 2016 张喜来. All rights reserved.
//

import UIKit

import Alamofire


class SimpleCache{

    
    static let sharedCache: NSCache = {
        let cache = NSCache()
        cache.name = "SimpleImageCache"
        cache.countLimit = 20 // Max 20 images in memory.
        cache.totalCostLimit = 10*1024*1024 // Max 10MB used.
        return cache
    }()
    
    
    static let queuedRequstCache: NSCache = {
        let cache = NSCache()
        cache.name = "QueuedRequest"
        cache.countLimit = 20 // Max 20 images in memory.
        cache.totalCostLimit = 10*1024*1024 // Max 10MB used.
        return cache
    }()



}


extension UIImageView {
    
    
    
    public func imageFromUrl(urlString: String) {
        
        //if the image is in cache, then use sychronized method to fetch the image
        
        if let image = SimpleCache.sharedCache.objectForKey(urlString) as? UIImage {
        
            self.image = image //This may not in the main thread
            
            NSLog("get Image from the cache for %@",urlString)
            return
        
        }
        //The image is not in the cache but the request has been sent to the server.....
        //Or the request has been sent, and the server says there is an issue to request the image .....
        //How to handle in Swift???????????????
        /*
         
         
         http://stackoverflow.com/questions/24045895/what-is-the-swift-equivalent-to-objective-cs-synchronized
         
         let lockQueue = dispatch_queue_create("com.test.LockQueue", nil)
         dispatch_sync(lockQueue) {
         // code
         }
         
         
         reference https://developer.apple.com/library/ios/documentation/Performance/Reference/GCD_libdispatch_Ref/ for more details
         
         
         */
        
        
        Alamofire.request(.GET, urlString).response { (request, response, data, error) in
            
            let webImage = UIImage(data: data!, scale:1)
            SimpleCache.sharedCache.setObject(webImage!, forKey: urlString, cost: (data?.length)!)
            
            
            dispatch_async(dispatch_get_main_queue()) {
                self.image = webImage
            }
            
            
            NSLog("downloaded from URL %@",urlString)
            
            
        }
    }
}


class UpdatableCell: UITableViewCell{

    func updateWithData(object: Any){
        
        
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        //idLabel.frame = CGRectMake(50, 150, 200, 21)

    }
    
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}


class LineItemListCell: UpdatableCell{
    
    
    
    
    var  idLabel : UILabel!
    var  thumbImage: UIImageView!
    
    var  nameLabel : UILabel!
    
    var  qtyLabel : UILabel!
    var  amountLabel : UILabel!
    
    
    
    
    
    override func updateWithData(object: Any)
    {
        guard let lineItem = object as? LineItem else{
        
            NSLog("Error when trying to convert to a LineItem instance")
            
            return
        }
        
        idLabel.text = lineItem.id!
        nameLabel.text = lineItem.skuName!
        qtyLabel.text = "QTY: \(lineItem.quantity!)"
        amountLabel.text = "AMT: \(lineItem.amount!)"
        
        thumbImage.imageFromUrl("http://img13.360buyimg.com/n1/s450x450_jfs/t2302/16/135479564/94882/c76da045/55f0e877N3c24faa3.jpg")
        
    }
    
    
    
    func log(message:String)
    {
        //if true {return}
        NSLog(message)
        
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        //With code, this method will be called
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        thumbImage = UIImageView(frame: CGRectMake(10, 10, 90, 90))
        
        addSubview(thumbImage)
        
        idLabel = UILabel(frame: CGRectMake(100, 10, 120, 40))
        idLabel!.textColor = UIColor.brownColor()
        
        //idLabel.add
       
        //idLabel!.font = //set font here
        
        addSubview(idLabel)
        
        
        nameLabel = UILabel(frame: CGRectMake(200, 10, 120, 40))
        nameLabel!.textColor = UIColor.redColor()
        
        addSubview(nameLabel)
        
        
        qtyLabel = UILabel(frame: CGRectMake(330, 10, 60, 40))
        qtyLabel!.textColor = UIColor.brownColor()
        
        
        //idLabel!.font = //set font here
        
        addSubview(qtyLabel)
        
        
        amountLabel = UILabel(frame: CGRectMake(100, 50, 100, 40))
        amountLabel!.textColor = UIColor.brownColor()
        
        
        //idLabel!.font = //set font here
        
        addSubview(amountLabel)
        
        
        
        //log("method called")
    }
    


}


/*
 
 {
 "amount": 0.72,
 "id": "SG000004",
 "name": "shipping to this address4903",
 "version": 1
 }
 
 
 */

class ShippingGroupListCell: UpdatableCell {
    
    
    
    
    var  idLabel : UILabel!
    var  thumbImage: UIImage!
    
    var  nameLabel : UILabel!
    
    var  qtyLabel : UILabel!
    var  amountLabel : UILabel!
    
    
    
    func log(message:String)
    {
        //if true {return}
        NSLog(message)
        
    }
    
    
    override func updateWithData(object: Any)
    {
        guard let shippingGroup = object as? ShippingGroup else{
            
            NSLog("Error when trying to convert to a ShippingGroup instance")
            
            return
        }
        
        idLabel.text = shippingGroup.id!
        nameLabel.text = shippingGroup.name!
        amountLabel.text = "AMT: \(shippingGroup.amount!)"
       
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        //With code, this method will be called
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        idLabel = UILabel(frame: CGRectMake(10, 10, 120, 40))
        idLabel!.textColor = UIColor.brownColor()
        
        //idLabel.add
        
        //idLabel!.font = //set font here
        
        addSubview(idLabel)
        
        
        nameLabel = UILabel(frame: CGRectMake(100, 10, 120, 40))
        nameLabel!.textColor = UIColor.redColor()
        
        addSubview(nameLabel)
        
        
        qtyLabel = UILabel(frame: CGRectMake(230, 10, 60, 40))
        qtyLabel!.textColor = UIColor.brownColor()
        
        
        //idLabel!.font = //set font here
        
        addSubview(qtyLabel)
        
        amountLabel = UILabel(frame: CGRectMake(10, 50, 100, 40))
        amountLabel!.textColor = UIColor.brownColor()
        
        
        //idLabel!.font = //set font here
        
        addSubview(amountLabel)
        
        //log("method called")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        //idLabel.frame = CGRectMake(50, 150, 200, 21)
        
        
        
        
    }
    
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

/*
 
 {
 "cardNumber": "4111 1111 1111 - 4935",
 "id": "PG000008",
 "name": "visa card ending - 4934",
 "version": 1
 }
 
 
 */

class PaymentGroupListCell: UpdatableCell {
    
    
    
    
    var  idLabel : UILabel!
    var  thumbImage: UIImage!
    
    var  nameLabel : UILabel!
    
    var  cardNumberLabel : UILabel!
    var  amountLabel : UILabel!
    
    
    
    func log(message:String)
    {
        //if true {return}
        NSLog(message)
        
    }
    
    
    override func updateWithData(object: Any)
    {
        guard let paymentGroup = object as? PaymentGroup else{
            
            NSLog("Error when trying to convert to a ShippingGroup instance")
            
            return
        }
        
        idLabel.text = paymentGroup.id!
        nameLabel.text = paymentGroup.name!
        cardNumberLabel.text = paymentGroup.cardNumber
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        //With code, this method will be called
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        idLabel = UILabel(frame: CGRectMake(10, 10, 120, 40))
        idLabel!.textColor = UIColor.brownColor()
        
        //idLabel.add
        
        //idLabel!.font = //set font here
        
        addSubview(idLabel)
        
        
        nameLabel = UILabel(frame: CGRectMake(100, 10, 120, 40))
        nameLabel!.textColor = UIColor.redColor()
        
        addSubview(nameLabel)
        
        
        cardNumberLabel = UILabel(frame: CGRectMake(10, 50, 260, 40))
        cardNumberLabel!.textColor = UIColor.brownColor()
        
        
        //idLabel!.font = //set font here
        
        addSubview(cardNumberLabel)
        
        
        
        //log("method called")
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        //idLabel.frame = CGRectMake(50, 150, 200, 21)
        
        
        
        
    }
    
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}




class OrderCell: UpdatableCell {
    
    
    
    
    var  idLabel : UILabel!
    var  thumbImage: UIImage!
    
    var  titleLabel : UILabel!
    
    var  qtyLabel : UILabel!
    var  amountLabel : UILabel!
    
    
    
    func log(message:String)
    {
        //if true {return}
        NSLog(message)
        
    }
    
    override func updateWithData(object: Any)
    {
        guard let order = object as? Order else{
            
            NSLog("Error when trying to convert to a ShippingGroup instance")
            
            return
        }
        
        idLabel.text = order.id!
        titleLabel.text=order.title!
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        //With code, this method will be called
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        self.backgroundColor = UIColor.redColor()
        
        idLabel = UILabel(frame: CGRectMake(10, 10, 120, 40))
        idLabel!.textColor = UIColor.whiteColor()
        
        //idLabel.add
        
        //idLabel!.font = //set font here
        
        addSubview(idLabel)
        
        
        titleLabel = UILabel(frame: CGRectMake(100, 10, 220, 40))
        titleLabel!.textColor = UIColor.whiteColor()
        
        addSubview(titleLabel)
        
        
        qtyLabel = UILabel(frame: CGRectMake(230, 10, 60, 40))
        qtyLabel!.textColor = UIColor.brownColor()
        
        
        //idLabel!.font = //set font here
        
        addSubview(qtyLabel)
        
        amountLabel = UILabel(frame: CGRectMake(10, 50, 100, 40))
        amountLabel!.textColor = UIColor.brownColor()
        
        
        //idLabel!.font = //set font here
        
        addSubview(amountLabel)

        
        //log("method called")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        //idLabel.frame = CGRectMake(50, 150, 200, 21)
        
        
        
        
    }
    
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


