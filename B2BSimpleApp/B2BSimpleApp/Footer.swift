//Domain B2B/Footer/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct Footer{


	var	id                  :	String?             
	var	page                :	HomePage?           
	var	image               :	String?             
	var	action              :	String?             
	var	version             :	Int?                
	
	
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension Footer: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		page                	<- map["page"]
		image               	<- map["image"]
		action              	<- map["action"]
		version             	<- map["version"]

	}
}


extension Footer:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "footer{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if page != nil {
			result += "\tpage='\(page!)'"
		}
		if image != nil {
			result += "\timage='\(image!)'"
		}
		if action != nil {
			result += "\taction='\(action!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


