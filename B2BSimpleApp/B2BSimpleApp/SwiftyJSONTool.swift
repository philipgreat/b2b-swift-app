
import SwiftyJSON
import Foundation

//Adding date, datetime type for SwiftyJSON, the format can be custom here.

class Formatter {

    private static var internalJsonDateFormatter: NSDateFormatter?
    private static var internalJsonDateTimeFormatter: NSDateFormatter?

    static var jsonDateFormatter: NSDateFormatter {
        if (internalJsonDateFormatter == nil) {
            internalJsonDateFormatter = NSDateFormatter()
            internalJsonDateFormatter!.dateFormat = "yyyy-MM-dd"
        }
        return internalJsonDateFormatter!
    }

    static var jsonDateTimeFormatter: NSDateFormatter {
        if (internalJsonDateTimeFormatter == nil) {
            internalJsonDateTimeFormatter = NSDateFormatter()
            internalJsonDateTimeFormatter!.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSS'Z'"
        }
        return internalJsonDateTimeFormatter!
    }

}


extension JSON {

    public var date: NSDate? {
        get {
            switch self.type {
            case .String:
                return Formatter.jsonDateFormatter.dateFromString(self.object as! String)
            default:
                return nil
            }
        }
    }

    public var dateTime: NSDate? {
        get {
            switch self.type {
            case .String:
                return Formatter.jsonDateTimeFormatter.dateFromString(self.object as! String)
            default:
                return nil
            }
        }
    }

}


class SwiftyJSONTool{




	func extractBuyerCompany(json:JSON) -> BuyerCompany?{
	
		var buyerCompany = BuyerCompany()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return buyerCompany
		}

		if let id = json["id"].string {
			buyerCompany.id = id
		}
		if let name = json["name"].string {
			buyerCompany.name = name
		}
		if let priceList = json["priceList"].string {
			buyerCompany.priceList = priceList
		}
		if let rating = json["rating"].int {
			buyerCompany.rating = rating
		}
		if let logo = json["logo"].string {
			buyerCompany.logo = logo
		}
		if let owner = json["owner"].string {
			buyerCompany.owner = owner
		}
		if let founded = json["founded"].date {
			buyerCompany.founded = founded
		}
		if let version = json["version"].int {
			buyerCompany.version = version
		}
		//Extract one to many list here
		buyerCompany.costCenterList       =	extractCostCenterList(json["costCenterList"])
		buyerCompany.creditAccountList    =	extractCreditAccountList(json["creditAccountList"])
		buyerCompany.billingAddressList   =	extractBillingAddressList(json["billingAddressList"])
		buyerCompany.employeeList         =	extractEmployeeList(json["employeeList"])
		buyerCompany.orderList            =	extractOrderList(json["orderList"])


