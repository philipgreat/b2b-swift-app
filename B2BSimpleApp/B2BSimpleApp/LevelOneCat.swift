//Domain B2B/LevelOneCat/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct LevelOneCat{


	var	id                  :	String?             
	var	catalog             :	Catalog?            
	var	displayName         :	String?             
	var	version             :	Int?                
	
	
	var	levelTwoCatList     :	[LevelTwoCat]?      
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension LevelOneCat: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		catalog             	<- map["catalog"]
		displayName         	<- map["displayName"]
		version             	<- map["version"]
		levelTwoCatList     	<- map["levelTwoCatList"]

	}
}


extension LevelOneCat:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "level_one_cat{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if catalog != nil {
			result += "\tcatalog='\(catalog!)'"
		}
		if displayName != nil {
			result += "\tdisplay_name='\(displayName!)'"
		}
		if version != nil {
			result += "\tversion='\(version!)'"
		}
		result += "}"
		return result
	}
}


