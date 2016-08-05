//Domain B2B/HomePage/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct HomePage{


	var	id                  :	String?             
	var	title               :	String?             
	var	ver                 :	String?             
	var	version             :	Int?                
	
	
	var	sellerSiteList      :	[SellerSite]?       
	var	headerList          :	[Header]?           
	var	naviList            :	[Navi]?             
	var	bannerList          :	[Banner]?           
	var	footerList          :	[Footer]?           
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension HomePage: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		title               	<- map["title"]
		ver                 	<- map["ver"]
		version             	<- map["version"]
		sellerSiteList      	<- map["sellerSiteList"]
		headerList          	<- map["headerList"]
		naviList            	<- map["naviList"]
		bannerList          	<- map["bannerList"]
		footerList          	<- map["footerList"]

	}
}


extension HomePage:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "home_page{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if title != nil {
			result += "\ttitle='\(title!)'"
		}
		if ver != nil {
			result += "\tver='\(ver!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


