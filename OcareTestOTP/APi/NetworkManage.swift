import RxCocoa
import RxSwift

import Foundation

class NetworkManage : NSObject {
    
    static var shared = NetworkManage()
    
    let decoder = JSONDecoder()
    
    let disposeBag = DisposeBag()
    
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
    func newRegister(m_user_name:String , m_lang:String) -> Observable<ResponseData> {
        var log : [String:String] = [String:String]()
        log["m_user_name"] = m_user_name
        log["m_lang"] = m_lang
        print(m_user_name)
        return Observable<ResponseData>.create { [unowned self] (observer) -> Disposable in
            let task = URLSession.shared.dataTask(with: setRequest(
                                                    URL(string:getApiAction(actionKey: .newLogin))! ,log)) {data, _, error in
                guard error == nil else {
                    observer.onError(error!)
                    print("error \(error!.localizedDescription)")
                    return
                }
                if let data = data {
                    if let result = try? decoder.decode(ResponseData.self, from: data) {
                        observer.onNext(result)
                        observer.onCompleted()
                    }
                }
            }
            task.resume()
            return Disposables.create{
                print("結束register")
                task.cancel()
            }
        }
    }
    func register(m_user_name:String , m_password :String? , fb_uid :String?) -> Observable<ResponseData>{
        var log : [String:String] = [String:String]()
        if let m_password = m_password {
            log["m_password"] = m_password
        }else if let fb_uid = fb_uid {
            log["fb_uid"] = fb_uid
        }
        log["m_user_name"] = m_user_name
        return Observable<ResponseData>.create { [unowned self] (observer) -> Disposable in
            let task = URLSession.shared.dataTask(with: setRequest(URL(string: getApiAction(actionKey: .Register))!, log)) {data, _, error in
                guard error == nil else {
                    observer.onError(error!)
                    print("error \(error!.localizedDescription)")
                    return
                }
                if let data = data {
                    if let result = try? decoder.decode(ResponseData.self, from: data) {
                        observer.onNext(result)
                        observer.onCompleted()
                    }
                }
            }
            task.resume()
            return Disposables.create{
                print("結束register")
                task.cancel()
            }
        }
    }
    func register(m_user_name:String  , fb_uid :String?) -> Observable<ResponseData>{
        var log : [String:String] = [String:String]()
        log["fb_uid"] = fb_uid
        log["m_user_name"] = m_user_name
        return Observable<ResponseData>.create { [unowned self] (observer) -> Disposable in
            let task = URLSession.shared.dataTask(with: setRequest(URL(string: getApiAction(actionKey: .Register))!, log)) {data, _, error in
                guard error == nil else {
                    observer.onError(error!)
                    print("error \(error!.localizedDescription)")
                    return
                }
                if let data = data {
                    if let result = try? decoder.decode(ResponseData.self, from: data) {
                        observer.onNext(result)
                        observer.onCompleted()
                    }
                }
            }
            task.resume()
            return Disposables.create{
                print("結束register")
                task.cancel()
            }
        }
    }
    func login(m_user_name:String  , fb_uid :String?) -> Observable<ResponseData>{
        var log : [String:String] = [String:String]()
        log["fb_uid"] = fb_uid
        log["m_user_name"] = m_user_name
        return Observable<ResponseData>.create { [unowned self] (observer) -> Disposable in
            let task = URLSession.shared.dataTask(with: setRequest(URL(string: getApiAction(actionKey: .Login))!, log)) {data, _, error in
                guard error == nil else {
                    observer.onError(error!)
                    print("error \(error!.localizedDescription)")
                    return
                }
                if let data = data {
                    if let result = try? decoder.decode(ResponseData.self, from: data) {
                        if let error = result.error {
                            switch error {
                            case 0:
                                observer.onNext(result)
                                observer.onCompleted()
                            default:
                                observer.onCompleted()
                                break
                                
//                                observer = register(m_user_name:m_user_name  , fb_uid :fb_uid)
                            }
                            
                        }
                        
                    }
                }
            }
            task.resume()
            return Disposables.create{
                print("結束login")
                task.cancel()
            }
        }
    }
    func login(m_user_name:String , m_password :String? , fb_uid :String?) -> Observable<ResponseData>{
        var log : [String:String] = [String:String]()
        if let m_password = m_password {
            log["m_password"] = m_password
        }else if let fb_uid = fb_uid {
            log["fb_uid"] = fb_uid
        }
        log["m_user_name"] = m_user_name
        return Observable<ResponseData>.create { [unowned self] (observer) -> Disposable in
            let task = URLSession.shared.dataTask(with: setRequest(URL(string: getApiAction(actionKey: .Login))!, log)) {data, _, error in
                guard error == nil else {
                    observer.onError(error!)
                    print("error \(error!.localizedDescription)")
                    return
                }
                if let data = data {
                    if let result = try? decoder.decode(ResponseData.self, from: data) {
                        observer.onNext(result)
                        observer.onCompleted()
                    }
                }
            }
            task.resume()
            return Disposables.create{
                print("結束login")
                task.cancel()
            }
        }
    }
    func forget(m_user_name:String) -> Observable<ResponseData>{
        var log : [String:String] = [String:String]()
        log["m_user_name"] = m_user_name
        return Observable<ResponseData>.create { (observer) -> Disposable in
            let task = URLSession.shared.dataTask(with: self.setRequest(URL(string: getApiAction(actionKey: .Forget))!, log)) {data, _, error in
                guard error == nil else {
                    observer.onError(error!)
                    print("error \(error!.localizedDescription)")
                    return
                }
                if let data = data {
                    if let result = try? self.decoder.decode(ResponseData.self, from: data) {
                        observer.onNext(result)
                        observer.onCompleted()
                    }
                }
            }
            task.resume()
            return Disposables.create{
                print("結束forget")
                task.cancel()
            }
        }
    }
    //忘記密碼
    func forget2(m_user_name:String) -> Observable<ResponseData>{
        var log : [String:String] = [String:String]()
        log["m_user_name"] = m_user_name
        return Observable<ResponseData>.create { [unowned self] (observer) -> Disposable in
            let task = URLSession.shared.dataTask(with: setRequest(URL(string: getApiAction(actionKey: .Forget2))!, log)) {data, _, error in
                guard error == nil else {
                    observer.onError(error!)
                    print("error \(error!.localizedDescription)")
                    return
                }
                if let data = data {
                    if let result = try? decoder.decode(ResponseData.self, from: data) {
                        observer.onNext(result)
                        observer.onCompleted()
                    }
                }
            }
            task.resume()
            return Disposables.create{
                print("結束forget2")
                task.cancel()
            }
        }
    }
    func uploadDatamodify(datamodifyBody:DatamodifyBody) -> Observable<ResponseData>{
        return Observable<ResponseData>.create { [unowned self] (observer) -> Disposable in
            let task = URLSession.shared.dataTask(with: setRequest(URL(string: getApiAction(actionKey: .Datamodify))!, datamodifyBody.getBody())) {data, _, error in
                guard error == nil else {
                    observer.onError(error!)
                    print("error \(error!.localizedDescription)")
                    return
                }
                if let data = data {
                    if let result = try? decoder.decode(ResponseData.self, from: data) {
                        observer.onNext(result)
                        observer.onCompleted()
                    }
                }
            }
            task.resume()
            return Disposables.create{
                print("結束uploadDatamodify")
                task.cancel()
            }
        }
    }
    func passmodify(passmodifyBody:PassmodifyBody) -> Observable<ResponseData>{
        return Observable<ResponseData>.create { (observer) -> Disposable in
            URLSession.shared.rx.data(request: self.setRequest(URL(string: getApiAction(actionKey: .Passmodify))!, passmodifyBody.getBody()))
                .subscribe(onNext : { [self] data in
                    decoder.dataDecodingStrategy = .deferredToData
                    if let result = try? decoder.decode(ResponseData.self, from: data) {
                        observer.onNext(result)
                        observer.onCompleted()
                    }
                } , onError : { error in
                    print(error.localizedDescription)
                    observer.onError(error)
                    
                }).disposed(by: self.disposeBag)
            return Disposables.create{
                print("結束login")
            }
        }
    }
    //取得使用者資料
    func getuserData(token : String) -> Observable<GetUserData>{
        var getBody = GetDataBody()
        getBody.token = token
        return Observable<GetUserData>.create { [unowned self] (observer) -> Disposable in
            let task = URLSession.shared.dataTask(with: setRequest(URL(string: getApiAction(actionKey: .GetData))!, getBody.getBodyOnlyToken())) {data, _, error in
                guard error == nil else {
                    observer.onError(error!)
                    print("error \(error!.localizedDescription)")
                    return
                }
                if let data = data {
                    if let result = try? decoder.decode(GetUserData.self, from: data) {
                        observer.onNext(result)
                        observer.onCompleted()
                    }
                }
            }
            task.resume()
            return Disposables.create{
                print("結束getuserData")
                task.cancel()
            }
        }
    }
    
//    func uploadAiogetupload(result:ResultData) -> Observable<ResponseData>{
//
//        let token = currentAccount?.password ?? ""
//        let dateformatter = DateFormatter()
//        dateformatter.dateFormat = "yyyy-MM-dd"
//        let uploadDate = result.date ?? Date()
//        let date = dateformatter.string(from: uploadDate)
//        dateformatter.dateFormat = "HH:mm:ss"
//        let time = dateformatter.string(from: uploadDate)
//
//        var aiogetuploadBody = AiogetuploadBody()
//        aiogetuploadBody.date = date
//        aiogetuploadBody.time = time
//        aiogetuploadBody.token = token
//
//        aiogetuploadBody.Reserved_1 = "30001"
//        aiogetuploadBody.d_s2 = result.peripheralName
//        aiogetuploadBody.d_s1 = "2"
//        aiogetuploadBody.d_s3 = "\(UIDevice.modelName) \(UIDevice.current.systemVersion)"
//
//        let functions = result.functions?.allObjects as! [FunctionData]
//        for f in functions {
//            switch f.funcId {
//            case 0:
//                aiogetuploadBody.weight = String(format:"%.1f", f.number)
//            case 1:
//                if getSafeNumberForBar(function: f).isValid {
//                    let number = getSafeNumberForBar(function: f).number
//                    aiogetuploadBody.bmi = number
//                }else{
//                    aiogetuploadBody.bmi = "-1"
//                }
//
//            case 2:
//                //                print("體脂肪\(f.number)")
//                if getSafeNumberForBar(function: f).isValid {
//                    let number = getSafeNumberForBar(function: f).number
//                    aiogetuploadBody.bodyfat = number
//                }else{
//                    aiogetuploadBody.bodyfat = "-1"
//                }
//                //                print("體脂肪\(commonBody.bodyfat)")
//                break
//            case 3:
//                //bmr
//                if getSafeNumberForBar(function: f).isValid {
//                    let number = getSafeNumberForBar(function: f).number
//                    aiogetuploadBody.bmr = number
//                }else{
//                    aiogetuploadBody.bmr = "-1"
//                }
//                break
//            case 4:
//                //vatLv
//                if getSafeNumberForBar(function: f).isValid {
//                    var number = getSafeNumberForBar(function: f).number
//                    print("vat\(number)")
//                    if result.peripheralName == "FTG-315" {
//                        number = String((Double(number) ?? 0) * 10)
//                        print("vat 10 \(number)")
//                    }
//
//                    aiogetuploadBody.visceralfat = number
////                            print("commonBody.visceralfat\(aiogetuploadBody.visceralfat)")
//                }else{
//                    aiogetuploadBody.visceralfat = "-1"
//                }
//                break
//            case 5:
//                //musclemass
//                if getSafeNumberForBar(function: f).isValid {
//                    let number = getSafeNumberForBar(function: f).number
//                    aiogetuploadBody.muscule_rate = number
//                }else{
//                    aiogetuploadBody.muscule_rate = "-1"
//                }
//                break
//            case 7:
//                //BoneMass
//                if getSafeNumberForBar(function: f).isValid {
//                    let number = getSafeNumberForBar(function: f).number
//                    aiogetuploadBody.bone_mass = number
//                }else{
//                    aiogetuploadBody.bone_mass = "-1"
//                }
//                break
//            case 8:
//                //bodyAge
//                if getSafeNumberForBar(function: f).isValid {
//                    let number = getSafeNumberForBar(function: f).number
//                    aiogetuploadBody.body_age = number
//                }else{
//                    aiogetuploadBody.body_age = "-1"
//                }
//                break
//            case 9:
//                //heartRate
//                if getSafeNumberForBar(function: f).isValid {
//                    let number = getSafeNumberForBar(function: f).number
//                    aiogetuploadBody.pulse = number
//                }else{
//                    aiogetuploadBody.pulse = "-1"
//                }
//                break
//            case 10:
//                //body water
//                //                let number = getSafeNumberForBar(function: f).number
//                //                commonBody.body_water = number
//                break
//            case 11:
//                //smm
//                if getSafeNumberForBar(function: f).isValid {
//                    let number = getSafeNumberForBar(function: f).number
//                    aiogetuploadBody.SMM = String(format:"%.0f", (Double(number) ?? 0) * 10)
////                    print("commonBody.SMM\(commonBody.SMM)")
//                }else{
//                    aiogetuploadBody.SMM = "-1"
//                }
//                break
//            case 14:
//                //protein
//                if getSafeNumberForBar(function: f).isValid {
//                    let number = getSafeNumberForBar(function: f).number
//                    let Protein = (Double(number) ?? 0) * 10
//                    aiogetuploadBody.Protein = String(format:"%.0f", Protein)
////                    print("commonBody.Protein\(commonBody.Protein)")
//                }else{
//                    aiogetuploadBody.Protein = "-1"
//                }
//
//                break
//            case 15:
//                //healthScore
//                if getSafeNumberForBar(function: f).isValid {
//                    let number = getSafeNumberForBar(function: f).number
//                    aiogetuploadBody.Health_Score = number
//                }else{
//                    aiogetuploadBody.Health_Score = "-1"
//                }
//
//                break
//            case 16:
//                //body waterMass
//                if getSafeNumberForBar(function: f).isValid {
//                    let number = getSafeNumberForBar(function: f).number
//                    aiogetuploadBody.body_water = number
//                }else{
//                    aiogetuploadBody.body_water = "-1"
//                }
//
//                break
//            default:
//                break
//            }
//        }
        
//        return Observable<ResponseData>.create { [unowned self] (observer) -> Disposable in
//            let task = URLSession.shared.dataTask(with: setRequest(URL(string: getApiAction(actionKey: .aioupload))!, aiogetuploadBody.getBody())) {data, _, error in
//                guard error == nil else {
//                    observer.onError(error!)
//                    print("error \(error!.localizedDescription)")
//                    return
//                }
//                if let data = data {
//                    if let result = try? decoder.decode(ResponseData.self, from: data) {
//                        observer.onNext(result)
//                        observer.onCompleted()
//                    }
//                }
//            }
//            task.resume()
//            return Disposables.create{
//                print("結束uploadAiogetupload")
//                task.cancel()
//            }
//
//        }
//    }
//    //取得量測紀錄
//    func getAiogetData(getDataBody:GetDataBody) -> Observable<[AiogetData]>{
//
//        return Observable<[AiogetData]>.create { [unowned self] (observer) -> Disposable in
//            let task = URLSession.shared.dataTask(with: setRequest(URL(string: getApiAction(actionKey: .aioget))!, getDataBody.getBody())) {data, _, error in
//                guard error == nil else {
//                    observer.onError(error!)
//                    print("error \(error!.localizedDescription)")
//                    return
//                }
//                if let data = data {
//                    if let result = try? decoder.decode(GetAiogetData.self, from: data) {
//                        observer.onNext(result.data ?? [])
//                        observer.onCompleted()
//                    }else if let result = try? decoder.decode(GetAiogetOneData.self, from: data) {
//                        if let data = result.data {
//                            observer.onNext([data])
//                            observer.onCompleted()
//                        }
//                    }else{
//                        observer.onNext([])
//                        observer.onCompleted()
//                    }
//                }
//            }
//            task.resume()
//            return Disposables.create{
//                print("結束getAiogetData")
//                task.cancel()
//            }
//        }
//    }
//    func deleteResultData(result:ResultData) -> Observable<ResponseData>{
//        var delbody = AiodelBody()
//        let df = DateFormatter()
//        df.dateFormat = "yyyy-MM-dd"
//        print(currentAccount?.password)
//        let uploadDate = result.date ?? Date()
//        let date = df.string(from: uploadDate)
//        df.dateFormat = "HH:mm:ss"
//        let time = df.string(from: uploadDate)
//        delbody.token = currentAccount?.password ?? ""
//        delbody.date = date
//        delbody.time = time
//        return Observable<ResponseData>.create { [unowned self] observer -> Disposable in
//            let task = URLSession.shared.dataTask(with: setRequest(URL(string: getApiAction(actionKey: .aiodel))!, delbody.getBody())) {data, _, error in
//                guard error == nil else {
//                    observer.onError(error!)
//                    print("error \(error!.localizedDescription)")
//                    return
//                }
//                if let data = data {
//                    if let result = try? decoder.decode(ResponseData.self, from: data) {
//                        observer.onNext(result)
//                        observer.onCompleted()
//                    }
//                }
//            }
//            task.resume()
//            return Disposables.create{
//                print("結束delete")
//                task.cancel()
//            }
//        }
//    }
}