		return buyerCompany
	}
	
	func extractBuyerCompanyList(json:JSON) -> [BuyerCompany]?{
        
		
        
		guard let buyerCompanyListJson = json.array else{
			//NSLog("extractBuyerCompanyList(json:JSON): there is an error here!")
			return nil
		}
		var buyerCompanyList = [BuyerCompany]()
		for element in buyerCompanyListJson{
			if let buyerCompany = extractBuyerCompany(element){
				buyerCompanyList.append(buyerCompany)
			}
			
		}
		return buyerCompanyList
	}



	func extractSellerCompany(json:JSON) -> SellerCompany?{
	
		var sellerCompany = SellerCompany()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return sellerCompany
		}

		if let id = json["id"].string {
			sellerCompany.id = id
		}
		if let name = json["name"].string {
			sellerCompany.name = name
		}
		if let owner = json["owner"].string {
			sellerCompany.owner = owner
		}
		if let logo = json["logo"].string {
			sellerCompany.logo = logo
		}
		if let contractText = json["contractText"].string {
			sellerCompany.contractText = contractText
		}
		if let version = json["version"].int {
			sellerCompany.version = version
		}
		//Extract one to many list here
		sellerCompany.profitCenterList     =	extractProfitCenterList(json["profitCenterList"])
		sellerCompany.creditAccountList    =	extractCreditAccountList(json["creditAccountList"])
		sellerCompany.orderList            =	extractOrderList(json["orderList"])
		sellerCompany.custSvcRepList       =	extractCustSvcRepList(json["custSvcRepList"])


		return sellerCompany
	}
	
	func extractSellerCompanyList(json:JSON) -> [SellerCompany]?{
        
		
        
		guard let sellerCompanyListJson = json.array else{
			//NSLog("extractSellerCompanyList(json:JSON): there is an error here!")
			return nil
		}
		var sellerCompanyList = [SellerCompany]()
		for element in sellerCompanyListJson{
			if let sellerCompany = extractSellerCompany(element){
				sellerCompanyList.append(sellerCompany)
			}
			
		}
		return sellerCompanyList
	}



	func extractCostCenter(json:JSON) -> CostCenter?{
	
		var costCenter = CostCenter()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return costCenter
		}

		if let id = json["id"].string {
			costCenter.id = id
		}
		if let name = json["name"].string {
			costCenter.name = name
		}
		costCenter.belongsTo = extractBuyerCompany(json["belongsTo"])
		if let password = json["password"].string {
			costCenter.password = password
		}
		if let version = json["version"].int {
			costCenter.version = version
		}
		//Extract one to many list here
		costCenter.orderList            =	extractOrderList(json["orderList"])


		return costCenter
	}
	
	func extractCostCenterList(json:JSON) -> [CostCenter]?{
        
		
        
		guard let costCenterListJson = json.array else{
			//NSLog("extractCostCenterList(json:JSON): there is an error here!")
			return nil
		}
		var costCenterList = [CostCenter]()
		for element in costCenterListJson{
			if let costCenter = extractCostCenter(element){
				costCenterList.append(costCenter)
			}
			
		}
		return costCenterList
	}



	func extractProfitCenter(json:JSON) -> ProfitCenter?{
	
		var profitCenter = ProfitCenter()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return profitCenter
		}

		if let id = json["id"].string {
			profitCenter.id = id
		}
		if let name = json["name"].string {
			profitCenter.name = name
		}
		profitCenter.belongsTo = extractSellerCompany(json["belongsTo"])
		if let version = json["version"].int {
			profitCenter.version = version
		}
		//Extract one to many list here
		profitCenter.orderList            =	extractOrderList(json["orderList"])


		return profitCenter
	}
	
	func extractProfitCenterList(json:JSON) -> [ProfitCenter]?{
        
		
        
		guard let profitCenterListJson = json.array else{
			//NSLog("extractProfitCenterList(json:JSON): there is an error here!")
			return nil
		}
		var profitCenterList = [ProfitCenter]()
		for element in profitCenterListJson{
			if let profitCenter = extractProfitCenter(element){
				profitCenterList.append(profitCenter)
			}
			
		}
		return profitCenterList
	}



	func extractCreditAccount(json:JSON) -> CreditAccount?{
	
		var creditAccount = CreditAccount()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return creditAccount
		}

		if let id = json["id"].string {
			creditAccount.id = id
		}
		if let name = json["name"].string {
			creditAccount.name = name
		}
		creditAccount.buyer = extractBuyerCompany(json["buyer"])
		creditAccount.seller = extractSellerCompany(json["seller"])
		if let authorized = json["authorized"].double {
			creditAccount.authorized = authorized
		}
		if let remain = json["remain"].double {
			creditAccount.remain = remain
		}
		if let version = json["version"].int {
			creditAccount.version = version
		}


		return creditAccount
	}
	
	func extractCreditAccountList(json:JSON) -> [CreditAccount]?{
        
		
        
		guard let creditAccountListJson = json.array else{
			//NSLog("extractCreditAccountList(json:JSON): there is an error here!")
			return nil
		}
		var creditAccountList = [CreditAccount]()
		for element in creditAccountListJson{
			if let creditAccount = extractCreditAccount(element){
				creditAccountList.append(creditAccount)
			}
			
		}
		return creditAccountList
	}



	func extractShippingAddress(json:JSON) -> ShippingAddress?{
	
		var shippingAddress = ShippingAddress()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return shippingAddress
		}

		if let id = json["id"].string {
			shippingAddress.id = id
		}
		if let line1 = json["line1"].string {
			shippingAddress.line1 = line1
		}
		if let line2 = json["line2"].string {
			shippingAddress.line2 = line2
		}
		if let city = json["city"].string {
			shippingAddress.city = city
		}
		if let state = json["state"].string {
			shippingAddress.state = state
		}
		if let country = json["country"].string {
			shippingAddress.country = country
		}
		if let version = json["version"].int {
			shippingAddress.version = version
		}
		//Extract one to many list here
		shippingAddress.shippingGroupList    =	extractShippingGroupList(json["shippingGroupList"])


		return shippingAddress
	}
	
	func extractShippingAddressList(json:JSON) -> [ShippingAddress]?{
        
		
        
		guard let shippingAddressListJson = json.array else{
			//NSLog("extractShippingAddressList(json:JSON): there is an error here!")
			return nil
		}
		var shippingAddressList = [ShippingAddress]()
		for element in shippingAddressListJson{
			if let shippingAddress = extractShippingAddress(element){
				shippingAddressList.append(shippingAddress)
			}
			
		}
		return shippingAddressList
	}



	func extractBillingAddress(json:JSON) -> BillingAddress?{
	
		var billingAddress = BillingAddress()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return billingAddress
		}

		if let id = json["id"].string {
			billingAddress.id = id
		}
		billingAddress.company = extractBuyerCompany(json["company"])
		if let line1 = json["line1"].string {
			billingAddress.line1 = line1
		}
		if let line2 = json["line2"].string {
			billingAddress.line2 = line2
		}
		if let city = json["city"].string {
			billingAddress.city = city
		}
		if let state = json["state"].string {
			billingAddress.state = state
		}
		if let country = json["country"].string {
			billingAddress.country = country
		}
		if let version = json["version"].int {
			billingAddress.version = version
		}
		//Extract one to many list here
		billingAddress.paymentGroupList     =	extractPaymentGroupList(json["paymentGroupList"])


		return billingAddress
	}
	
	func extractBillingAddressList(json:JSON) -> [BillingAddress]?{
        
		
        
		guard let billingAddressListJson = json.array else{
			//NSLog("extractBillingAddressList(json:JSON): there is an error here!")
			return nil
		}
		var billingAddressList = [BillingAddress]()
		for element in billingAddressListJson{
			if let billingAddress = extractBillingAddress(element){
				billingAddressList.append(billingAddress)
			}
			
		}
		return billingAddressList
	}



	func extractEmployee(json:JSON) -> Employee?{
	
		var employee = Employee()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return employee
		}

		if let id = json["id"].string {
			employee.id = id
		}
		if let name = json["name"].string {
			employee.name = name
		}
		employee.company = extractBuyerCompany(json["company"])
		if let email = json["email"].string {
			employee.email = email
		}
		if let passwd = json["passwd"].string {
			employee.passwd = passwd
		}
		if let cellPhone = json["cellPhone"].string {
			employee.cellPhone = cellPhone
		}
		if let version = json["version"].int {
			employee.version = version
		}
		//Extract one to many list here
		employee.assignmentList       =	extractAssignmentList(json["assignmentList"])


		return employee
	}
	
	func extractEmployeeList(json:JSON) -> [Employee]?{
        
		
        
		guard let employeeListJson = json.array else{
			//NSLog("extractEmployeeList(json:JSON): there is an error here!")
			return nil
		}
		var employeeList = [Employee]()
		for element in employeeListJson{
			if let employee = extractEmployee(element){
				employeeList.append(employee)
			}
			
		}
		return employeeList
	}



	func extractRole(json:JSON) -> Role?{
	
		var role = Role()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return role
		}

		if let id = json["id"].string {
			role.id = id
		}
		if let roleName = json["roleName"].string {
			role.roleName = roleName
		}
		if let version = json["version"].int {
			role.version = version
		}
		//Extract one to many list here
		role.accessList           =	extractAccessList(json["accessList"])
		role.custSvcRepList       =	extractCustSvcRepList(json["custSvcRepList"])


		return role
	}
	
	func extractRoleList(json:JSON) -> [Role]?{
        
		
        
		guard let roleListJson = json.array else{
			//NSLog("extractRoleList(json:JSON): there is an error here!")
			return nil
		}
		var roleList = [Role]()
		for element in roleListJson{
			if let role = extractRole(element){
				roleList.append(role)
			}
			
		}
		return roleList
	}



	func extractAssignment(json:JSON) -> Assignment?{
	
		var assignment = Assignment()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return assignment
		}

		if let id = json["id"].string {
			assignment.id = id
		}
		assignment.user = extractEmployee(json["user"])
		assignment.access = extractAccess(json["access"])
		if let assignedDate = json["assignedDate"].date {
			assignment.assignedDate = assignedDate
		}
		if let version = json["version"].int {
			assignment.version = version
		}


		return assignment
	}
	
	func extractAssignmentList(json:JSON) -> [Assignment]?{
        
		
        
		guard let assignmentListJson = json.array else{
			//NSLog("extractAssignmentList(json:JSON): there is an error here!")
			return nil
		}
		var assignmentList = [Assignment]()
		for element in assignmentListJson{
			if let assignment = extractAssignment(element){
				assignmentList.append(assignment)
			}
			
		}
		return assignmentList
	}



	func extractAccess(json:JSON) -> Access?{
	
		var access = Access()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return access
		}

		if let id = json["id"].string {
			access.id = id
		}
		if let roleName = json["roleName"].string {
			access.roleName = roleName
		}
		access.role = extractRole(json["role"])
		if let version = json["version"].int {
			access.version = version
		}
		//Extract one to many list here
		access.assignmentList       =	extractAssignmentList(json["assignmentList"])


		return access
	}
	
	func extractAccessList(json:JSON) -> [Access]?{
        
		
        
		guard let accessListJson = json.array else{
			//NSLog("extractAccessList(json:JSON): there is an error here!")
			return nil
		}
		var accessList = [Access]()
		for element in accessListJson{
			if let access = extractAccess(element){
				accessList.append(access)
			}
			
		}
		return accessList
	}



	func extractOrder(json:JSON) -> Order?{
	
		var order = Order()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return order
		}

		if let id = json["id"].string {
			order.id = id
		}
		order.buyer = extractBuyerCompany(json["buyer"])
		order.seller = extractSellerCompany(json["seller"])
		if let title = json["title"].string {
			order.title = title
		}
		order.costCenter = extractCostCenter(json["costCenter"])
		order.profitCenter = extractProfitCenter(json["profitCenter"])
		if let totalAmount = json["totalAmount"].double {
			order.totalAmount = totalAmount
		}
		if let type = json["type"].string {
			order.type = type
		}
		if let markAsDelete = json["markAsDelete"].bool {
			order.markAsDelete = markAsDelete
		}
		order.confirmation = extractConfirmation(json["confirmation"])
		order.approval = extractApproval(json["approval"])
		order.processing = extractProcessing(json["processing"])
		order.shipment = extractShipment(json["shipment"])
		order.delivery = extractDelivery(json["delivery"])
		order.recurringInfo = extractRecurringInfo(json["recurringInfo"])
		if let version = json["version"].int {
			order.version = version
		}
		//Extract one to many list here
		order.lineItemList         =	extractLineItemList(json["lineItemList"])
		order.shippingGroupList    =	extractShippingGroupList(json["shippingGroupList"])
		order.paymentGroupList     =	extractPaymentGroupList(json["paymentGroupList"])
		order.actionList           =	extractActionList(json["actionList"])


		return order
	}
	
	func extractOrderList(json:JSON) -> [Order]?{
        
		
        
		guard let orderListJson = json.array else{
			//NSLog("extractOrderList(json:JSON): there is an error here!")
			return nil
		}
		var orderList = [Order]()
		for element in orderListJson{
			if let order = extractOrder(element){
				orderList.append(order)
			}
			
		}
		return orderList
	}



	func extractRecurringInfo(json:JSON) -> RecurringInfo?{
	
		var recurringInfo = RecurringInfo()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return recurringInfo
		}

		if let id = json["id"].string {
			recurringInfo.id = id
		}
		if let name = json["name"].string {
			recurringInfo.name = name
		}
		if let nextTime = json["nextTime"].date {
			recurringInfo.nextTime = nextTime
		}
		if let cronExpr = json["cronExpr"].string {
			recurringInfo.cronExpr = cronExpr
		}
		if let version = json["version"].int {
			recurringInfo.version = version
		}
		//Extract one to many list here
		recurringInfo.orderList            =	extractOrderList(json["orderList"])


		return recurringInfo
	}
	
	func extractRecurringInfoList(json:JSON) -> [RecurringInfo]?{
        
		
        
		guard let recurringInfoListJson = json.array else{
			//NSLog("extractRecurringInfoList(json:JSON): there is an error here!")
			return nil
		}
		var recurringInfoList = [RecurringInfo]()
		for element in recurringInfoListJson{
			if let recurringInfo = extractRecurringInfo(element){
				recurringInfoList.append(recurringInfo)
			}
			
		}
		return recurringInfoList
	}



	func extractConfirmation(json:JSON) -> Confirmation?{
	
		var confirmation = Confirmation()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return confirmation
		}

		if let id = json["id"].string {
			confirmation.id = id
		}
		if let who = json["who"].string {
			confirmation.who = who
		}
		if let confirmTime = json["confirmTime"].date {
			confirmation.confirmTime = confirmTime
		}
		if let version = json["version"].int {
			confirmation.version = version
		}
		//Extract one to many list here
		confirmation.orderList            =	extractOrderList(json["orderList"])


		return confirmation
	}
	
	func extractConfirmationList(json:JSON) -> [Confirmation]?{
        
		
        
		guard let confirmationListJson = json.array else{
			//NSLog("extractConfirmationList(json:JSON): there is an error here!")
			return nil
		}
		var confirmationList = [Confirmation]()
		for element in confirmationListJson{
			if let confirmation = extractConfirmation(element){
				confirmationList.append(confirmation)
			}
			
		}
		return confirmationList
	}



	func extractShipment(json:JSON) -> Shipment?{
	
		var shipment = Shipment()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return shipment
		}

		if let id = json["id"].string {
			shipment.id = id
		}
		if let who = json["who"].string {
			shipment.who = who
		}
		if let shipTime = json["shipTime"].date {
			shipment.shipTime = shipTime
		}
		if let version = json["version"].int {
			shipment.version = version
		}
		//Extract one to many list here
		shipment.orderList            =	extractOrderList(json["orderList"])


		return shipment
	}
	
	func extractShipmentList(json:JSON) -> [Shipment]?{
        
		
        
		guard let shipmentListJson = json.array else{
			//NSLog("extractShipmentList(json:JSON): there is an error here!")
			return nil
		}
		var shipmentList = [Shipment]()
		for element in shipmentListJson{
			if let shipment = extractShipment(element){
				shipmentList.append(shipment)
			}
			
		}
		return shipmentList
	}



	func extractDelivery(json:JSON) -> Delivery?{
	
		var delivery = Delivery()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return delivery
		}

		if let id = json["id"].string {
			delivery.id = id
		}
		if let who = json["who"].string {
			delivery.who = who
		}
		if let deliveryTime = json["deliveryTime"].date {
			delivery.deliveryTime = deliveryTime
		}
		if let version = json["version"].int {
			delivery.version = version
		}
		//Extract one to many list here
		delivery.orderList            =	extractOrderList(json["orderList"])


		return delivery
	}
	
	func extractDeliveryList(json:JSON) -> [Delivery]?{
        
		
        
		guard let deliveryListJson = json.array else{
			//NSLog("extractDeliveryList(json:JSON): there is an error here!")
			return nil
		}
		var deliveryList = [Delivery]()
		for element in deliveryListJson{
			if let delivery = extractDelivery(element){
				deliveryList.append(delivery)
			}
			
		}
		return deliveryList
	}



	func extractProcessing(json:JSON) -> Processing?{
	
		var processing = Processing()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return processing
		}

		if let id = json["id"].string {
			processing.id = id
		}
		if let who = json["who"].string {
			processing.who = who
		}
		if let processTime = json["processTime"].date {
			processing.processTime = processTime
		}
		if let version = json["version"].int {
			processing.version = version
		}
		//Extract one to many list here
		processing.orderList            =	extractOrderList(json["orderList"])


		return processing
	}
	
	func extractProcessingList(json:JSON) -> [Processing]?{
        
		
        
		guard let processingListJson = json.array else{
			//NSLog("extractProcessingList(json:JSON): there is an error here!")
			return nil
		}
		var processingList = [Processing]()
		for element in processingListJson{
			if let processing = extractProcessing(element){
				processingList.append(processing)
			}
			
		}
		return processingList
	}



	func extractApproval(json:JSON) -> Approval?{
	
		var approval = Approval()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return approval
		}

		if let id = json["id"].string {
			approval.id = id
		}
		if let who = json["who"].string {
			approval.who = who
		}
		if let approveTime = json["approveTime"].date {
			approval.approveTime = approveTime
		}
		if let version = json["version"].int {
			approval.version = version
		}
		//Extract one to many list here
		approval.orderList            =	extractOrderList(json["orderList"])


		return approval
	}
	
	func extractApprovalList(json:JSON) -> [Approval]?{
        
		
        
		guard let approvalListJson = json.array else{
			//NSLog("extractApprovalList(json:JSON): there is an error here!")
			return nil
		}
		var approvalList = [Approval]()
		for element in approvalListJson{
			if let approval = extractApproval(element){
				approvalList.append(approval)
			}
			
		}
		return approvalList
	}



	func extractLineItem(json:JSON) -> LineItem?{
	
		var lineItem = LineItem()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return lineItem
		}

		if let id = json["id"].string {
			lineItem.id = id
		}
		lineItem.bizOrder = extractOrder(json["bizOrder"])
		if let skuId = json["skuId"].string {
			lineItem.skuId = skuId
		}
		if let skuName = json["skuName"].string {
			lineItem.skuName = skuName
		}
		if let amount = json["amount"].double {
			lineItem.amount = amount
		}
		if let quantity = json["quantity"].int {
			lineItem.quantity = quantity
		}
		if let active = json["active"].bool {
			lineItem.active = active
		}
		if let version = json["version"].int {
			lineItem.version = version
		}


		return lineItem
	}
	
	func extractLineItemList(json:JSON) -> [LineItem]?{
        
		
        
		guard let lineItemListJson = json.array else{
			//NSLog("extractLineItemList(json:JSON): there is an error here!")
			return nil
		}
		var lineItemList = [LineItem]()
		for element in lineItemListJson{
			if let lineItem = extractLineItem(element){
				lineItemList.append(lineItem)
			}
			
		}
		return lineItemList
	}



	func extractShippingGroup(json:JSON) -> ShippingGroup?{
	
		var shippingGroup = ShippingGroup()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return shippingGroup
		}

		if let id = json["id"].string {
			shippingGroup.id = id
		}
		if let name = json["name"].string {
			shippingGroup.name = name
		}
		shippingGroup.bizOrder = extractOrder(json["bizOrder"])
		shippingGroup.address = extractShippingAddress(json["address"])
		if let amount = json["amount"].double {
			shippingGroup.amount = amount
		}
		if let version = json["version"].int {
			shippingGroup.version = version
		}


		return shippingGroup
	}
	
	func extractShippingGroupList(json:JSON) -> [ShippingGroup]?{
        
		
        
		guard let shippingGroupListJson = json.array else{
			//NSLog("extractShippingGroupList(json:JSON): there is an error here!")
			return nil
		}
		var shippingGroupList = [ShippingGroup]()
		for element in shippingGroupListJson{
			if let shippingGroup = extractShippingGroup(element){
				shippingGroupList.append(shippingGroup)
			}
			
		}
		return shippingGroupList
	}



	func extractPaymentGroup(json:JSON) -> PaymentGroup?{
	
		var paymentGroup = PaymentGroup()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return paymentGroup
		}

		if let id = json["id"].string {
			paymentGroup.id = id
		}
		if let name = json["name"].string {
			paymentGroup.name = name
		}
		paymentGroup.bizOrder = extractOrder(json["bizOrder"])
		if let cardNumber = json["cardNumber"].string {
			paymentGroup.cardNumber = cardNumber
		}
		paymentGroup.billingAddress = extractBillingAddress(json["billingAddress"])
		if let version = json["version"].int {
			paymentGroup.version = version
		}


		return paymentGroup
	}
	
	func extractPaymentGroupList(json:JSON) -> [PaymentGroup]?{
        
		
        
		guard let paymentGroupListJson = json.array else{
			//NSLog("extractPaymentGroupList(json:JSON): there is an error here!")
			return nil
		}
		var paymentGroupList = [PaymentGroup]()
		for element in paymentGroupListJson{
			if let paymentGroup = extractPaymentGroup(element){
				paymentGroupList.append(paymentGroup)
			}
			
		}
		return paymentGroupList
	}



	func extractCustSvcRep(json:JSON) -> CustSvcRep?{
	
		var custSvcRep = CustSvcRep()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return custSvcRep
		}

		if let id = json["id"].string {
			custSvcRep.id = id
		}
		if let email = json["email"].string {
			custSvcRep.email = email
		}
		if let passwd = json["passwd"].string {
			custSvcRep.passwd = passwd
		}
		custSvcRep.role = extractRole(json["role"])
		custSvcRep.company = extractSellerCompany(json["company"])
		if let version = json["version"].int {
			custSvcRep.version = version
		}


		return custSvcRep
	}
	
	func extractCustSvcRepList(json:JSON) -> [CustSvcRep]?{
        
		
        
		guard let custSvcRepListJson = json.array else{
			//NSLog("extractCustSvcRepList(json:JSON): there is an error here!")
			return nil
		}
		var custSvcRepList = [CustSvcRep]()
		for element in custSvcRepListJson{
			if let custSvcRep = extractCustSvcRep(element){
				custSvcRepList.append(custSvcRep)
			}
			
		}
		return custSvcRepList
	}



	func extractAction(json:JSON) -> Action?{
	
		var action = Action()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return action
		}

		if let id = json["id"].string {
			action.id = id
		}
		if let name = json["name"].string {
			action.name = name
		}
		if let internalName = json["internalName"].string {
			action.internalName = internalName
		}
		action.bo = extractOrder(json["bo"])
		if let version = json["version"].int {
			action.version = version
		}


		return action
	}
	
	func extractActionList(json:JSON) -> [Action]?{
        
		
        
		guard let actionListJson = json.array else{
			//NSLog("extractActionList(json:JSON): there is an error here!")
			return nil
		}
		var actionList = [Action]()
		for element in actionListJson{
			if let action = extractAction(element){
				actionList.append(action)
			}
			
		}
		return actionList
	}



	func extractUniversalPrice(json:JSON) -> UniversalPrice?{
	
		var universalPrice = UniversalPrice()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return universalPrice
		}

		if let id = json["id"].string {
			universalPrice.id = id
		}
		universalPrice.sku = extractSku(json["sku"])
		if let price = json["price"].int {
			universalPrice.price = price
		}
		if let version = json["version"].int {
			universalPrice.version = version
		}


		return universalPrice
	}
	
	func extractUniversalPriceList(json:JSON) -> [UniversalPrice]?{
        
		
        
		guard let universalPriceListJson = json.array else{
			//NSLog("extractUniversalPriceList(json:JSON): there is an error here!")
			return nil
		}
		var universalPriceList = [UniversalPrice]()
		for element in universalPriceListJson{
			if let universalPrice = extractUniversalPrice(element){
				universalPriceList.append(universalPrice)
			}
			
		}
		return universalPriceList
	}



	func extractContractPrice(json:JSON) -> ContractPrice?{
	
		var contractPrice = ContractPrice()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return contractPrice
		}

		if let id = json["id"].string {
			contractPrice.id = id
		}
		if let contractId = json["contractId"].string {
			contractPrice.contractId = contractId
		}
		contractPrice.sku = extractSku(json["sku"])
		if let price = json["price"].int {
			contractPrice.price = price
		}
		contractPrice.review = extractContractPriceReview(json["review"])
		contractPrice.approval = extractContractPriceApproval(json["approval"])
		if let version = json["version"].int {
			contractPrice.version = version
		}


		return contractPrice
	}
	
	func extractContractPriceList(json:JSON) -> [ContractPrice]?{
        
		
        
		guard let contractPriceListJson = json.array else{
			//NSLog("extractContractPriceList(json:JSON): there is an error here!")
			return nil
		}
		var contractPriceList = [ContractPrice]()
		for element in contractPriceListJson{
			if let contractPrice = extractContractPrice(element){
				contractPriceList.append(contractPrice)
			}
			
		}
		return contractPriceList
	}



	func extractContractPriceApproval(json:JSON) -> ContractPriceApproval?{
	
		var contractPriceApproval = ContractPriceApproval()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return contractPriceApproval
		}

		if let id = json["id"].string {
			contractPriceApproval.id = id
		}
		if let who = json["who"].string {
			contractPriceApproval.who = who
		}
		if let approveTime = json["approveTime"].date {
			contractPriceApproval.approveTime = approveTime
		}
		if let remark = json["remark"].string {
			contractPriceApproval.remark = remark
		}
		if let version = json["version"].int {
			contractPriceApproval.version = version
		}
		//Extract one to many list here
		contractPriceApproval.contractPriceList    =	extractContractPriceList(json["contractPriceList"])


		return contractPriceApproval
	}
	
	func extractContractPriceApprovalList(json:JSON) -> [ContractPriceApproval]?{
        
		
        
		guard let contractPriceApprovalListJson = json.array else{
			//NSLog("extractContractPriceApprovalList(json:JSON): there is an error here!")
			return nil
		}
		var contractPriceApprovalList = [ContractPriceApproval]()
		for element in contractPriceApprovalListJson{
			if let contractPriceApproval = extractContractPriceApproval(element){
				contractPriceApprovalList.append(contractPriceApproval)
			}
			
		}
		return contractPriceApprovalList
	}



	func extractContractPriceReview(json:JSON) -> ContractPriceReview?{
	
		var contractPriceReview = ContractPriceReview()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return contractPriceReview
		}

		if let id = json["id"].string {
			contractPriceReview.id = id
		}
		if let who = json["who"].string {
			contractPriceReview.who = who
		}
		if let reviewTime = json["reviewTime"].date {
			contractPriceReview.reviewTime = reviewTime
		}
		if let remark = json["remark"].string {
			contractPriceReview.remark = remark
		}
		if let version = json["version"].int {
			contractPriceReview.version = version
		}
		//Extract one to many list here
		contractPriceReview.contractPriceList    =	extractContractPriceList(json["contractPriceList"])


		return contractPriceReview
	}
	
	func extractContractPriceReviewList(json:JSON) -> [ContractPriceReview]?{
        
		
        
		guard let contractPriceReviewListJson = json.array else{
			//NSLog("extractContractPriceReviewList(json:JSON): there is an error here!")
			return nil
		}
		var contractPriceReviewList = [ContractPriceReview]()
		for element in contractPriceReviewListJson{
			if let contractPriceReview = extractContractPriceReview(element){
				contractPriceReviewList.append(contractPriceReview)
			}
			
		}
		return contractPriceReviewList
	}



	func extractUniversalPriceApproval(json:JSON) -> UniversalPriceApproval?{
	
		var universalPriceApproval = UniversalPriceApproval()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return universalPriceApproval
		}

		if let id = json["id"].string {
			universalPriceApproval.id = id
		}
		if let who = json["who"].string {
			universalPriceApproval.who = who
		}
		if let approveTime = json["approveTime"].date {
			universalPriceApproval.approveTime = approveTime
		}
		if let remark = json["remark"].string {
			universalPriceApproval.remark = remark
		}
		if let version = json["version"].int {
			universalPriceApproval.version = version
		}


		return universalPriceApproval
	}
	
	func extractUniversalPriceApprovalList(json:JSON) -> [UniversalPriceApproval]?{
        
		
        
		guard let universalPriceApprovalListJson = json.array else{
			//NSLog("extractUniversalPriceApprovalList(json:JSON): there is an error here!")
			return nil
		}
		var universalPriceApprovalList = [UniversalPriceApproval]()
		for element in universalPriceApprovalListJson{
			if let universalPriceApproval = extractUniversalPriceApproval(element){
				universalPriceApprovalList.append(universalPriceApproval)
			}
			
		}
		return universalPriceApprovalList
	}



	func extractUniversalPriceReview(json:JSON) -> UniversalPriceReview?{
	
		var universalPriceReview = UniversalPriceReview()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return universalPriceReview
		}

		if let id = json["id"].string {
			universalPriceReview.id = id
		}
		if let who = json["who"].string {
			universalPriceReview.who = who
		}
		if let reviewTime = json["reviewTime"].date {
			universalPriceReview.reviewTime = reviewTime
		}
		if let remark = json["remark"].string {
			universalPriceReview.remark = remark
		}
		if let version = json["version"].int {
			universalPriceReview.version = version
		}


		return universalPriceReview
	}
	
	func extractUniversalPriceReviewList(json:JSON) -> [UniversalPriceReview]?{
        
		
        
		guard let universalPriceReviewListJson = json.array else{
			//NSLog("extractUniversalPriceReviewList(json:JSON): there is an error here!")
			return nil
		}
		var universalPriceReviewList = [UniversalPriceReview]()
		for element in universalPriceReviewListJson{
			if let universalPriceReview = extractUniversalPriceReview(element){
				universalPriceReviewList.append(universalPriceReview)
			}
			
		}
		return universalPriceReviewList
	}



	func extractFixRiceSkuPromotion(json:JSON) -> FixRiceSkuPromotion?{
	
		var fixRiceSkuPromotion = FixRiceSkuPromotion()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return fixRiceSkuPromotion
		}

		if let id = json["id"].string {
			fixRiceSkuPromotion.id = id
		}
		fixRiceSkuPromotion.sku = extractSku(json["sku"])
		if let rules = json["rules"].string {
			fixRiceSkuPromotion.rules = rules
		}
		if let priceTo = json["priceTo"].double {
			fixRiceSkuPromotion.priceTo = priceTo
		}
		if let version = json["version"].int {
			fixRiceSkuPromotion.version = version
		}


		return fixRiceSkuPromotion
	}
	
	func extractFixRiceSkuPromotionList(json:JSON) -> [FixRiceSkuPromotion]?{
        
		
        
		guard let fixRiceSkuPromotionListJson = json.array else{
			//NSLog("extractFixRiceSkuPromotionList(json:JSON): there is an error here!")
			return nil
		}
		var fixRiceSkuPromotionList = [FixRiceSkuPromotion]()
		for element in fixRiceSkuPromotionListJson{
			if let fixRiceSkuPromotion = extractFixRiceSkuPromotion(element){
				fixRiceSkuPromotionList.append(fixRiceSkuPromotion)
			}
			
		}
		return fixRiceSkuPromotionList
	}



	func extractInventory(json:JSON) -> Inventory?{
	
		var inventory = Inventory()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return inventory
		}

		if let id = json["id"].string {
			inventory.id = id
		}
		inventory.sku = extractSku(json["sku"])
		inventory.warehouse = extractWarehouse(json["warehouse"])
		if let stockLevel = json["stockLevel"].int {
			inventory.stockLevel = stockLevel
		}
		if let preorderable = json["preorderable"].int {
			inventory.preorderable = preorderable
		}
		if let backorderable = json["backorderable"].int {
			inventory.backorderable = backorderable
		}
		if let version = json["version"].int {
			inventory.version = version
		}


		return inventory
	}
	
	func extractInventoryList(json:JSON) -> [Inventory]?{
        
		
        
		guard let inventoryListJson = json.array else{
			//NSLog("extractInventoryList(json:JSON): there is an error here!")
			return nil
		}
		var inventoryList = [Inventory]()
		for element in inventoryListJson{
			if let inventory = extractInventory(element){
				inventoryList.append(inventory)
			}
			
		}
		return inventoryList
	}



	func extractWarehouse(json:JSON) -> Warehouse?{
	
		var warehouse = Warehouse()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return warehouse
		}

		if let id = json["id"].string {
			warehouse.id = id
		}
		if let displayName = json["displayName"].string {
			warehouse.displayName = displayName
		}
		if let location = json["location"].string {
			warehouse.location = location
		}
		if let owner = json["owner"].string {
			warehouse.owner = owner
		}
		if let version = json["version"].int {
			warehouse.version = version
		}
		//Extract one to many list here
		warehouse.inventoryList        =	extractInventoryList(json["inventoryList"])


		return warehouse
	}
	
	func extractWarehouseList(json:JSON) -> [Warehouse]?{
        
		
        
		guard let warehouseListJson = json.array else{
			//NSLog("extractWarehouseList(json:JSON): there is an error here!")
			return nil
		}
		var warehouseList = [Warehouse]()
		for element in warehouseListJson{
			if let warehouse = extractWarehouse(element){
				warehouseList.append(warehouse)
			}
			
		}
		return warehouseList
	}



	func extractSellerSite(json:JSON) -> SellerSite?{
	
		var sellerSite = SellerSite()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return sellerSite
		}

		if let id = json["id"].string {
			sellerSite.id = id
		}
		if let siteId = json["siteId"].string {
			sellerSite.siteId = siteId
		}
		sellerSite.homePage = extractHomePage(json["homePage"])
		sellerSite.catalog = extractCatalog(json["catalog"])
		sellerSite.marketing = extractMarketingLanding(json["marketing"])
		if let version = json["version"].int {
			sellerSite.version = version
		}


		return sellerSite
	}
	
	func extractSellerSiteList(json:JSON) -> [SellerSite]?{
        
		
        
		guard let sellerSiteListJson = json.array else{
			//NSLog("extractSellerSiteList(json:JSON): there is an error here!")
			return nil
		}
		var sellerSiteList = [SellerSite]()
		for element in sellerSiteListJson{
			if let sellerSite = extractSellerSite(element){
				sellerSiteList.append(sellerSite)
			}
			
		}
		return sellerSiteList
	}



	func extractHomePage(json:JSON) -> HomePage?{
	
		var homePage = HomePage()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return homePage
		}

		if let id = json["id"].string {
			homePage.id = id
		}
		if let title = json["title"].string {
			homePage.title = title
		}
		if let ver = json["ver"].string {
			homePage.ver = ver
		}
		if let version = json["version"].int {
			homePage.version = version
		}
		//Extract one to many list here
		homePage.sellerSiteList       =	extractSellerSiteList(json["sellerSiteList"])
		homePage.headerList           =	extractHeaderList(json["headerList"])
		homePage.naviList             =	extractNaviList(json["naviList"])
		homePage.bannerList           =	extractBannerList(json["bannerList"])
		homePage.footerList           =	extractFooterList(json["footerList"])


		return homePage
	}
	
	func extractHomePageList(json:JSON) -> [HomePage]?{
        
		
        
		guard let homePageListJson = json.array else{
			//NSLog("extractHomePageList(json:JSON): there is an error here!")
			return nil
		}
		var homePageList = [HomePage]()
		for element in homePageListJson{
			if let homePage = extractHomePage(element){
				homePageList.append(homePage)
			}
			
		}
		return homePageList
	}



	func extractMarketingLanding(json:JSON) -> MarketingLanding?{
	
		var marketingLanding = MarketingLanding()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return marketingLanding
		}

		if let id = json["id"].string {
			marketingLanding.id = id
		}
		if let title = json["title"].string {
			marketingLanding.title = title
		}
		if let version = json["version"].int {
			marketingLanding.version = version
		}
		//Extract one to many list here
		marketingLanding.sellerSiteList       =	extractSellerSiteList(json["sellerSiteList"])
		marketingLanding.marketingBannerList  =	extractMarketingBannerList(json["marketingBannerList"])


		return marketingLanding
	}
	
	func extractMarketingLandingList(json:JSON) -> [MarketingLanding]?{
        
		
        
		guard let marketingLandingListJson = json.array else{
			//NSLog("extractMarketingLandingList(json:JSON): there is an error here!")
			return nil
		}
		var marketingLandingList = [MarketingLanding]()
		for element in marketingLandingListJson{
			if let marketingLanding = extractMarketingLanding(element){
				marketingLandingList.append(marketingLanding)
			}
			
		}
		return marketingLandingList
	}



	func extractMarketingBanner(json:JSON) -> MarketingBanner?{
	
		var marketingBanner = MarketingBanner()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return marketingBanner
		}

		if let id = json["id"].string {
			marketingBanner.id = id
		}
		marketingBanner.parent = extractMarketingLanding(json["parent"])
		if let image = json["image"].string {
			marketingBanner.image = image
		}
		if let link = json["link"].string {
			marketingBanner.link = link
		}
		if let version = json["version"].int {
			marketingBanner.version = version
		}


		return marketingBanner
	}
	
	func extractMarketingBannerList(json:JSON) -> [MarketingBanner]?{
        
		
        
		guard let marketingBannerListJson = json.array else{
			//NSLog("extractMarketingBannerList(json:JSON): there is an error here!")
			return nil
		}
		var marketingBannerList = [MarketingBanner]()
		for element in marketingBannerListJson{
			if let marketingBanner = extractMarketingBanner(element){
				marketingBannerList.append(marketingBanner)
			}
			
		}
		return marketingBannerList
	}



	func extractHeader(json:JSON) -> Header?{
	
		var header = Header()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return header
		}

		if let id = json["id"].string {
			header.id = id
		}
		header.page = extractHomePage(json["page"])
		if let image = json["image"].string {
			header.image = image
		}
		if let action = json["action"].string {
			header.action = action
		}
		if let version = json["version"].int {
			header.version = version
		}


		return header
	}
	
	func extractHeaderList(json:JSON) -> [Header]?{
        
		
        
		guard let headerListJson = json.array else{
			//NSLog("extractHeaderList(json:JSON): there is an error here!")
			return nil
		}
		var headerList = [Header]()
		for element in headerListJson{
			if let header = extractHeader(element){
				headerList.append(header)
			}
			
		}
		return headerList
	}



	func extractNavi(json:JSON) -> Navi?{
	
		var navi = Navi()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return navi
		}

		if let id = json["id"].string {
			navi.id = id
		}
		navi.page = extractHomePage(json["page"])
		if let image = json["image"].string {
			navi.image = image
		}
		if let action = json["action"].string {
			navi.action = action
		}
		if let version = json["version"].int {
			navi.version = version
		}


		return navi
	}
	
	func extractNaviList(json:JSON) -> [Navi]?{
        
		
        
		guard let naviListJson = json.array else{
			//NSLog("extractNaviList(json:JSON): there is an error here!")
			return nil
		}
		var naviList = [Navi]()
		for element in naviListJson{
			if let navi = extractNavi(element){
				naviList.append(navi)
			}
			
		}
		return naviList
	}



	func extractBanner(json:JSON) -> Banner?{
	
		var banner = Banner()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return banner
		}

		if let id = json["id"].string {
			banner.id = id
		}
		banner.page = extractHomePage(json["page"])
		if let image = json["image"].string {
			banner.image = image
		}
		if let action = json["action"].string {
			banner.action = action
		}
		if let version = json["version"].int {
			banner.version = version
		}


		return banner
	}
	
	func extractBannerList(json:JSON) -> [Banner]?{
        
		
        
		guard let bannerListJson = json.array else{
			//NSLog("extractBannerList(json:JSON): there is an error here!")
			return nil
		}
		var bannerList = [Banner]()
		for element in bannerListJson{
			if let banner = extractBanner(element){
				bannerList.append(banner)
			}
			
		}
		return bannerList
	}



	func extractFooter(json:JSON) -> Footer?{
	
		var footer = Footer()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return footer
		}

		if let id = json["id"].string {
			footer.id = id
		}
		footer.page = extractHomePage(json["page"])
		if let image = json["image"].string {
			footer.image = image
		}
		if let action = json["action"].string {
			footer.action = action
		}
		if let version = json["version"].int {
			footer.version = version
		}


		return footer
	}
	
	func extractFooterList(json:JSON) -> [Footer]?{
        
		
        
		guard let footerListJson = json.array else{
			//NSLog("extractFooterList(json:JSON): there is an error here!")
			return nil
		}
		var footerList = [Footer]()
		for element in footerListJson{
			if let footer = extractFooter(element){
				footerList.append(footer)
			}
			
		}
		return footerList
	}



	func extractCatalog(json:JSON) -> Catalog?{
	
		var catalog = Catalog()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return catalog
		}

		if let id = json["id"].string {
			catalog.id = id
		}
		if let displayName = json["displayName"].string {
			catalog.displayName = displayName
		}
		if let sellerId = json["sellerId"].string {
			catalog.sellerId = sellerId
		}
		if let version = json["version"].int {
			catalog.version = version
		}
		//Extract one to many list here
		catalog.sellerSiteList       =	extractSellerSiteList(json["sellerSiteList"])
		catalog.levelOneCatList      =	extractLevelOneCatList(json["levelOneCatList"])


		return catalog
	}
	
	func extractCatalogList(json:JSON) -> [Catalog]?{
        
		
        
		guard let catalogListJson = json.array else{
			//NSLog("extractCatalogList(json:JSON): there is an error here!")
			return nil
		}
		var catalogList = [Catalog]()
		for element in catalogListJson{
			if let catalog = extractCatalog(element){
				catalogList.append(catalog)
			}
			
		}
		return catalogList
	}



	func extractLevelOneCat(json:JSON) -> LevelOneCat?{
	
		var levelOneCat = LevelOneCat()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return levelOneCat
		}

		if let id = json["id"].string {
			levelOneCat.id = id
		}
		levelOneCat.catalog = extractCatalog(json["catalog"])
		if let displayName = json["displayName"].string {
			levelOneCat.displayName = displayName
		}
		if let version = json["version"].int {
			levelOneCat.version = version
		}
		//Extract one to many list here
		levelOneCat.levelTwoCatList      =	extractLevelTwoCatList(json["levelTwoCatList"])


		return levelOneCat
	}
	
	func extractLevelOneCatList(json:JSON) -> [LevelOneCat]?{
        
		
        
		guard let levelOneCatListJson = json.array else{
			//NSLog("extractLevelOneCatList(json:JSON): there is an error here!")
			return nil
		}
		var levelOneCatList = [LevelOneCat]()
		for element in levelOneCatListJson{
			if let levelOneCat = extractLevelOneCat(element){
				levelOneCatList.append(levelOneCat)
			}
			
		}
		return levelOneCatList
	}



	func extractLevelTwoCat(json:JSON) -> LevelTwoCat?{
	
		var levelTwoCat = LevelTwoCat()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return levelTwoCat
		}

		if let id = json["id"].string {
			levelTwoCat.id = id
		}
		levelTwoCat.parentCat = extractLevelOneCat(json["parentCat"])
		if let displayName = json["displayName"].string {
			levelTwoCat.displayName = displayName
		}
		if let version = json["version"].int {
			levelTwoCat.version = version
		}
		//Extract one to many list here
		levelTwoCat.levelThreeCatList    =	extractLevelThreeCatList(json["levelThreeCatList"])


		return levelTwoCat
	}
	
	func extractLevelTwoCatList(json:JSON) -> [LevelTwoCat]?{
        
		
        
		guard let levelTwoCatListJson = json.array else{
			//NSLog("extractLevelTwoCatList(json:JSON): there is an error here!")
			return nil
		}
		var levelTwoCatList = [LevelTwoCat]()
		for element in levelTwoCatListJson{
			if let levelTwoCat = extractLevelTwoCat(element){
				levelTwoCatList.append(levelTwoCat)
			}
			
		}
		return levelTwoCatList
	}



	func extractLevelThreeCat(json:JSON) -> LevelThreeCat?{
	
		var levelThreeCat = LevelThreeCat()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return levelThreeCat
		}

		if let id = json["id"].string {
			levelThreeCat.id = id
		}
		levelThreeCat.parentCat = extractLevelTwoCat(json["parentCat"])
		if let displayName = json["displayName"].string {
			levelThreeCat.displayName = displayName
		}
		if let version = json["version"].int {
			levelThreeCat.version = version
		}
		//Extract one to many list here
		levelThreeCat.levelFourCatList     =	extractLevelFourCatList(json["levelFourCatList"])
		levelThreeCat.levelNCatList        =	extractLevelNCatList(json["levelNCatList"])


		return levelThreeCat
	}
	
	func extractLevelThreeCatList(json:JSON) -> [LevelThreeCat]?{
        
		
        
		guard let levelThreeCatListJson = json.array else{
			//NSLog("extractLevelThreeCatList(json:JSON): there is an error here!")
			return nil
		}
		var levelThreeCatList = [LevelThreeCat]()
		for element in levelThreeCatListJson{
			if let levelThreeCat = extractLevelThreeCat(element){
				levelThreeCatList.append(levelThreeCat)
			}
			
		}
		return levelThreeCatList
	}



	func extractLevelFourCat(json:JSON) -> LevelFourCat?{
	
		var levelFourCat = LevelFourCat()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return levelFourCat
		}

		if let id = json["id"].string {
			levelFourCat.id = id
		}
		levelFourCat.parentCat = extractLevelThreeCat(json["parentCat"])
		if let displayName = json["displayName"].string {
			levelFourCat.displayName = displayName
		}
		if let version = json["version"].int {
			levelFourCat.version = version
		}
		//Extract one to many list here
		levelFourCat.levelFiveCatList     =	extractLevelFiveCatList(json["levelFiveCatList"])


		return levelFourCat
	}
	
	func extractLevelFourCatList(json:JSON) -> [LevelFourCat]?{
        
		
        
		guard let levelFourCatListJson = json.array else{
			//NSLog("extractLevelFourCatList(json:JSON): there is an error here!")
			return nil
		}
		var levelFourCatList = [LevelFourCat]()
		for element in levelFourCatListJson{
			if let levelFourCat = extractLevelFourCat(element){
				levelFourCatList.append(levelFourCat)
			}
			
		}
		return levelFourCatList
	}



	func extractLevelFiveCat(json:JSON) -> LevelFiveCat?{
	
		var levelFiveCat = LevelFiveCat()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return levelFiveCat
		}

		if let id = json["id"].string {
			levelFiveCat.id = id
		}
		levelFiveCat.parentCat = extractLevelFourCat(json["parentCat"])
		if let displayName = json["displayName"].string {
			levelFiveCat.displayName = displayName
		}
		if let version = json["version"].int {
			levelFiveCat.version = version
		}


		return levelFiveCat
	}
	
	func extractLevelFiveCatList(json:JSON) -> [LevelFiveCat]?{
        
		
        
		guard let levelFiveCatListJson = json.array else{
			//NSLog("extractLevelFiveCatList(json:JSON): there is an error here!")
			return nil
		}
		var levelFiveCatList = [LevelFiveCat]()
		for element in levelFiveCatListJson{
			if let levelFiveCat = extractLevelFiveCat(element){
				levelFiveCatList.append(levelFiveCat)
			}
			
		}
		return levelFiveCatList
	}



	func extractLevelNCat(json:JSON) -> LevelNCat?{
	
		var levelNCat = LevelNCat()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return levelNCat
		}

		if let id = json["id"].string {
			levelNCat.id = id
		}
		levelNCat.parentCat = extractLevelThreeCat(json["parentCat"])
		if let displayName = json["displayName"].string {
			levelNCat.displayName = displayName
		}
		if let version = json["version"].int {
			levelNCat.version = version
		}
		//Extract one to many list here
		levelNCat.productList          =	extractProductList(json["productList"])


		return levelNCat
	}
	
	func extractLevelNCatList(json:JSON) -> [LevelNCat]?{
        
		
        
		guard let levelNCatListJson = json.array else{
			//NSLog("extractLevelNCatList(json:JSON): there is an error here!")
			return nil
		}
		var levelNCatList = [LevelNCat]()
		for element in levelNCatListJson{
			if let levelNCat = extractLevelNCat(element){
				levelNCatList.append(levelNCat)
			}
			
		}
		return levelNCatList
	}



	func extractProduct(json:JSON) -> Product?{
	
		var product = Product()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return product
		}

		if let id = json["id"].string {
			product.id = id
		}
		if let displayName = json["displayName"].string {
			product.displayName = displayName
		}
		product.parentCat = extractLevelNCat(json["parentCat"])
		product.brand = extractBrand(json["brand"])
		if let origin = json["origin"].string {
			product.origin = origin
		}
		if let remark = json["remark"].string {
			product.remark = remark
		}
		if let version = json["version"].int {
			product.version = version
		}
		//Extract one to many list here
		product.skuList              =	extractSkuList(json["skuList"])


		return product
	}
	
	func extractProductList(json:JSON) -> [Product]?{
        
		
        
		guard let productListJson = json.array else{
			//NSLog("extractProductList(json:JSON): there is an error here!")
			return nil
		}
		var productList = [Product]()
		for element in productListJson{
			if let product = extractProduct(element){
				productList.append(product)
			}
			
		}
		return productList
	}



	func extractSku(json:JSON) -> Sku?{
	
		var sku = Sku()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return sku
		}

		if let id = json["id"].string {
			sku.id = id
		}
		if let displayName = json["displayName"].string {
			sku.displayName = displayName
		}
		if let size = json["size"].string {
			sku.size = size
		}
		sku.product = extractProduct(json["product"])
		if let active = json["active"].bool {
			sku.active = active
		}
		if let version = json["version"].int {
			sku.version = version
		}
		//Extract one to many list here
		sku.universalPriceList   =	extractUniversalPriceList(json["universalPriceList"])
		sku.contractPriceList    =	extractContractPriceList(json["contractPriceList"])
		sku.fixRiceSkuPromotionList =	extractFixRiceSkuPromotionList(json["fixRiceSkuPromotionList"])
		sku.inventoryList        =	extractInventoryList(json["inventoryList"])


		return sku
	}
	
	func extractSkuList(json:JSON) -> [Sku]?{
        
		
        
		guard let skuListJson = json.array else{
			//NSLog("extractSkuList(json:JSON): there is an error here!")
			return nil
		}
		var skuList = [Sku]()
		for element in skuListJson{
			if let sku = extractSku(element){
				skuList.append(sku)
			}
			
		}
		return skuList
	}



	func extractBrand(json:JSON) -> Brand?{
	
		var brand = Brand()
		/* Need to find another way to process object
		guard let json = json else{
			NSLog("There is an error here! The JSON object is nil or type is error")
			return nil
		}
		*/
		if json == nil{
			return brand
		}

		if let id = json["id"].string {
			brand.id = id
		}
		if let brandName = json["brandName"].string {
			brand.brandName = brandName
		}
		if let logo = json["logo"].string {
			brand.logo = logo
		}
		if let remark = json["remark"].string {
			brand.remark = remark
		}
		if let version = json["version"].int {
			brand.version = version
		}
		//Extract one to many list here
		brand.productList          =	extractProductList(json["productList"])


		return brand
	}
	
	func extractBrandList(json:JSON) -> [Brand]?{
        
		
        
		guard let brandListJson = json.array else{
			//NSLog("extractBrandList(json:JSON): there is an error here!")
			return nil
		}
		var brandList = [Brand]()
		for element in brandListJson{
			if let brand = extractBrand(element){
				brandList.append(brand)
			}
			
		}
		return brandList
	}



}





