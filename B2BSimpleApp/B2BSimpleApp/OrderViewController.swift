//
//  ViewController.swift
//  B2BSimpleApp
//
//  Created by 张喜来 on 8/5/16.
//  Copyright © 2016 张喜来. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    
    
    var tableView:UITableView?
    var order:Order?
    
    var refreshControl: UIRefreshControl!
    
    
    internal func addTable()
    {
        
        
        
        
       
        
        
        
        tableView = OrderView(frame: UIScreen.mainScreen().bounds, style: UITableViewStyle.Plain)
        tableView!.delegate      =   self
        tableView!.dataSource    =   self
        
        
        
        self.view.addSubview(self.tableView!)
        
        refreshControl = UIRefreshControl()
        
        refreshControl.backgroundColor = UIColor.redColor()
        refreshControl.tintColor = UIColor.yellowColor()
        
        refreshControl.addTarget(self, action: #selector(OrderViewController.handleRefresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        
        tableView!.addSubview(refreshControl)
        
        
    }
    func handleRefresh(refreshControl: UIRefreshControl) {
        // Do some reloading of data and update the table view's data source
        // Fetch more objects from a web service, for example...
        
        // Simply adding an object to the data source for this example
        reloadData()
    }
    
    override func viewDidLoad() {
        
        NSLog("View did load.")

        super.viewDidLoad()
        
         view.backgroundColor = .yellowColor()
        
        addTable()
        
        reloadData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func reloadData(){
        let orderRemoteManagerImpl = OrderRemoteManagerImpl()
        
        orderRemoteManagerImpl.loadOrderDetail("O000003", orderSuccessAction: orderOK, orderErrorAction: orderError)
        

    }
    func orderOK(order:Order)->String{
        //Create a table view and add as sub view of current
        
        //self.view.addSubview(<#T##view: UIView##UIView#>)
        order.index()
        self.order = order
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            //must be  in UI thread to load the data, otherwise, some time not working before click some cell
            
            self.refreshControl.attributedTitle = NSAttributedString(string: "Success!")
            self.tableView?.reloadData()
            self.refreshControl.endRefreshing()
        })

        
        NSLog(order.description)
        
        return order.description
    }
    func orderError(message:String) -> String{
        
        //message
        NSLog("There are error here: %@", message)
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            //must be  in UI thread to load the data, otherwise, some time not working before click some cell
            //self.tableView?.hidden = true
            
            self.refreshControl.attributedTitle = NSAttributedString(string: message)
            self.refreshControl.endRefreshing()
        })
        
        
        return message
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func log(message:String)
    {
        if true {
            NSLog(message)
            
        }
        
    }

}
/*
 
 
 Section #1 basic info
 
 Section #2~N, one to one relations
 
 Section #N+1 the first list
 
 Section #N+2, actions
 
 struct Order{
 
 
	var	id                  :	String?
	var	buyer               :	BuyerCompany?
	var	seller              :	SellerCompany?
	var	title               :	String?
	var	costCenter          :	CostCenter?
	var	profitCenter        :	ProfitCenter?
	var	totalAmount         :	Double?
	var	type                :	String?
	var	markAsDelete        :	Bool?
	var	confirmation        :	Confirmation?
	var	approval            :	Approval?
	var	processing          :	Processing?
	var	shipment            :	Shipment?
	var	delivery            :	Delivery?
	var	recurringInfo       :	RecurringInfo?
	var	version             :	Int?
	
	
	var	lineItemList        :	[LineItem]?
	var	shippingGroupList   :	[ShippingGroup]?
	var	paymentGroupList    :	[PaymentGroup]?
	var	actionList          :	[Action]?
 
 class CellView{
 var	object: AnyObject?
 var cellType: String?
 
 }
 
 class Section{
 var	sectionList        :	[CellView]?
 
 }
 class TableInfo{
 
 var	sectionList        :	[Section]?
 
 func addSection( section:Section){
 
 if sectionList == nil{
 sectionList = [Section]()
 }
 
 
 
 }
 
 }

 
 */
//This class arranges sections and cells into a reasonable format



extension OrderViewController:UITableViewDataSource,UITableViewDelegate{
    
    
    
    
    func numberOfSectionsInTableView(_tableView: UITableView) -> Int{
        
        
        log("numberOfSectionsInTableView called")
        
        //NSLog( "calling: %s", __PRETTY_FUNCTION__ );
        
        if order == nil {
            return 0;
        }
        
        return (order?.sections)!
        
    }
    
    func tableView( tableView: UITableView,
                    numberOfRowsInSection section: Int) -> Int{
        
        if order == nil {
            return 0;
        }
        
        log("tableView( tableView: UITableView,numberOfRowsInSection section: Int) -> Int called")
        
        return (order?.rowCount(forSection: section))!
        
        
        
    }
    
    func tableView(_tableView: UITableView,
                   sectionForSectionIndexTitle title: String,
                                               atIndex index: Int) -> Int
    {
        if order == nil {
            return 0;
        }
        
        log("tableView(_tableView: UITableView,sectionForSectionIndexTitle title: String,atIndex index: Int) ")
        
        return 1;
        
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        return order?.elementsToShow()[section]
        
        //return "Title - \(section)"
    }
    
    func tableView(_tableView: UITableView,
                   estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        
        
        log("tableView(_tableView: UITableView,estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) ")
        
        
        return 94;
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return (order?.rowHeight(forSection: indexPath.section, forRow: indexPath.row))!
    }
    
    func tableView(_tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        
       
        let dataType = order?.elementsToShow()[indexPath.section]
        
        print("data type: \(dataType!)")
        
        let cell = tableView!.dequeueReusableCellWithIdentifier("\(dataType!)",forIndexPath: indexPath) as! UpdatableCell
        
        
        if order == nil {
            return cell //just empty cell when null
        }
        
        
        let obj = order?.dataForRow(forSection: indexPath.section, forRow: indexPath.row)

        //print("data : \(obj!)")
        
        
        cell.updateWithData(obj)
        
        
       
        
        
                
        
        //print("cell text\(cell.dynamicLabel.text)")
        //cell?.textLabel = "love is blue"
        return cell;
        
        
    }
    
    
    /*
     
     func tableView(_tableView: UITableView,
     cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
     
     
     
     
     let cell = tableView!.dequeueReusableCellWithIdentifier("lineItemCell",forIndexPath: indexPath) as! LineItemCell
     
     
     if order == nil {
     return cell //just empty cell when null
     }
     
     log("current sec \(indexPath.section) and current row\(indexPath.row)")
     //cell.dynamicLabel.text = "hello\(indexPath.row)-\(indexPath.section)"
     if indexPath.section < order?.lineItemList?.count {
     let lineItem = order!.lineItemList![indexPath.section]
     cell.idLabel.text = "\(lineItem.skuId!) "
     cell.nameLabel.text = lineItem.skuName!
     cell.qtyLabel.text = "qty: \(lineItem.quantity!)"
     
     //cell.dynamicLabel.text = "hello\(indexPath.row)-\(indexPath.section)"
     
     
     }else{
     
     //cell.dynamicLabel.text = "hello\(indexPath.row)-\(indexPath.section)"
     }
     
     
     //print("cell text\(cell.dynamicLabel.text)")
     //cell?.textLabel = "love is blue"
     return cell;
     
     
     }
     
     
     
     */
    
    
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        print("selected\(indexPath.row)-\(indexPath.section)")
        
        /*
        let detailController = DetailViewController();
        detailController.title = "Item Detail"
        self.navigationController?.pushViewController(detailController, animated: true)
        */
        
    }
}

