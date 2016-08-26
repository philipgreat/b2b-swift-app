//Domain   B2B/Navi/
import SwiftyJSON
import Alamofire
import ObjectMapper

class NaviRemoteManagerImpl:RemoteManagerImpl,CustomStringConvertible{

	
	
	
	override init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}
	
	override var remoteURLPrefix:String{
		//Every manager need to config their own URL
		return "https://philipgreat.github.io/naf/naviManager/"
	}

	func loadNaviDetail(naviId:String, 
		naviSuccessAction: (Navi)->String, 
		naviErrorAction: (String)->String){
    
		let methodName = "loadNaviDetail"
		let parameters = [naviId]
        

		let url = compositeCallURL(methodName, parameters: parameters)
		Alamofire.request(.GET, url).validate().responseJSON { response in
			switch response.result {
				case .Success:
					if let value = response.result.value {
						let json = JSON(value)
						if let navi = self.extractNaviFromJSON(json){
							naviSuccessAction(navi)	
						}
					}
                
				case .Failure(let error):
					print(error)
					naviErrorAction("\(error)")
			}
		}
    
	}
    
	func extractNaviFromJSON(json:JSON) -> Navi?{
	
		let jsonTool = SwiftyJSONTool()
	
		let navi = jsonTool.extractNavi(json)       
		
		return navi
    
	}
	
    
	
	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		let result = "NaviRemoteManagerImpl, V1"
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


