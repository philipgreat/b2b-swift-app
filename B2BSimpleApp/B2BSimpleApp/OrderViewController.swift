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
        view.backgroundColor = .yellowColor()
        
        
        
        tableView = UITableView(frame: UIScreen.mainScreen().bounds, style: UITableViewStyle.Plain)
        tableView!.delegate      =   self
        tableView!.dataSource    =   self
        tableView!.registerClass(LineItemCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView!)
        
        refreshControl = UIRefreshControl()
        
        refreshControl.backgroundColor = UIColor.redColor()
        refreshControl.tintColor = UIColor.yellowColor()
        
        refreshControl.addTarget(self, action: #selector(OrderViewController.handleRefresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        
        tableView?.addSubview(refreshControl)
        
        
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
        
        addTable()
        reloadData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func reloadData(){
        let orderRemoteManagerImpl = OrderRemoteManagerImpl()
        
        orderRemoteManagerImpl.loadOrderDetail("O000001", orderSuccessAction: orderOK, orderErrorAction: orderError)
        

    }
    func orderOK(order:Order)->String{
        //Create a table view and add as sub view of current
        
        //self.view.addSubview(<#T##view: UIView##UIView#>)
        
        self.order = order
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            //must be  in UI thread to load the data, otherwise, some time not working before click some cell
            self.tableView?.reloadData()
            self.refreshControl.endRefreshing()
        })

        
        NSLog(order.description)
        
        return order.description
    }
    func orderError(message:String) -> String{
        
        //message
    
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

extension OrderViewController:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSectionsInTableView(_tableView: UITableView) -> Int{
        
        
        log("numberOfSectionsInTableView called")
        
        //NSLog( "calling: %s", __PRETTY_FUNCTION__ );
        
        if order == nil {
            return 0;
        }
        
        return (order?.lineItemList?.count)!
        
    }
    
    func tableView( tableView: UITableView,
                    numberOfRowsInSection section: Int) -> Int{
        
        log("tableView( tableView: UITableView,numberOfRowsInSection section: Int) -> Int called")
        
        return section+4
    }
    
    func tableView(_tableView: UITableView,
                   sectionForSectionIndexTitle title: String,
                                               atIndex index: Int) -> Int
    {
        
        log("tableView(_tableView: UITableView,sectionForSectionIndexTitle title: String,atIndex index: Int) ")
        
        return 1;
        
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Title - \(section)"
    }
    
    func tableView(_tableView: UITableView,
                   estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        
        
        log("tableView(_tableView: UITableView,estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) ")
        
        
        return 94;
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 94
    }
    
    func tableView(_tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView!.dequeueReusableCellWithIdentifier("cell",forIndexPath: indexPath) as! LineItemCell
        
        
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
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        print("selected\(indexPath.row)-\(indexPath.section)")
        
        /*
        let detailController = DetailViewController();
        detailController.title = "Item Detail"
        self.navigationController?.pushViewController(detailController, animated: true)
        */
        
    }
}

