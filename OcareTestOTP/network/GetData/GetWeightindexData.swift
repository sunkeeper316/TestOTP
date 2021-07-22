

import Foundation

class GetWeightindexData:Codable{
    var error: Int?
    var data : [WeightGetData]?
    
    
}
class GetWeightindexOneData:Codable{
    var error: Int?
    var data : WeightGetData?
    
}
class WeightGetData:Codable {
    var id : String?
    var date : String?
    var time : String?
    var m_id : String?
    var weight : String?
    var family_id : String?
    var judge_weight : String?
    var del : String?
    var createdate : String?
    var d_s1 : String?
    var d_s2 : String?
    var d_s3 : String?
    var bmi : String?
    
}
