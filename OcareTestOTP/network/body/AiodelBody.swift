

import Foundation

struct AiodelBody {
    var token: String?
    var date: String?
    var time: String?
    
    func getBody() -> [String:String]{
        var body : [String:String] = [String:String]()
        body["token"] = token
        body["date"] = date
        body["time"] = time
        
        return body
    }
    func getBodyForRebase() -> [String:String]{
        var body : [String:String] = [String:String]()
        body["token"] = token
        body["date"] = date
        body["time"] = time
        body["rebase"] = "1"
        
        return body
    }
    
    
    
}
