
import Foundation

struct GetDataBody {
    var token: String?
    var start_date = "2010-01-01"
    var end_date : String?
    
    func getBody() -> [String:String]{
        var body : [String:String] = [String:String]()
        body["token"] = token
        body["start_date"] = start_date
        body["end_date"] = end_date
        
        return body
    }
    
    func getBodyOnlyToken() -> [String:String] {
        var body : [String:String] = [String:String]()
        body["token"] = token
        return body
    }
}
