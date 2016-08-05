//Domain   B2B/HomePage/
import SwiftyJSON
import Alamofire
import ObjectMapper

class HomePageRemoteManagerImpl:RemoteManagerImpl,CustomStringConvertible{

	
	
	
	override init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}
	
	override var remoteURLPrefix:String{
		//Every manager need to config their own URL
		return "http://127.0.0.1:8080/naf/homePageManager/"
	}

	func loadHomePageDetail(homePageId:String, 
		homePageSuccessAction: (HomePage)->String, 
		homePageErrorAction: (String)->String){
    
		let methodName = "loadHomePageDetail"
		let parameters = [homePageId]
        

		let url = compositeCallURL(methodName, parameters: parameters)
		Alamofire.request(.GET, url).validate().responseJSON { response in
			switch response.result {
				case .Success:
					if let value = response.result.value {
						let json = JSON(value)
						if let homePage = self.extractHomePageFromJSON(json){
							homePageSuccessAction(homePage)	
						}
					}
                
				case .Failure(let error):
					print(error)
					homePageErrorAction("\(error)")
			}
		}
    
	}
    
	func extractHomePageFromJSON(json:JSON) -> HomePage?{
	
		let jsonTool = SwiftyJSONTool()
	
		let homePage = jsonTool.extractHomePage(json)       
		
		return homePage
    
	}
	
    
	
	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		let result = "HomePageRemoteManagerImpl, V1"
		return result
	}
	static var 	CLASS_VERSION = 1
	//This value is for serializer like message pack to identify the versions match between
	//local and remote object.
	
	
}
//Reference http://grokswift.com/simple-rest-with-swift/
//Reference https://github.com/SwiftyJSON/SwiftyJSON
//Reference https://github.com/Alamofire/Alamofire
//Reference https://github.com/Hearst-DD/ObjectMapper
//let remote = RemoteManagerImpl()
//let result = remote.compositeCallURL(methodName: "getDetail",parameters:["O0000001"])
//print(result)


