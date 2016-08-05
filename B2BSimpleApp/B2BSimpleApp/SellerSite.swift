//Domain B2B/SellerSite/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct SellerSite{


	var	id                  :	String?             
	var	siteId              :	String?             
	var	homePage            :	HomePage?           
	var	catalog             :	Catalog?            
	var	marketing           :	MarketingLanding?   
	var	version             :	Int?                
	
	
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension SellerSite: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		siteId              	<- map["siteId"]
		homePage            	<- map["homePage"]
		catalog             	<- map["catalog"]
		marketing           	<- map["marketing"]
		version             	<- map["version"]

	}
}


extension SellerSite:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "seller_site{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if siteId != nil {
			result += "\tsite_id='\(siteId!)'"
		}
		if homePage != nil {
			result += "\thome_page='\(homePage!)'"
		}
		if catalog != nil {
			result += "\tcatalog='\(catalog!)'"
		}
		if marketing != nil {
			result += "\tmarketing='\(marketing!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


