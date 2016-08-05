//Domain B2B/Sku/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct Sku{


	var	id                  :	String?             
	var	displayName         :	String?             
	var	size                :	String?             
	var	product             :	Product?            
	var	active              :	Bool?               
	var	version             :	Int?                
	
	
	var	universalPriceList  :	[UniversalPrice]?   
	var	contractPriceList   :	[ContractPrice]?    
	var	fixRiceSkuPromotionList:	[FixRiceSkuPromotion]?
	var	inventoryList       :	[Inventory]?        
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension Sku: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		displayName         	<- map["displayName"]
		size                	<- map["size"]
		product             	<- map["product"]
		active              	<- map["active"]
		version             	<- map["version"]
		universalPriceList  	<- map["universalPriceList"]
		contractPriceList   	<- map["contractPriceList"]
		fixRiceSkuPromotionList	<- map["fixRiceSkuPromotionList"]
		inventoryList       	<- map["inventoryList"]

	}
}


extension Sku:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "sku{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if displayName != nil {
			result += "\tdisplay_name='\(displayName!)'"
		}
		if size != nil {
			result += "\tsize='\(size!)'"
		}
		if product != nil {
			result += "\tproduct='\(product!)'"
		}
		if active != nil {
			result += "\tactive='\(active!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


