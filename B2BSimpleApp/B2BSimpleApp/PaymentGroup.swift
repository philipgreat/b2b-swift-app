//Domain B2B/PaymentGroup/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct PaymentGroup{


	var	id                  :	String?             
	var	name                :	String?             
	var	bizOrder            :	Order?              
	var	cardNumber          :	String?             
	var	billingAddress      :	BillingAddress?     
	var	version             :	Int?                
	
	
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension PaymentGroup: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		name                	<- map["name"]
		bizOrder            	<- map["bizOrder"]
		cardNumber          	<- map["cardNumber"]
		billingAddress      	<- map["billingAddress"]
		version             	<- map["version"]

	}
}


extension PaymentGroup:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "payment_group{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if name != nil {
			result += "\tname='\(name!)'"
		}
		if bizOrder != nil {
			result += "\tbiz_order='\(bizOrder!)'"
		}
		if cardNumber != nil {
			result += "\tcard_number='\(cardNumber!)'"
		}
		if billingAddress != nil {
			result += "\tbilling_address='\(billingAddress!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


