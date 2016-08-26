//Domain   B2B/LineItem/
import SwiftyJSON
import Alamofire
import ObjectMapper

class LineItemRemoteManagerImpl:RemoteManagerImpl,CustomStringConvertible{

	
	
	
	override init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}
	
	override var remoteURLPrefix:String{
		//Every manager need to config their own URL
		return "https://philipgreat.github.io/naf/lineItemManager/"
	}

	func loadLineItemDetail(lineItemId:String, 
		lineItemSuccessAction: (LineItem)->String, 
		lineItemErrorAction: (String)->String){
    
		let methodName = "loadLineItemDetail"
		let parameters = [lineItemId]
        

		let url = compositeCallURL(methodName, parameters: parameters)
		Alamofire.request(.GET, url).validate().responseJSON { response in
			switch response.result {
				case .Success:
					if let value = response.result.value {
						let json = JSON(value)
						if let lineItem = self.extractLineItemFromJSON(json){
							lineItemSuccessAction(lineItem)	
						}
					}
                
				case .Failure(let error):
					print(error)
					lineItemErrorAction("\(error)")
			}
		}
    
	}
    
	func extractLineItemFromJSON(json:JSON) -> LineItem?{
	
		let jsonTool = SwiftyJSONTool()
	
		let lineItem = jsonTool.extractLineItem(json)       
		
		return lineItem
    
	}
	
    
	
	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		let result = "LineItemRemoteManagerImpl, V1"
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


