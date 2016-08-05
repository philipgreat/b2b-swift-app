//Domain B2B/Order/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

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
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension Order: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		buyer               	<- map["buyer"]
		seller              	<- map["seller"]
		title               	<- map["title"]
		costCenter          	<- map["costCenter"]
		profitCenter        	<- map["profitCenter"]
		totalAmount         	<- map["totalAmount"]
		type                	<- map["type"]
		markAsDelete        	<- map["markAsDelete"]
		confirmation        	<- map["confirmation"]
		approval            	<- map["approval"]
		processing          	<- map["processing"]
		shipment            	<- map["shipment"]
		delivery            	<- map["delivery"]
		recurringInfo       	<- map["recurringInfo"]
		version             	<- map["version"]
		lineItemList        	<- map["lineItemList"]
		shippingGroupList   	<- map["shippingGroupList"]
		paymentGroupList    	<- map["paymentGroupList"]
		actionList          	<- map["actionList"]

	}
}


extension Order:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "order{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if buyer != nil {
			result += "\tbuyer='\(buyer!)'"
		}
		if seller != nil {
			result += "\tseller='\(seller!)'"
		}
		if title != nil {
			result += "\ttitle='\(title!)'"
		}
		if costCenter != nil {
			result += "\tcost_center='\(costCenter!)'"
		}
		if profitCenter != nil {
			result += "\tprofit_center='\(profitCenter!)'"
		}
		if totalAmount != nil {
			result += "\ttotal_amount='\(totalAmount!)'"
		}
		if type != nil {
			result += "\ttype='\(type!)'"
		}
		if markAsDelete != nil {
			result += "\tmark_as_delete='\(markAsDelete!)'"
		}
		if confirmation != nil {
			result += "\tconfirmation='\(confirmation!)'"
		}
		if approval != nil {
			result += "\tapproval='\(approval!)'"
		}
		if processing != nil {
			result += "\tprocessing='\(processing!)'"
		}
		if shipment != nil {
			result += "\tshipment='\(shipment!)'"
		}
		if delivery != nil {
			result += "\tdelivery='\(delivery!)'"
		}
		if recurringInfo != nil {
			result += "\trecurring_info='\(recurringInfo!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


