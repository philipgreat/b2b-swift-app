//Domain B2B/SellerCompany/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct SellerCompany{


	var	id                  :	String?             
	var	name                :	String?             
	var	owner               :	String?             
	var	logo                :	String?             
	var	contractText        :	String?             
	var	version             :	Int?                
	
	
	var	profitCenterList    :	[ProfitCenter]?     
	var	creditAccountList   :	[CreditAccount]?    
	var	orderList           :	[Order]?            
	var	custSvcRepList      :	[CustSvcRep]?       
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension SellerCompany: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		name                	<- map["name"]
		owner               	<- map["owner"]
		logo                	<- map["logo"]
		contractText        	<- map["contractText"]
		version             	<- map["version"]
		profitCenterList    	<- map["profitCenterList"]
		creditAccountList   	<- map["creditAccountList"]
		orderList           	<- map["orderList"]
		custSvcRepList      	<- map["custSvcRepList"]

	}
}


extension SellerCompany:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "seller_company{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if name != nil {
			result += "\tname='\(name!)'"
		}
		if owner != nil {
			result += "\towner='\(owner!)'"
		}
		if logo != nil {
			result += "\tlogo='\(logo!)'"
		}
		if contractText != nil {
			result += "\tcontract_text='\(contractText!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


