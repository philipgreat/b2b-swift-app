//Domain B2B/Product/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct Product{


	var	id                  :	String?             
	var	displayName         :	String?             
	var	parentCat           :	LevelNCat?          
	var	brand               :	Brand?              
	var	origin              :	String?             
	var	remark              :	String?             
	var	version             :	Int?                
	
	
	var	skuList             :	[Sku]?              
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension Product: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		displayName         	<- map["displayName"]
		parentCat           	<- map["parentCat"]
		brand               	<- map["brand"]
		origin              	<- map["origin"]
		remark              	<- map["remark"]
		version             	<- map["version"]
		skuList             	<- map["skuList"]

	}
}


extension Product:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "product{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if displayName != nil {
			result += "\tdisplay_name='\(displayName!)'"
		}
		if parentCat != nil {
			result += "\tparent_cat='\(parentCat!)'"
		}
		if brand != nil {
			result += "\tbrand='\(brand!)'"
		}
		if origin != nil {
			result += "\torigin='\(origin!)'"
		}
		if remark != nil {
			result += "\tremark='\(remark!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


