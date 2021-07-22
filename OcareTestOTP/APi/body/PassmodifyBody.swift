

import Foundation

struct PassmodifyBody {
    var token: String?
    var m_user_name: String?
    var m_password1: String?
    var m_password2: String?
    var m_password3: String?
    
    func getBody() -> [String:String]{
        var body : [String:String] = [String:String]()
        body["token"] = token
        body["m_password1"] = m_password1
        body["m_password2"] = m_password2
        body["m_password3"] = m_password3
        
        return body
    }
    
}
