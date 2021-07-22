
import Foundation

struct DatamodifyBody {
    var token: String?
    var m_nickname: String?
    var m_birthday: String?
    var m_tall: String?
    var m_sex: String?
    var m_email:String?
    
    func getBody() -> [String:String]{
        var body : [String:String] = [String:String]()
        body["token"] = token
        body["m_nickname"] = m_nickname
        body["m_birthday"] = m_birthday
        body["m_tall"] = m_tall
        body["m_sex"] = m_sex
        body["m_email"] = m_email
        
        return body
    }
    
}
