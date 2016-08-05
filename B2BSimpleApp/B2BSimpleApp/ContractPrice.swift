//Domain B2B/ContractPrice/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct ContractPrice{


	var	id                  :	String?             
	var	contractId          :	String?             
	var	sku                 :	Sku?                
	var	price               :	Int?                
	var	review              :	ContractPriceReview?
	var	approval            :	ContractPriceApproval?
	var	version             :	Int?                
	
	
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension ContractPrice: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		contractId          	<- map["contractId"]
		sku                 	<- map["sku"]
		price               	<- map["price"]
		review              	<- map["review"]
		approval            	<- map["approval"]
		version             	<- map["version"]

	}
}


extension ContractPrice:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "contract_price{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if contractId != nil {
			result += "\tcontract_id='\(contractId!)'"
		}
		if sku != nil {
			result += "\tsku='\(sku!)'"
		}
		if price != nil {
			result += "\tprice='\(price!)'"
		}
		if review != nil {
			result += "\treview='\(review!)'"
		}
		if approval != nil {
			result += "\tapproval='\(approval!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


