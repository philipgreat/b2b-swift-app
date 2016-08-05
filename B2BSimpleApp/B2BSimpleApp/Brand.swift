//Domain B2B/Brand/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct Brand{


	var	id                  :	String?             
	var	brandName           :	String?             
	var	logo                :	String?             
	var	remark              :	String?             
	var	version             :	Int?                
	
	
	var	productList         :	[Product]?          
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension Brand: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		brandName           	<- map["brandName"]
		logo                	<- map["logo"]
		remark              	<- map["remark"]
		version             	<- map["version"]
		productList         	<- map["productList"]

	}
}


extension Brand:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "brand{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if brandName != nil {
			result += "\tbrand_name='\(brandName!)'"
		}
		if logo != nil {
			result += "\tlogo='\(logo!)'"
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




