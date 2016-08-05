//Domain B2B/Catalog/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct Catalog{


	var	id                  :	String?             
	var	displayName         :	String?             
	var	sellerId            :	String?             
	var	version             :	Int?                
	
	
	var	sellerSiteList      :	[SellerSite]?       
	var	levelOneCatList     :	[LevelOneCat]?      
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension Catalog: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		displayName         	<- map["displayName"]
		sellerId            	<- map["sellerId"]
		version             	<- map["version"]
		sellerSiteList      	<- map["sellerSiteList"]
		levelOneCatList     	<- map["levelOneCatList"]

	}
}


extension Catalog:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "catalog{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if displayName != nil {
			result += "\tdisplay_name='\(displayName!)'"
		}
		if sellerId != nil {
			result += "\tseller_id='\(sellerId!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


