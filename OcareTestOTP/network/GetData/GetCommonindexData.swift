
import Foundation

class GetCommonindexData:Codable{
    var error: Int?
    var data : [CommonGetData]?
    
}
class GetCommonindexOneData:Codable{
    var error: Int?
    var data : CommonGetData?
    
}
class CommonGetData:Codable {
    var id : String?
    var date : String?
    var time : String?
    var steps : String? //身體得分  in 1
    var m_id : String?
    var calorie_out : String? // 蛋白質量　in 0.001kg
    var calorie_in : String? //骨骼肌率 in 0.01%
    var waistline : String?
    var bodyfat : String?
    var visceralfat : String?
    var d_s1 : String?
    var d_s2 : String?
    var d_s3 : String?
    var del : String?
    var bmr : String?
    var temperature : String?
    var family_id : String?
    var week_metsmin : String?
    var Protein : String?
    var Health_Score : String?
    var SMM : String?
    var Reserved_1 : String?
    
    var judge_bodyfat : String?
    var judge_visceralfat : String?
    var judge_temp : String?
    var createdate : String?
    var body_water : String?
    var bone_mass : String?
    var body_age : String?
    var muscule_rate : String?
    
}
