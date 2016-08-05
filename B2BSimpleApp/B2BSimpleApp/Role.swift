//Domain B2B/Role/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct Role{


	var	id                  :	String?             
	var	roleName            :	String?             
	var	version             :	Int?                
	
	
	var	accessList          :	[Access]?           
	var	custSvcRepList      :	[CustSvcRep]?       
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension Role: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		roleName            	<- map["roleName"]
		version             	<- map["version"]
		accessList          	<- map["accessList"]
		custSvcRepList      	<- map["custSvcRepList"]

	}
}


extension Role:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "role{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if roleName != nil {
			result += "\trole_name='\(roleName!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


