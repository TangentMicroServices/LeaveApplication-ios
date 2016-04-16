//
//  Services.swift
//  LeaveApplication
//
//  Created by Christo Crampton on 4/16/16.
//  Copyright © 2016 Tangent Solutions. All rights reserved.
//

import SwiftyJSON
import Alamofire

public class LeaveServiceAPI {
    
    let BaseURL = "http://api.tngnt.co/leaveservice"
    
    func createLeaveAplication(leaveType: String, startDate: String, endDate: String, callback: (String?, JSON?) -> ()) {
        
        let data  = [
            "leave_type": leaveType,
            "start_date": startDate,
            "end_date": endDate,
            "user": "1"
        ]
        
        
        // Specifying the Headers we need
        let headers = [
            "Content-Type": "application/json"
        ]
        
        Alamofire.request(.POST, BaseURL + "/leaveapplication/", parameters: data)
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.result)// result of response serialization
                
                print(response.data)
                
                if let data = response.data {
                    let json = JSON(data: data)
                    print(json)
                    let returnArray = json
                    callback("SUCCESS", returnArray)
                }
                
        }
    }
    
}
