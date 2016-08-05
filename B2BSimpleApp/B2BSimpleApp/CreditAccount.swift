//Domain B2B/CreditAccount/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct CreditAccount{


	var	id                  :	String?             
	var	name                :	String?             
	var	buyer               :	BuyerCompany?       
	var	seller              :	SellerCompany?      
	var	authorized          :	Double?             
	var	remain              :	Double?             
	var	version             :	Int?                
	
	
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension CreditAccount: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		name                	<- map["name"]
		buyer               	<- map["buyer"]
		seller              	<- map["seller"]
		authorized          	<- map["authorized"]
		remain              	<- map["remain"]
		version             	<- map["version"]

	}
}


extension CreditAccount:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "credit_account{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if name != nil {
			result += "\tname='\(name!)'"
		}
		if buyer != nil {
			result += "\tbuyer='\(buyer!)'"
		}
		if seller != nil {
			result += "\tseller='\(seller!)'"
		}
		if authorized != nil {
			result += "\tauthorized='\(authorized!)'"
		}
		if remain != nil {
			result += "\tremain='\(remain!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


