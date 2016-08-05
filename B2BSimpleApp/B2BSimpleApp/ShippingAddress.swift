//Domain B2B/ShippingAddress/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct ShippingAddress{


	var	id                  :	String?             
	var	line1               :	String?             
	var	line2               :	String?             
	var	city                :	String?             
	var	state               :	String?             
	var	country             :	String?             
	var	version             :	Int?                
	
	
	var	shippingGroupList   :	[ShippingGroup]?    
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension ShippingAddress: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		line1               	<- map["line1"]
		line2               	<- map["line2"]
		city                	<- map["city"]
		state               	<- map["state"]
		country             	<- map["country"]
		version             	<- map["version"]
		shippingGroupList   	<- map["shippingGroupList"]

	}
}


extension ShippingAddress:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "shipping_address{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if line1 != nil {
			result += "\tline1='\(line1!)'"
		}
		if line2 != nil {
			result += "\tline2='\(line2!)'"
		}
		if city != nil {
			result += "\tcity='\(city!)'"
		}
		if state != nil {
			result += "\tstate='\(state!)'"
		}
		if country != nil {
			result += "\tcountry='\(country!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


