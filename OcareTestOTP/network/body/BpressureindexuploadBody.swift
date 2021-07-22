
import Foundation

struct BpressureindexuploadBody {
    var token: String?
    var date: String?
    var time: String?
    var localid = "1"
    var pulse: String? //心率 脈搏
    var d_s1 : String?
    var d_s2 : String?
    var d_s3 : String?
    
    func getBody() -> [String:String]{
        var body : [String:String] = [String:String]()
        body["token"] = token
        body["date"] = date
        body["time"] = time
        body["localid"] = localid
        body["pulse"] = pulse
        body["d_s1"] = d_s1
        body["d_s2"] = d_s2
        body["d_s3"] = d_s3
        
        return body
    }
    
}
