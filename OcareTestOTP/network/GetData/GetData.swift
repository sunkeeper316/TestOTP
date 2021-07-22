import Foundation

class GetUserData:Codable{
    var error: Int?
    var data : GetData?
    
    class GetData:Codable {
        var mc_id : String?
        var m_id : String?
        var fb_uid : String?
        var fb_uid1 : String?
        var fb_uid2 : String?
        var fb_uid_flag : String?
        var m_status : String?
        var m_account : String?
        var m_nickname : String?
        var m_user_name : String?
        var m_fname : String?
        var m_modifydate : String?
        var m_createdate : String?
        var m_email : String?
        
        var m_birthday : String?
        var m_tall : String?  //身高
        var m_sex : String?     //性別 男 1 女 2
        var m_avatar : String?
        var token : String?
    }
    
}
