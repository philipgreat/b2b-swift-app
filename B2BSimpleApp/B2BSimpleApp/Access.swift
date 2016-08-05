//Domain B2B/Access/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct Access{


	var	id                  :	String?             
	var	roleName            :	String?             
	var	role                :	Role?               
	var	version             :	Int?                
	
	
	var	assignmentList      :	[Assignment]?       
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension Access: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		roleName            	<- map["roleName"]
		role                	<- map["role"]
		version             	<- map["version"]
		assignmentList      	<- map["assignmentList"]

	}
}


extension Access:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "access{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if roleName != nil {
			result += "\trole_name='\(roleName!)'"
		}
		if role != nil {
			result += "\trole='\(role!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


