
class RemoteManagerImpl{



	var remoteURLPrefix:String{
		//Every manager need to config their own URL
		return "https://philipgreat.github.io/naf/Manager/"
	} 
	
	internal func compositeCallURL(methodName: String, parameters:[String]) -> String
	{	
		var resultURL = remoteURLPrefix
		/* This will be available in Swift 3.0
		resultURL.append(methodName)
		resultURL.append("/")
		*/
		resultURL += methodName
		resultURL += "/"
		
		
		
		for parameter in parameters{	
			/*	This will be available in Swift 3.0
			resultURL.append(parameter)
			resultURL.append("/")
			*/
			resultURL += parameter
			resultURL += ".json"
			
		}
		return resultURL
		
	}
    
    internal func compositeCallURL2(methodName: String, parameters:[String]) -> String
    {
        var resultURL = remoteURLPrefix
        /* This will be available in Swift 3.0
         resultURL.append(methodName)
         resultURL.append("/")
         */
        resultURL += methodName
        resultURL += "/"
        
        
        
        for parameter in parameters{
            /*	This will be available in Swift 3.0
             resultURL.append(parameter)
             resultURL.append("/")
             */
            resultURL += parameter
            resultURL += "/"
            
        }
        return resultURL
        
    }
    
    
    /*
     let headers = ["Content-Type","applicaiton/json"]
	Alamofire.request(.GET, "https://httpbin.org/get", headers: headers)
         .responseJSON { response in
             print(response.request)  // original URL request
             print(response.response) // URL response
             print(response.data)     // server data
             print(response.result)   // result of response serialization

             if let JSON = response.result.value {
                 print("JSON: \(JSON)")
             }
         }
	)
	
	
	
	*/
	
	
	internal func compositeCallURL(methodName: String) -> String
	{	
		//Simple method, do not need to call compositeCallURL(methodName: String, parameters:[String]) -> String
		var resultURL = remoteURLPrefix
		/*	This will be available in Swift 3.0
		resultURL.append(methodName)
		resultURL.append("/")
		*/
		resultURL += methodName
		resultURL += "/"
		return resultURL
		
	}


}





