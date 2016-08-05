//Domain B2B/CostCenter/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct CostCenter{


	var	id                  :	String?             
	var	name                :	String?             
	var	belongsTo           :	BuyerCompany?       
	var	password            :	String?             
	var	version             :	Int?                
	
	
	var	orderList           :	[Order]?            
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension CostCenter: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		name                	<- map["name"]
		belongsTo           	<- map["belongsTo"]
		password            	<- map["password"]
		version             	<- map["version"]
		orderList           	<- map["orderList"]

	}
}


extension CostCenter:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "cost_center{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if name != nil {
			result += "\tname='\(name!)'"
		}
		if belongsTo != nil {
			result += "\tbelongs_to='\(belongsTo!)'"
		}
		if password != nil {
			result += "\tpassword='\(password!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


