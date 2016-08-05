//Domain B2B/Employee/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct Employee{


	var	id                  :	String?             
	var	name                :	String?             
	var	company             :	BuyerCompany?       
	var	email               :	String?             
	var	passwd              :	String?             
	var	cellPhone           :	String?             
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

extension Employee: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		name                	<- map["name"]
		company             	<- map["company"]
		email               	<- map["email"]
		passwd              	<- map["passwd"]
		cellPhone           	<- map["cellPhone"]
		version             	<- map["version"]
		assignmentList      	<- map["assignmentList"]

	}
}


extension Employee:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "employee{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if name != nil {
			result += "\tname='\(name!)'"
		}
		if company != nil {
			result += "\tcompany='\(company!)'"
		}
		if email != nil {
			result += "\temail='\(email!)'"
		}
		if passwd != nil {
			result += "\tpasswd='\(passwd!)'"
		}
		if cellPhone != nil {
			result += "\tcell_phone='\(cellPhone!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


