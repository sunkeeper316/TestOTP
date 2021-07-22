
import Foundation

struct CommonindexuploadBody {
    var token: String?
    var date: String?
    var time: String?
    var localid = "1"
    var bmr: String?
    var bodyfat: String?
    var visceralfat: String?
    var body_age: String?
    var muscule_rate: String?
    var bone_mass: String?
    var body_water: String?
    var steps: String?  //身體得分  in 1
    var calorie_out: String? // 蛋白質量　in 0.001kg
    var calorie_in: String? //骨骼肌率 in 0.01%
    var Protein : String?
    var Health_Score : String?
    var SMM : String?
    var family_id : String?
    var d_s1 : String?
    var d_s2 : String?
    var d_s3 : String?
    var Reserved_1 : String?
    
    func getBody() -> [String:String]{
        var body : [String:String] = [String:String]()
        body["token"] = token
        body["date"] = date
        body["time"] = time
        body["localid"] = localid
        body["bmr"] = bmr
        body["bodyfat"] = bodyfat
        body["visceralfat"] = visceralfat
        body["body_age"] = body_age
        body["muscule_rate"] = muscule_rate
        body["bone_mass"] = bone_mass
        body["body_water"] = body_water
        body["steps"] = steps
        body["calorie_out"] = calorie_out
        body["calorie_in"] = calorie_in
        body["Health_Score"] = Health_Score
        body["SMM"] = SMM
        body["Protein"] = Protein
        body["Reserved_1"] = Reserved_1
        body["d_s1"] = d_s1
        body["d_s2"] = d_s2
        body["d_s3"] = d_s3
        
        return body
    }
    
}
