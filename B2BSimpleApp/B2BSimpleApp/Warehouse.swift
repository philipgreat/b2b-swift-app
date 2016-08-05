//Domain B2B/Warehouse/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct Warehouse{


	var	id                  :	String?             
	var	displayName         :	String?             
	var	location            :	String?             
	var	owner               :	String?             
	var	version             :	Int?                
	
	
	var	inventoryList       :	[Inventory]?        
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension Warehouse: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		displayName         	<- map["displayName"]
		location            	<- map["location"]
		owner               	<- map["owner"]
		version             	<- map["version"]
		inventoryList       	<- map["inventoryList"]

	}
}


extension Warehouse:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "warehouse{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if displayName != nil {
			result += "\tdisplay_name='\(displayName!)'"
		}
		if location != nil {
			result += "\tlocation='\(location!)'"
		}
		if owner != nil {
			result += "\towner='\(owner!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


