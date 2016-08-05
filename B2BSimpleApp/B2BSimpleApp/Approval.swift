//Domain B2B/Approval/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct Approval{


	var	id                  :	String?             
	var	who                 :	String?             
	var	approveTime         :	NSDate?             
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

extension Approval: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		who                 	<- map["who"]
		approveTime         	<- map["approveTime"]
		version             	<- map["version"]
		orderList           	<- map["orderList"]

	}
}


extension Approval:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "approval{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if who != nil {
			result += "\twho='\(who!)'"
		}
		if approveTime != nil {
			result += "\tapprove_time='\(approveTime!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


