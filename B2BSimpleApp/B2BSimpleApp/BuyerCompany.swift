//Domain B2B/BuyerCompany/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct BuyerCompany{


	var	id                  :	String?             
	var	name                :	String?             
	var	priceList           :	String?             
	var	rating              :	Int?                
	var	logo                :	String?             
	var	owner               :	String?             
	var	founded             :	NSDate?             
	var	version             :	Int?                
	
	
	var	costCenterList      :	[CostCenter]?       
	var	creditAccountList   :	[CreditAccount]?    
	var	billingAddressList  :	[BillingAddress]?   
	var	employeeList        :	[Employee]?         
	var	orderList           :	[Order]?            
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension BuyerCompany: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		name                	<- map["name"]
		priceList           	<- map["priceList"]
		rating              	<- map["rating"]
		logo                	<- map["logo"]
		owner               	<- map["owner"]
		founded             	<- map["founded"]
		version             	<- map["version"]
		costCenterList      	<- map["costCenterList"]
		creditAccountList   	<- map["creditAccountList"]
		billingAddressList  	<- map["billingAddressList"]
		employeeList        	<- map["employeeList"]
		orderList           	<- map["orderList"]

	}
}


extension BuyerCompany:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "buyer_company{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if name != nil {
			result += "\tname='\(name!)'"
		}
		if priceList != nil {
			result += "\tprice_list='\(priceList!)'"
		}
		if rating != nil {
			result += "\trating='\(rating!)'"
		}
		if logo != nil {
			result += "\tlogo='\(logo!)'"
		}
		if owner != nil {
			result += "\towner='\(owner!)'"
		}
		if founded != nil {
			result += "\tfounded='\(founded!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


