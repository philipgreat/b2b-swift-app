//Domain B2B/Shipment/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct Shipment{


	var	id                  :	String?             
	var	who                 :	String?             
	var	shipTime            :	NSDate?             
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

extension Shipment: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		who                 	<- map["who"]
		shipTime            	<- map["shipTime"]
		version             	<- map["version"]
		orderList           	<- map["orderList"]

	}
}


extension Shipment:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "shipment{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if who != nil {
			result += "\twho='\(who!)'"
		}
		if shipTime != nil {
			result += "\tship_time='\(shipTime!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


