

import Foundation

class GetAiogetData : Codable{
    var error: Int?
    var data : [AiogetData]?
}
class GetAiogetOneData : Codable{
    var error: Int?
    var data : AiogetData?
}
class AiogetData:Codable {
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
    var steps : String? //身體得分  in 1
    var calorie_out : String? // 蛋白質量　in 0.001kg
    var calorie_in : String? //骨骼肌率 in 0.01%
    var waistline : String?
    var bodyfat : String?
    var visceralfat : String?
    var bmr : String?
    var temperature : String?
    var week_metsmin : String?
    var Protein : String?
    var Health_Score : String?
    var SMM : String?
    var Reserved_1 : String?
    
    var judge_bodyfat : String?
    var judge_visceralfat : String?
    var judge_temp : String?
    var body_water : String?
    var bone_mass : String?
    var body_age : String?
    var muscule_rate : String?
    var pulse : String?
}

//"id": "401851",
//    "date": "2020-06-23",
//    "m_id": "17502",
//    "steps": "0",
//    "calorie_out": "0",
//    "calorie_in": "0",
//    "waistline": "0.0",
//    "bodyfat": "22.0",
//    "visceralfat": "8",
//    "bmr": "2035",
//    "temperature": "0.0",
//    "family_id": "0",
//    "del": "0",
//    "week_metsmin": "0",
//    "time": "14:19:29",
//    "judge_bodyfat": null,
//    "judge_visceralfat": null,
//    "judge_temp": null,
//    "createdate": "2020-06-23 14:19:30",
//    "d_s1": null,
//    "d_s2": null,
//    "d_s3": null,
//    "body_water": "49.9",
//    "bone_mass": "3.5",
//    "body_age": "37",
//    "muscule_rate": "65.4",
//    "Protein": "0",
//    "Health_Score": "0",
//    "SMM": "41",
//    "Reserved_1": "0",
//    "Reserved_2": "0",
//    "Reserved_3": "0",
//    "Reserved_4": "0",
//    "Reserved_5": "0",
//    "systolic": "0",
//    "diastolic": "0",
//    "pulse": "0",
//    "judge_bp": null

