//Domain B2B/ShippingGroup/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct ShippingGroup{


	var	id                  :	String?             
	var	name                :	String?             
	var	bizOrder            :	Order?              
	var	address             :	ShippingAddress?    
	var	amount              :	Double?             
	var	version             :	Int?                
	
	
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension ShippingGroup: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		name                	<- map["name"]
		bizOrder            	<- map["bizOrder"]
		address             	<- map["address"]
		amount              	<- map["amount"]
		version             	<- map["version"]

	}
}


extension ShippingGroup:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "shipping_group{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if name != nil {
			result += "\tname='\(name!)'"
		}
		if bizOrder != nil {
			result += "\tbiz_order='\(bizOrder!)'"
		}
		if address != nil {
			result += "\taddress='\(address!)'"
		}
		if amount != nil {
			result += "\tamount='\(amount!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


