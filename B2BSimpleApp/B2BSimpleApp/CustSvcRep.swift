//Domain B2B/CustSvcRep/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct CustSvcRep{


	var	id                  :	String?             
	var	email               :	String?             
	var	passwd              :	String?             
	var	role                :	Role?               
	var	company             :	SellerCompany?      
	var	version             :	Int?                
	
	
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension CustSvcRep: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		email               	<- map["email"]
		passwd              	<- map["passwd"]
		role                	<- map["role"]
		company             	<- map["company"]
		version             	<- map["version"]

	}
}


extension CustSvcRep:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "cust_svc_rep{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if email != nil {
			result += "\temail='\(email!)'"
		}
		if passwd != nil {
			result += "\tpasswd='\(passwd!)'"
		}
		if role != nil {
			result += "\trole='\(role!)'"
		}
		if company != nil {
			result += "\tcompany='\(company!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


