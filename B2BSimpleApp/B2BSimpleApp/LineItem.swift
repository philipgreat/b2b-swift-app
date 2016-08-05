//Domain B2B/LineItem/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct LineItem{


	var	id                  :	String?             
	var	bizOrder            :	Order?              
	var	skuId               :	String?             
	var	skuName             :	String?             
	var	amount              :	Double?             
	var	quantity            :	Int?                
	var	active              :	Bool?               
	var	version             :	Int?                
	
	
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension LineItem: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		bizOrder            	<- map["bizOrder"]
		skuId               	<- map["skuId"]
		skuName             	<- map["skuName"]
		amount              	<- map["amount"]
		quantity            	<- map["quantity"]
		active              	<- map["active"]
		version             	<- map["version"]

	}
}


extension LineItem:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "line_item{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if bizOrder != nil {
			result += "\tbiz_order='\(bizOrder!)'"
		}
		if skuId != nil {
			result += "\tsku_id='\(skuId!)'"
		}
		if skuName != nil {
			result += "\tsku_name='\(skuName!)'"
		}
		if amount != nil {
			result += "\tamount='\(amount!)'"
		}
		if quantity != nil {
			result += "\tquantity='\(quantity!)'"
		}
		if active != nil {
			result += "\tactive='\(active!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


