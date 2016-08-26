//Domain   B2B/Approval/
import SwiftyJSON
import Alamofire
import ObjectMapper

class ApprovalRemoteManagerImpl:RemoteManagerImpl,CustomStringConvertible{

	
	
	
	override init(){
		//lazy load for all the properties
		//This is good for UI applications as it might saves RAM which is very expensive in mobile devices
		
	}
	
	override var remoteURLPrefix:String{
		//Every manager need to config their own URL
		return "https://philipgreat.github.io/naf/approvalManager/"
	}

	func loadApprovalDetail(approvalId:String, 
		approvalSuccessAction: (Approval)->String, 
		approvalErrorAction: (String)->String){
    
		let methodName = "loadApprovalDetail"
		let parameters = [approvalId]
        

		let url = compositeCallURL(methodName, parameters: parameters)
		Alamofire.request(.GET, url).validate().responseJSON { response in
			switch response.result {
				case .Success:
					if let value = response.result.value {
						let json = JSON(value)
						if let approval = self.extractApprovalFromJSON(json){
							approvalSuccessAction(approval)	
						}
					}
                
				case .Failure(let error):
					print(error)
					approvalErrorAction("\(error)")
			}
		}
    
	}
    
	func extractApprovalFromJSON(json:JSON) -> Approval?{
	
		let jsonTool = SwiftyJSONTool()
	
		let approval = jsonTool.extractApproval(json)       
		
		return approval
    
	}
	
    
	
	//Confirming to the protocol CustomStringConvertible of Foundation
	var description: String{
		//Need to find out a way to improve this method performance as this method might called to
		//debug or log, using + is faster than \(var).
		let result = "ApprovalRemoteManagerImpl, V1"
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


