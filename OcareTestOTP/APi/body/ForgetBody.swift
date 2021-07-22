

import Foundation

struct ForgetBody {
    var token: String?
    var m_user_name: String?
    
    
    func getBody() -> [String:String]{
        var body : [String:String] = [String:String]()
        body["m_user_name"] = m_user_name
        
        
        return body
    }
    
}
