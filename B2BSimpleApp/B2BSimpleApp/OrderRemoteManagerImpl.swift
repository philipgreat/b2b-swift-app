//Domain   B2B/Order/
import SwiftyJSON
import Alamofire
import ObjectMapper

class OrderRemoteManagerImpl:RemoteManagerImpl,CustomStringConvertible{

	
	
	
	override init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}
	
	override var remoteURLPrefix:String{
		//Every manager need to config their own URL
		return "https://philipgreat.github.io/naf/orderManager/"
	}

	func loadOrderDetail(orderId:String, 
		orderSuccessAction: (Order)->String, 
		orderErrorAction: (String)->String){
    
		let methodName = "loadOrderDetail"
		let parameters = [orderId]
        

		let url = compositeCallURL(methodName, parameters: parameters)
        //Alamofire.
        
        let request = NSMutableURLRequest(URL: NSURL.init(string: url)!)
        request.HTTPMethod = "GET"
        request.timeoutInterval = 15 // Set your timeout interval here.

        
		Alamofire.request(request).validate().responseJSON { response in
			switch response.result {
				case .Success:
					if let value = response.result.value {
						let json = JSON(value)
						if let order = self.extractOrderFromJSON(json){
							orderSuccessAction(order)	
						}
					}
                
				case .Failure(let error):
					orderErrorAction("\(error)")
			}
		}
    
	}
    
	func extractOrderFromJSON(json:JSON) -> Order?{
	
		let jsonTool = SwiftyJSONTool()
	
		let order = jsonTool.extractOrder(json)       
		
		return order
    
	}
	
    
	
	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		let result = "OrderRemoteManagerImpl, V1"
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


