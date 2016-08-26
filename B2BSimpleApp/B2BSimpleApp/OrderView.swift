//
//  OrderView.swift
//  B2BSimpleApp
//
//  Created by 张喜来 on 8/6/16.
//  Copyright © 2016 张喜来. All rights reserved.
//

//  This is the OrderView for rendering an order
/*
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
 */

import UIKit



class OrderView: UITableView {
    
    
    //Id and the first text field
    //This is the unified section to define the constants use in this class
    enum sections : String {
        case
        order = "order",
        lineItemList = "lineItemList",
        shippingGroupList = "shippingGroupList",
        paymentGroupList="paymengGroupList"
        
        //static let allSections = [order, lineItemList, shippingGroupList,paymentGroupList]
        static let allSectionNames = [order.rawValue, lineItemList.rawValue,shippingGroupList.rawValue,paymentGroupList.rawValue]
    }
    
    var order: Order!
    
    
    
    func index() -> [String:Any]{
        
        var result = [String:Any]();
        
        result[sections.order.rawValue] = order
        result[sections.lineItemList.rawValue] = order.lineItemList
        result[sections.shippingGroupList.rawValue] = order.shippingGroupList
        result[sections.paymentGroupList.rawValue] = order.paymentGroupList
        
        return result
        
    }
    
    func elementsToShow() -> [String]{
        let shownElements = sections.allSectionNames
        //you can change the override and change the order to show the order object.
        return shownElements
        
    }
    
    var sections: Int{
        
        return elementsToShow().count
        
    }
    
    func rowCount(forSection section:Int) ->Int{
        
        let key = elementsToShow()[section]
        let obj = index()[key]
        
        
        //There should a way to find out if the object is an array, current implementation is a little stupid
        if let anyArray = obj as? [LineItem]? {
            return anyArray!.count
        }
        
        if let anyArray = obj as? [ShippingGroup]? {
            return anyArray!.count
        }
        
        if let anyArray = obj as? [PaymentGroup]? {
            
            return anyArray!.count
        }
        
        return 1
        
        
    }
    
    
    
    func dataForRow(forSection section: Int, forRow row: Int) ->Any{
        let key = elementsToShow()[section]
        
        let obj = index()[key]
        
        if let anyArray = obj as? [LineItem]? {
            return anyArray![row]
        }
        
        if let anyArray = obj as? [ShippingGroup]? {
            
            return anyArray![row]
        }
        
        if let anyArray = obj as? [PaymentGroup]? {
            
            return anyArray![row]
        }
        
        
        return obj
        
    }
    
    
    func rowHeight(forSection section:Int, forRow row:Int) -> CGFloat {
        
        if section == 0 {
            return 140 //order basic
        }
        if section == 1 {
            return 100 //line item list count
        }
        if section == 2 {
            return 100 //line item list count
        }
        if section == 3 {
            return 100 //line item list count
        }
        
        return 0
        
        
    }
    
    
    
    
    override init(frame: CGRect, style: UITableViewStyle){
        
        super.init(frame: frame, style: style)
        registerTableCells()
        
        
    }
    
    func setOrder(newOrder:Order){
        
        self.order = newOrder
        
    }
    
    /*
     Register all the related cells to the class, can be used for later
     
     */
    internal func registerTableCells(){
    
        self.registerClass(OrderCell.self, forCellReuseIdentifier: sections.order.rawValue)
        self.registerClass(LineItemListCell.self, forCellReuseIdentifier: sections.lineItemList.rawValue)
        self.registerClass(ShippingGroupListCell.self, forCellReuseIdentifier: sections.shippingGroupList.rawValue)
        self.registerClass(PaymentGroupListCell.self, forCellReuseIdentifier: sections.paymentGroupList.rawValue)
        
    
    }
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
