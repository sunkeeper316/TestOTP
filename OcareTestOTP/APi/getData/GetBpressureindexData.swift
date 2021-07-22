

import Foundation

class GetBpressureindexData:Codable{
    var error: Int?
    var data : [BpressureGetData]?
    
}
class GetBpressureindexOneData:Codable{
    var error: Int?
    var data : BpressureGetData?
    
}
class BpressureGetData:Codable {
    var id : String?
    var date : String?
    var time : String?
    var m_id : String?
    var pulse : String?
    var del : String?
    var d_s1 : String?
    var d_s2 : String?
    var d_s3 : String?
}
