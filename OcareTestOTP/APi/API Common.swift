
import Foundation
import RxCocoa
import RxSwift

let apiUrl = "https://www.oserio.com/testcht/appapi.php?action=".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

//https://www.oserio.com/testcht/appapi.php?action=
//https://www.oserio.com/cht/appapi.php?action=
enum Action : String{
    case
    newLogin = "newlogin",
    verifycode = "verifycode",
    resendverifycode = "resendverifycode",
    Login = "login",
    Register = "register",
    Forget = "forget",
    GetData = "getdata",
    Datamodify = "datamodify",
    Passmodify = "passmodify",
    Getgoalindex = "getgoalindex",
    Goalindexmodify = "goalindexmodify",
    Getcommonindex = "getcommonindex",
    Commonindexupload = "commonindexupload",
    Getbpressureindex = "getbpressureindex",
    Bpressureindexupload = "bpressureindexupload",
    Getweightindex = "getweightindex",
    Weightindexupload = "weightindexupload",
    indexDel = "indexDel",
    aioget = "aioget",
    aiodel = "aiodel",
    Forget2 = "forget2",
    aioupload = "aioupload"
}

func getApiAction(actionKey: Action) -> String{
    switch actionKey {
    case .newLogin:
        return apiUrl! + actionKey.rawValue
    case .verifycode:
        return apiUrl! + actionKey.rawValue
    case .resendverifycode:
        return apiUrl! + actionKey.rawValue
    case .Login:
        return apiUrl! + actionKey.rawValue
    case .Register:
        return apiUrl! + actionKey.rawValue
    case .Forget:
        return apiUrl! + actionKey.rawValue
    case .GetData :
        return apiUrl! + actionKey.rawValue
    case .Datamodify :
        return apiUrl! + actionKey.rawValue
    case .Passmodify :
        return apiUrl! + actionKey.rawValue
    case .Getgoalindex :
        return apiUrl! + actionKey.rawValue
    case .Goalindexmodify :
        return apiUrl! + actionKey.rawValue
    case .Getcommonindex :
        return apiUrl! + actionKey.rawValue
    case .Commonindexupload :
        return apiUrl! + actionKey.rawValue
    case .Getbpressureindex :
        return apiUrl! + actionKey.rawValue
    case .Bpressureindexupload :
        return apiUrl! + actionKey.rawValue
    case .Getweightindex :
        return apiUrl! + actionKey.rawValue
    case .Weightindexupload :
        return apiUrl! + actionKey.rawValue
    case .indexDel :
        return apiUrl! + actionKey.rawValue
    case .aioget :
        return apiUrl! + actionKey.rawValue
    case .aioupload :
        return apiUrl! + actionKey.rawValue
    case .Forget2 :
        return apiUrl! + actionKey.rawValue
    case .aiodel :
        return apiUrl! + actionKey.rawValue
    }
    
}

func setRequest(_ url_server: URL, _ requestParam: [String: String]) -> URLRequest{
    var request = URLRequest(url: url_server)
    request.httpMethod = "POST"
    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData
    
    var urlComponents = URLComponents()
    var items = [URLQueryItem]()
    for param in requestParam {

        items.append(URLQueryItem(name: param.key, value: param.value))
    }
    urlComponents.queryItems = items
    
    request.httpBody = urlComponents.query?.data(using: .utf8)
    
    return request
}

func executeTask(_ url_server: URL, _ requestParam: [String: String], completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
    // 將輸出資料列印出來除錯用
    var request = URLRequest(url: url_server)
    request.httpMethod = "POST"
    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData
    
    var urlComponents = URLComponents()
    var items = [URLQueryItem]()
    for param in requestParam {

        items.append(URLQueryItem(name: param.key, value: param.value))
    }
    urlComponents.queryItems = items
    
    request.httpBody = urlComponents.query?.data(using: .utf8)
    
    let sessionData = URLSession.shared
    let task = sessionData.dataTask(with: request, completionHandler: completionHandler)
    
    task.resume()
}

func getDeleteBody(table : Table , id :String) -> [String:String] {
    var body : [String:String] = [String:String]()
    body["table"] = table.rawValue
    body["id"] = id
    
    return body
}

enum Table : String {
    case
    Weight_index = "weight_index",
    Common_index = "common_index",
    Bpressure_index = "bpressure_index"
    
}
//    print("output: \(requestParam)")
    
//    let jsonData = try! JSONEncoder().encode(requestParam)

//        urlComponents.queryItems = []
