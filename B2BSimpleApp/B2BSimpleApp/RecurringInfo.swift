//Domain B2B/RecurringInfo/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct RecurringInfo{


	var	id                  :	String?             
	var	name                :	String?             
	var	nextTime            :	NSDate?             
	var	cronExpr            :	String?             
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

extension RecurringInfo: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		name                	<- map["name"]
		nextTime            	<- map["nextTime"]
		cronExpr            	<- map["cronExpr"]
		version             	<- map["version"]
		orderList           	<- map["orderList"]

	}
}


extension RecurringInfo:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "recurring_info{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if name != nil {
			result += "\tname='\(name!)'"
		}
		if nextTime != nil {
			result += "\tnext_time='\(nextTime!)'"
		}
		if cronExpr != nil {
			result += "\tcron_expr='\(cronExpr!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


