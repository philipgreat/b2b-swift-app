//Domain B2B/FixRiceSkuPromotion/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct FixRiceSkuPromotion{


	var	id                  :	String?             
	var	sku                 :	Sku?                
	var	rules               :	String?             
	var	priceTo             :	Double?             
	var	version             :	Int?                
	
	
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension FixRiceSkuPromotion: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		sku                 	<- map["sku"]
		rules               	<- map["rules"]
		priceTo             	<- map["priceTo"]
		version             	<- map["version"]

	}
}


extension FixRiceSkuPromotion:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "fix_rice_sku_promotion{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if sku != nil {
			result += "\tsku='\(sku!)'"
		}
		if rules != nil {
			result += "\trules='\(rules!)'"
		}
		if priceTo != nil {
			result += "\tprice_to='\(priceTo!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


