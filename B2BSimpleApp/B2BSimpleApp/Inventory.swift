//Domain B2B/Inventory/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct Inventory{


	var	id                  :	String?             
	var	sku                 :	Sku?                
	var	warehouse           :	Warehouse?          
	var	stockLevel          :	Int?                
	var	preorderable        :	Int?                
	var	backorderable       :	Int?                
	var	version             :	Int?                
	
	
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension Inventory: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		sku                 	<- map["sku"]
		warehouse           	<- map["warehouse"]
		stockLevel          	<- map["stockLevel"]
		preorderable        	<- map["preorderable"]
		backorderable       	<- map["backorderable"]
		version             	<- map["version"]

	}
}


extension Inventory:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "inventory{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if sku != nil {
			result += "\tsku='\(sku!)'"
		}
		if warehouse != nil {
			result += "\twarehouse='\(warehouse!)'"
		}
		if stockLevel != nil {
			result += "\tstock_level='\(stockLevel!)'"
		}
		if preorderable != nil {
			result += "\tpreorderable='\(preorderable!)'"
		}
		if backorderable != nil {
			result += "\tbackorderable='\(backorderable!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


