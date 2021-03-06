//Domain   B2B/Warehouse/
import SwiftyJSON
import Alamofire
import ObjectMapper

class WarehouseRemoteManagerImpl:RemoteManagerImpl,CustomStringConvertible{

	
	
	
	override init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}
	
	override var remoteURLPrefix:String{
		//Every manager need to config their own URL
		return "https://philipgreat.github.io/naf/warehouseManager/"
	}

	func loadWarehouseDetail(warehouseId:String, 
		warehouseSuccessAction: (Warehouse)->String, 
		warehouseErrorAction: (String)->String){
    
		let methodName = "loadWarehouseDetail"
		let parameters = [warehouseId]
        

		let url = compositeCallURL(methodName, parameters: parameters)
		Alamofire.request(.GET, url).validate().responseJSON { response in
			switch response.result {
				case .Success:
					if let value = response.result.value {
						let json = JSON(value)
						if let warehouse = self.extractWarehouseFromJSON(json){
							warehouseSuccessAction(warehouse)	
						}
					}
                
				case .Failure(let error):
					print(error)
					warehouseErrorAction("\(error)")
			}
		}
    
	}
    
	func extractWarehouseFromJSON(json:JSON) -> Warehouse?{
	
		let jsonTool = SwiftyJSONTool()
	
		let warehouse = jsonTool.extractWarehouse(json)       
		
		return warehouse
    
	}
	
    
	
	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		let result = "WarehouseRemoteManagerImpl, V1"
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


