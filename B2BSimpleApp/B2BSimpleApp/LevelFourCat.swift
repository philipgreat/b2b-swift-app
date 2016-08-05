//Domain B2B/LevelFourCat/
import Foundation

import ObjectMapper //Use this to generate Object
import SwiftyJSON	//Use this to verify the JSON Object

struct LevelFourCat{


	var	id                  :	String?             
	var	parentCat           :	LevelThreeCat?      
	var	displayName         :	String?             
	var	version             :	Int?                
	
	
	var	levelFiveCatList    :	[LevelFiveCat]?     
	
		
	init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}


	
	static var 	CLASS_VERSION = "1" 
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
		
}

extension LevelFourCat: Mappable{

		//Confirming to the protocol Mappable of ObjectMapper
	//Reference on https://github.com/Hearst-DD/ObjectMapper/
	
	init?(_ map: Map){
    
	}
	
	mutating func mapping(map: Map) {
		//Map each field to json fields
		id                  	<- map["id"]
		parentCat           	<- map["parentCat"]
		displayName         	<- map["displayName"]
		version             	<- map["version"]
		levelFiveCatList    	<- map["levelFiveCatList"]

	}
}


extension LevelFourCat:CustomStringConvertible{

	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		
		var result = "level_four_cat{";

		if id != nil {
			result += "\tid='\(id!)'"
		}
		if parentCat != nil {
			result += "\tparent_cat='\(parentCat!)'"
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


