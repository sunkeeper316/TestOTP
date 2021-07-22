
import UIKit
import Foundation

func passmodify(passmodifyBody:PassmodifyBody , completionHandler: @escaping (ResponseData?, Error?) -> Void) {
    executeTask(URL(string: getApiAction(actionKey: .Passmodify))!,passmodifyBody.getBody()){(data, response, error) in
        if let error = error {
            completionHandler(nil,error)
            return
        }
        if let data = data {
            let decoder = JSONDecoder()
            decoder.dataDecodingStrategy = .deferredToData
            if let result = try? decoder.decode(ResponseData.self, from: data) {
                //                print(result)
                completionHandler(result,nil)
            }
        }
    }
}

//func login(m_user_name:String , m_password :String? , fb_uid :String? ,  completionHandler: @escaping (ResponseData?, Error?) -> Void){
//    var log : [String:String] = [String:String]()
//    if let m_password = m_password {
//        log["m_password"] = m_password
//    }else if let fb_uid = fb_uid {
//        log["fb_uid"] = fb_uid
//        //        print(log[fb_uid])
//    }
//    log["m_user_name"] = m_user_name
//    //    print(log[m_user_name])
//
//    executeTask(URL(string: getApiAction(actionKey: .Login))!,log){(data, response, error) in
//        if let error = error {
//            completionHandler(nil,error)
//            return
//        }
//        if let data = data {
//            let decoder = JSONDecoder()
//            decoder.dataDecodingStrategy = .deferredToData
//            if let result = try? decoder.decode(ResponseData.self, from: data) {
//                print(result)
//                completionHandler(result,nil)
//            }
//        }
//    }
//}
//
//func register(m_user_name:String , m_password :String? , fb_uid :String? ,  completionHandler: @escaping (ResponseData?, Error?) -> Void) {
//    var log : [String:String] = [String:String]()
//    if let m_password = m_password {
//        log["m_password"] = m_password
//    }else if let fb_uid = fb_uid {
//        log["fb_uid"] = fb_uid
//    }
//    log["m_user_name"] = m_user_name
//        let log : [String:String] = ["m_user_name":m_user_name,"m_password":m_password,"fb_uid":fb_uid ]
//    executeTask(URL(string: getApiAction(actionKey: .Register))!,log){(data, response, error) in
//        if let error = error {
//            completionHandler(nil,error)
//            return
//        }
//        if let data = data {
//            let decoder = JSONDecoder()
//            decoder.dataDecodingStrategy = .deferredToData
//            if let result = try? decoder.decode(ResponseData.self, from: data) {
//                //                print(result)
//                completionHandler(result,nil)
//            }
//        }
//    }
//}
//func forget(m_user_name:String , completionHandler: @escaping (ResponseData?, Error?) -> Void) {
//    var log : [String:String] = [String:String]()
//    log["m_user_name"] = m_user_name
//    executeTask(URL(string: getApiAction(actionKey: .Forget))!,log){(data, response, error) in
//        if let error = error {
//            completionHandler(nil,error)
//            return
//        }
//        if let data = data {
//            let decoder = JSONDecoder()
//            decoder.dataDecodingStrategy = .deferredToData
//            if let result = try? decoder.decode(ResponseData.self, from: data) {
//                //                print(result)
//                completionHandler(result,nil)
//            }
//        }
//    }
//}
//func forget2(m_user_name:String , completionHandler: @escaping (ResponseData?, Error?) -> Void) {
//    var log : [String:String] = [String:String]()
//    log["m_user_name"] = m_user_name
//    executeTask(URL(string: getApiAction(actionKey: .Forget2))!,log){(data, response, error) in
//        if let error = error {
//            completionHandler(nil,error)
//            return
//        }
//        if let data = data {
//            let decoder = JSONDecoder()
//            decoder.dataDecodingStrategy = .deferredToData
//            if let result = try? decoder.decode(ResponseData.self, from: data) {
//                //                print(result)
//                completionHandler(result,nil)
//            }
//        }
//    }
//}

//func uploadDatamodify(datamodifyBody:DatamodifyBody, completionHandler: @escaping (ResponseData?, Error?) -> Void) {
//    executeTask(URL(string: getApiAction(actionKey: .Datamodify))!,datamodifyBody.getBody()){(data, response, error) in
//        if let error = error {
//            completionHandler(nil,error)
//            return
//        }
//        if let data = data {
//            let decoder = JSONDecoder()
//            decoder.dataDecodingStrategy = .deferredToData
//            if let result = try? decoder.decode(ResponseData.self, from: data){
//                completionHandler(result,nil)
//                print("修改結果\(result.error)")
//            }
//
//        }
//    }
//}
//func uploadWeightindex(weightindexuploadBody:WeightindexuploadBody, completionHandler: @escaping (ResponseData?, Error?) -> Void) {
//    executeTask(URL(string: getApiAction(actionKey: .Weightindexupload))!,weightindexuploadBody.getBody()){(data, response, error) in
//        if let error = error {
//            completionHandler(nil,error)
//            return
//        }
//        if let data = data {
//            let decoder = JSONDecoder()
//            decoder.dataDecodingStrategy = .deferredToData
//            if let result = try? decoder.decode(ResponseData.self, from: data){
//                completionHandler(result,nil)
//            }
//        }
//    }
//}
//func uploadCommonindex(commonindexuploadBody:CommonindexuploadBody, completionHandler: @escaping (ResponseData?, Error?) -> Void) {
//    executeTask(URL(string: getApiAction(actionKey: .Commonindexupload))!,commonindexuploadBody.getBody()){(data, response, error) in
//        if let error = error {
//            completionHandler(nil,error)
//            return
//        }
//        if let data = data {
//            let decoder = JSONDecoder()
//            decoder.dataDecodingStrategy = .deferredToData
//            if let result = try? decoder.decode(ResponseData.self, from: data){
//                completionHandler(result,nil)
//            }
//
//        }
//    }
//}
//func uploadBpressureindex(bpressureindexuploadBody:BpressureindexuploadBody, completionHandler: @escaping (ResponseData?, Error?) -> Void) {
//    executeTask(URL(string: getApiAction(actionKey: .Bpressureindexupload))!,bpressureindexuploadBody.getBody()){(data, response, error) in
//        if let error = error {
//            completionHandler(nil,error)
//            return
//        }
//        if let data = data {
//            let decoder = JSONDecoder()
//            decoder.dataDecodingStrategy = .deferredToData
//            if let result = try? decoder.decode(ResponseData.self, from: data){
//                completionHandler(result,nil)
//            }
//
//        }
//    }
//}
//
//func getuserData(body : GetDataBody , completionHandler: @escaping (GetUserData?, Error?) -> Void) {
//    executeTask(URL(string: getApiAction(actionKey: .GetData))!,body.getBodyOnlyToken()){(data, response, error) in
//        if let error = error {
//            completionHandler(nil,error)
//            return
//        }
//        if let data = data {
//            print(data)
//            let decoder = JSONDecoder()
//            decoder.dataDecodingStrategy = .deferredToData
//            if let result = try? decoder.decode(GetUserData.self, from: data){
//                completionHandler(result,nil)
//            }
//
//        }
//    }
//}
//func getcommonindex(body : GetDataBody , completionHandler: @escaping ([CommonGetData]?, Error?) -> Void) {
//    executeTask(URL(string: getApiAction(actionKey: .Getcommonindex))!,body.getBody()){(data, response, error) in
//        if let error = error {
//            print(error.localizedDescription)
//            completionHandler(nil,error)
//            return
//        }
//        if let data = data {
//            let decoder = JSONDecoder()
//            decoder.dataDecodingStrategy = .deferredToData
//            if let results = try? decoder.decode(GetCommonindexData.self, from: data){
//                if let error = results.error {
//                    switch error {
//                    case 0:
//                        completionHandler(results.data,nil)
//                    case 3:
//                        completionHandler(nil,nil)
//                    default:
//                        completionHandler(nil,nil)
//                    }
//                }
//                //                completionHandler(results,nil)
//            }else if let result = try? decoder.decode(GetCommonindexOneData.self, from: data) {
//                if let error = result.error {
//                    switch error {
//                    case 0:
//
//                        if let data = result.data {
//                            completionHandler([data],nil)
//                            return
//                        }else{
//                            completionHandler(nil,nil)
//                        }
//                    case 3:
//                        completionHandler(nil,nil)
//                    default:
//                        completionHandler(nil,nil)
//                    }
//                }
//            }else {
//                completionHandler(nil,nil)
//            }
//        }
//
//    }
//}
//func getweightindex(body : GetDataBody , completionHandler: @escaping ([WeightGetData]?, Error?) -> Void) {
//    executeTask(URL(string: getApiAction(actionKey: .Getweightindex))!,body.getBody()){(data, response, error) in
//        if let error = error {
//            print(error.localizedDescription)
//            completionHandler(nil,error)
//            return
//        }
//
//        if let data = data {
//            let decoder = JSONDecoder()
//            decoder.dataDecodingStrategy = .deferredToData
//            if let results = try? decoder.decode(GetWeightindexData.self, from: data){
//                print("體重回傳\(results)")
//                if let error = results.error {
//                    switch error {
//                    case 0:
//                        completionHandler(results.data,nil)
//                    case 3:
//                        completionHandler(nil,nil)
//                    default:
//                        completionHandler(nil,nil)
//                    }
//                }
//
//            }else if let result = try? decoder.decode(GetWeightindexOneData.self, from: data) {
//                print("體重回傳\(result)")
//                if let error = result.error {
//                    switch error {
//                    case 0:
//
//                        if let data = result.data {
//                            completionHandler([data],nil)
//                            return
//                        }else{
//                            completionHandler(nil,nil)
//                        }
//                    case 3:
//                        completionHandler(nil,nil)
//                    default:
//                        completionHandler(nil,nil)
//                    }
//                }
//
//            }else {
//                completionHandler(nil,nil)
//            }
//        }
//    }
//}
//func getBpressureindex(body : GetDataBody , completionHandler: @escaping ([BpressureGetData]?, Error?) -> Void) {
//    executeTask(URL(string: getApiAction(actionKey: .Getbpressureindex))!,body.getBody()){(data, response, error) in
//        if let error = error {
//            print(error.localizedDescription)
//            completionHandler(nil,error)
//            return
//        }
//        if let data = data {
//            let decoder = JSONDecoder()
//            decoder.dataDecodingStrategy = .deferredToData
//            if let results = try? decoder.decode(GetBpressureindexData.self, from: data){
//                if let error = results.error {
//                    switch error {
//                    case 0:
//                        completionHandler(results.data,nil)
//                    case 3:
//                        completionHandler(nil,nil)
//                    default:
//                        completionHandler(nil,nil)
//                    }
//                }
//            }else if let result = try? decoder.decode(GetBpressureindexOneData.self, from: data) {
//                if let error = result.error {
//                    switch error {
//                    case 0:
//                        if let data = result.data {
//                            completionHandler([data],nil)
//                            return
//                        }else{
//                            completionHandler(nil,nil)
//                        }
//                    case 3:
//                        completionHandler(nil,nil)
//                    default:
//                        completionHandler(nil,nil)
//                    }
//                }
//            }else {
//                completionHandler(nil,nil)
//            }
//        }
//    }
//}
//func uploadUserData(){
//        var uploadUserDatabady = DatamodifyBody()
//        loadToken()
//        uploadUserDatabady.token = token
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        uploadUserDatabady.m_nickname = currentAccount?.name
//        uploadUserDatabady.m_birthday = dateFormatter.string(from: currentAccount?.birthday ?? Date())
//        uploadUserDatabady.m_tall = String(format:"%.1f", currentAccount?.height ?? 160)
//        uploadUserDatabady.m_sex = String(Int(currentAccount?.sex ?? 0))
//
////        print("iOSmail\(iOSmail)")
////    print("iOSmail\(uploadUserDatabady.getBody())")
////        print("性別上傳\(uploadUserDatabady.m_sex)")
//        uploadDatamodify(datamodifyBody: uploadUserDatabady) { (responseData, error) in
//            if let responseData = responseData {
//                if let error = responseData.error {
//                    if error == 0 {
//                        print("iosmailok")
////                        iOSmail = nil
//                    }else{
//                        print("iosmailNG")
//                    }
//                }
//            }
//        }
//    }
//func uploadiOSMail(){
//        var uploadUserDatabady = DatamodifyBody()
//        loadToken()
//        uploadUserDatabady.token = token
//        uploadUserDatabady.m_email = iOSmail ?? ""
//        uploadDatamodify(datamodifyBody: uploadUserDatabady) { (responseData, error) in
//            if let responseData = responseData {
//                if let error = responseData.error {
//                    if error == 0 {
//                        print("iosmailok")
//                        iOSmail = nil
//                    }else{
//                        print("iosmailNG")
//                    }
//                }
//            }
//        }
//    }
//var isgetweightindex = false
//var isgetcommonindex = false
//var isgetBpressureindex = false
//
//var getDataCollation : DataCollation?
//
//
//func getResultDataindex(token:String , completionHandler: @escaping (Bool?) -> Void ){
//    getDataCollation = DataCollation()
//    isgetweightindex = false
//    isgetcommonindex = false
//    isgetBpressureindex = false
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "yyyy-MM-dd"
//
//    var getDataBody = GetDataBody()
//    getDataBody.token = token
//    getDataBody.end_date = dateFormatter.string(from: Date())
//    print("開始拿取")
//    getweightindex(body: getDataBody) { (getWeightindexData, error) in
//        if let error = error {
//            print(error.localizedDescription)
//            getDataCollation?.isGetWeightindexDataHandler?(false)
//            return
//        }
//        print("體重拿取")
//        if let getWeightindexData = getWeightindexData {
//            print("取得體重數據")
//            getDataCollation?.setGetWeightindexData(weightindexData: getWeightindexData)
//            getDataCollation?.isGetWeightindexDataHandler?(true)
//        }
//    }
//
//    getcommonindex(body: getDataBody) { (getCommonindexData, error) in
//        print("取得一般數據")
//        if let error = error {
//            print(error.localizedDescription)
//            getDataCollation?.isGetCommonindexDataHandler?(false)
//            return
//        }
//        print("一般拿取")
//        if let getCommonindexData = getCommonindexData {
//            getDataCollation?.setGetCommonindexData(commonindexData: getCommonindexData)
//            getDataCollation?.isGetCommonindexDataHandler?(true)
//
//        }
//    }
//
//    getBpressureindex(body: getDataBody) { (getBpressureindexData, error) in
//        print("取得心律數據")
//        if let error = error {
//            print(error.localizedDescription)
//            getDataCollation?.isGetBpressureindexDataHandler?(false)
//            return
//        }
//        print("心律拿取")
//        if let getBpressureindexData = getBpressureindexData {
//            getDataCollation?.setGetBpressureindexData(bpressureindexData: getBpressureindexData)
//            getDataCollation?.isGetBpressureindexDataHandler?(true)
//        }
//    }
//
//    getDataCollation?.checkReady(completionHandler: { (isReady) in
//        completionHandler(isReady)
//    })
//
//}
//func getResultDataId(token:String, completionHandler: @escaping (Bool?) -> Void){
//    var getDataBody = GetDataBody()
//    getDataBody.token = token
//
//}
//
//func deleteResultDataUpload(result:ResultData , completionHandler: @escaping (ResponseData?, Error?) -> Void){
//
//    let weightDeleteBody = getDeleteBody(table : .Weight_index , id :result.weightId ?? "")
//    executeTask(URL(string: getApiAction(actionKey: .indexDel))!, weightDeleteBody ) {(data, response, error) in
//        if let error = error {
//            print(error.localizedDescription)
//            completionHandler(nil,error)
//            return
//        }
//        if let data = data {
//            let decoder = JSONDecoder()
//            decoder.dataDecodingStrategy = .deferredToData
//            if let result = try? decoder.decode(ResponseData.self, from: data){
//                print("刪除結果\(result.error ?? -1)")
//                completionHandler(result,nil)
//            }
//
//        }
//    }
//    let commonDeleteBody = getDeleteBody(table : .Common_index , id :result.commonId ?? "")
//    executeTask(URL(string: getApiAction(actionKey: .indexDel))!, commonDeleteBody ) {(data, response, error) in
//        if let error = error {
//            print(error.localizedDescription)
//            completionHandler(nil,error)
//            return
//        }
//        if let data = data {
//            let decoder = JSONDecoder()
//            decoder.dataDecodingStrategy = .deferredToData
//            if let result = try? decoder.decode(ResponseData.self, from: data){
//                print("刪除結果\(result.error ?? -1)")
//                completionHandler(result,nil)
//            }
//
//        }
//    }
//    let bpressureDeleteBody = getDeleteBody(table : .Bpressure_index , id :result.bpressureId ?? "")
//    executeTask(URL(string: getApiAction(actionKey: .indexDel))!, bpressureDeleteBody ) {(data, response, error) in
//        if let error = error {
//            print(error.localizedDescription)
//            completionHandler(nil,error)
//            return
//        }
//        if let data = data {
//            let decoder = JSONDecoder()
//            decoder.dataDecodingStrategy = .deferredToData
//            if let result = try? decoder.decode(ResponseData.self, from: data){
//                print("刪除結果\(result.error ?? -1)")
//                completionHandler(result,nil)
//            }
//
//        }
//    }
//}
//
//func uploadResultData(result:ResultData , completionHandler: @escaping (ResponseData?, Error?) -> Void){
//    if let currentAccount = currentAccount {
//        token = currentAccount.password ?? ""
//        let dateformatter = DateFormatter()
//        dateformatter.dateFormat = "yyyy-MM-dd"
//        let uploadDate = result.date ?? Date()
//        let date = dateformatter.string(from: uploadDate)
//        dateformatter.dateFormat = "HH:mm:ss"
//        let time = dateformatter.string(from: uploadDate)
//
//
//        var weightBody = WeightindexuploadBody()
//        var commonBody = CommonindexuploadBody()
//        var bpressure = BpressureindexuploadBody()
//        weightBody.date = date
//        weightBody.time = time
//        weightBody.token = token
//        weightBody.d_s2 = result.peripheralName
//        weightBody.d_s1 = "2"
//        weightBody.d_s3 = "\(UIDevice.modelName) \(UIDevice.current.systemVersion)"
//
//        //        print("秤體：\(weightBody.d_s2)")
//
//        commonBody.date = date
//        commonBody.time = time
//        commonBody.token = token
//        commonBody.Reserved_1 = "30001"
//        commonBody.d_s2 = result.peripheralName
//        commonBody.d_s1 = "2"
//        commonBody.d_s3 = "\(UIDevice.modelName) \(UIDevice.current.systemVersion)"
//
//        bpressure.date = date
//        bpressure.time = time
//        bpressure.d_s2 = result.peripheralName
//        bpressure.d_s1 = "2"
//        bpressure.d_s3 = "\(UIDevice.modelName) \(UIDevice.current.systemVersion)"
//        bpressure.token = token
//
//        let functions = result.functions?.allObjects as! [FunctionData]
//        for f in functions {
//            switch f.funcId {
//            case 0:
//                weightBody.weight = String(format:"%.1f", f.number)
//            case 1:
//                if getSafeNumberForBar(function: f).isValid {
//                    let number = getSafeNumberForBar(function: f).number
//                    weightBody.bmi = number
//                }else{
//                    weightBody.bmi = "-1"
//                }
//
//            case 2:
//                //                print("體脂肪\(f.number)")
//                if getSafeNumberForBar(function: f).isValid {
//                    let number = getSafeNumberForBar(function: f).number
//                    commonBody.bodyfat = number
//                }else{
//                    commonBody.bodyfat = "-1"
//                }
//                //                print("體脂肪\(commonBody.bodyfat)")
//                break
//            case 3:
//                //bmr
//                if getSafeNumberForBar(function: f).isValid {
//                    let number = getSafeNumberForBar(function: f).number
//                    commonBody.bmr = number
//                }else{
//                    commonBody.bmr = "-1"
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
//                    commonBody.visceralfat = number
//                    print("commonBody.visceralfat\(commonBody.visceralfat)")
//                }else{
//                    commonBody.visceralfat = "-1"
//                }
//                break
//            case 5:
//                //musclemass
//                if getSafeNumberForBar(function: f).isValid {
//                    let number = getSafeNumberForBar(function: f).number
//                    commonBody.muscule_rate = number
//                }else{
//                    commonBody.muscule_rate = "-1"
//                }
//                break
//            case 7:
//                //BoneMass
//                if getSafeNumberForBar(function: f).isValid {
//                    let number = getSafeNumberForBar(function: f).number
//                    commonBody.bone_mass = number
//                }else{
//                    commonBody.bone_mass = "-1"
//                }
//                break
//            case 8:
//                //bodyAge
//                if getSafeNumberForBar(function: f).isValid {
//                    let number = getSafeNumberForBar(function: f).number
//                    commonBody.body_age = number
//                }else{
//                    commonBody.body_age = "-1"
//                }
//                break
//            case 9:
//                //heartRate
//                if getSafeNumberForBar(function: f).isValid {
//                    let number = getSafeNumberForBar(function: f).number
//                    bpressure.pulse = number
//                }else{
//                    bpressure.pulse = "-1"
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
//                    commonBody.SMM = String(format:"%.0f", (Double(number) ?? 0) * 10)
////                    print("commonBody.SMM\(commonBody.SMM)")
//                }else{
//                    commonBody.SMM = "-1"
//                }
//                break
//            case 14:
//                //protein
//                if getSafeNumberForBar(function: f).isValid {
//                    let number = getSafeNumberForBar(function: f).number
//                    let Protein = (Double(number) ?? 0) * 10
//                    commonBody.Protein = String(format:"%.0f", Protein)
////                    print("commonBody.Protein\(commonBody.Protein)")
//                }else{
//                    commonBody.Protein = "-1"
//                }
//
//                break
//            case 15:
//                //healthScore
//                if getSafeNumberForBar(function: f).isValid {
//                    let number = getSafeNumberForBar(function: f).number
//                    commonBody.Health_Score = number
//                }else{
//                    commonBody.Health_Score = "-1"
//                }
//
//                break
//            case 16:
//                //body waterMass
//                if getSafeNumberForBar(function: f).isValid {
//                    let number = getSafeNumberForBar(function: f).number
//                    commonBody.body_water = number
//                }else{
//                    commonBody.body_water = "-1"
//                }
//
//                break
//            default:
//                break
//            }
//        }
//
//        uploadWeightindex(weightindexuploadBody: weightBody) { (responseData, error) in
//            if let error = error {
//                completionHandler(nil,error)
//                return
//            }
//            if let responseData = responseData {
//                completionHandler(responseData,nil)
//                if let error = responseData.error {
//                    print("上傳結果：\(error)")
//                    switch error {
//                    case 0:
//                        print("上傳成功")
//                        var getDataBody = GetDataBody()
//                        getDataBody.token = token
//                        executeTask(URL(string: getApiAction(actionKey: .Getweightindex))!,getDataBody.getBodyOnlyToken()){(data, response, error) in
//                            if let error = error {
//                                print(error.localizedDescription)
//                                completionHandler(nil,error)
//                                return
//                            }
//                            if let data = data {
//                                let decoder = JSONDecoder()
//                                decoder.dataDecodingStrategy = .deferredToData
//                                if let resultResponse = try? decoder.decode(GetWeightindexOneData.self, from: data){
//                                    switch resultResponse.error ?? -1 {
//                                    case 0:
//
//                                        if let data = resultResponse.data {
//                                            if date == data.date , time == data.time {
//                                                result.weightId = data.id
//                                                print("回傳重量id成功:\(data.id)")
//                                                DispatchQueue.main.async {
//                                                    updateAccountStatus()
//                                                }
//
//                                            }
//
//                                        }else{
//
//                                        }
//                                    case 3:
//                                        print("token NG")
//                                    default:
//                                        print("token NG")
//                                    }
//                                }
//                            }
//                        }
//                        uploadCommonindex(commonindexuploadBody: commonBody) { (responseData, error) in
//                            if let error = error {
//                                print(error.localizedDescription)
//                            }
//                            if let error = responseData?.error {
//                                print("上傳結果：\(error)")
//                                if error == 0 {
//                                    executeTask(URL(string: getApiAction(actionKey: .Getcommonindex))!,getDataBody.getBodyOnlyToken()){(data, response, error) in
//                                        if let error = error {
//                                            print(error.localizedDescription)
//                                            completionHandler(nil,error)
//                                            return
//                                        }
//                                        if let data = data {
//                                            let decoder = JSONDecoder()
//                                            decoder.dataDecodingStrategy = .deferredToData
//                                            if let resultResponse = try? decoder.decode(GetCommonindexOneData.self, from: data){
//                                                switch resultResponse.error ?? -1 {
//                                                case 0:
//
//                                                    if let data = resultResponse.data {
//                                                        if date == data.date , time == data.time {
//                                                            result.commonId = data.id
//                                                            print("回傳重量id成功:\(data.id)")
//                                                            DispatchQueue.main.async {
//                                                                updateAccountStatus()
//                                                            }
//                                                        }
//
//                                                    }else{
//
//                                                    }
//                                                case 3:
//                                                    print("token NG")
//                                                default:
//                                                    print("token NG")
//                                                }
//                                            }
//                                        }
//                                    }
//                                }
//                            }
//                        }
//                        uploadBpressureindex(bpressureindexuploadBody: bpressure) { (responseData, error) in
//                            if let error = error {
//                                print(error.localizedDescription)
//                            }
//                            if let error = responseData?.error {
//                                print("心率上傳結果：\(error)")
//                                if error == 0 {
//                                    executeTask(URL(string: getApiAction(actionKey: .Getbpressureindex))!,getDataBody.getBodyOnlyToken()){(data, response, error) in
//                                        if let error = error {
//                                            print(error.localizedDescription)
//                                            completionHandler(nil,error)
//                                            return
//                                        }
//                                        if let data = data {
//                                            let decoder = JSONDecoder()
//                                            decoder.dataDecodingStrategy = .deferredToData
//                                            if let resultResponse = try? decoder.decode(GetBpressureindexOneData.self, from: data){
//                                                switch resultResponse.error ?? -1 {
//                                                case 0:
//
//                                                    if let data = resultResponse.data {
//                                                        if date == data.date , time == data.time {
//                                                            result.bpressureId = data.id
//                                                            print("回傳重量id成功:\(data.id)")
//                                                            DispatchQueue.main.async {
//                                                                updateAccountStatus()
//                                                            }
//                                                        }
//
//                                                    }else{
//
//                                                    }
//                                                case 3:
//                                                    print("token NG")
//                                                default:
//                                                    print("token NG")
//                                                }
//                                            }
//                                        }
//                                    }
//                                }
//                            }
//                        }
//                    default:
//                        break
//                    }
//
//                }
//            }
//        }
//    }
//}
//public extension UIDevice {
//  static let modelName: String = {
//    var systemInfo = utsname()
//    uname(&systemInfo)
//    let machineMirror = Mirror(reflecting: systemInfo.machine)
//    let identifier = machineMirror.children.reduce("") { identifier, element in
//      guard let value = element.value as? Int8, value != 0 else { return identifier }
//      return identifier + String(UnicodeScalar(UInt8(value)))
//    }
//
//    func mapToDevice(identifier: String) -> String {
//      #if os(iOS)
//      switch identifier {
//      case "iPod5,1":                                 return "iPod Touch 5"
//      case "iPod7,1":                                 return "iPod Touch 6"
//      case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
//      case "iPhone4,1":                               return "iPhone 4s"
//      case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
//      case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
//      case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
//      case "iPhone7,2":                               return "iPhone 6"
//      case "iPhone7,1":                               return "iPhone 6 Plus"
//      case "iPhone8,1":                               return "iPhone 6s"
//      case "iPhone8,2":                               return "iPhone 6s Plus"
//      case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
//      case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
//      case "iPhone8,4":                               return "iPhone SE"
//      case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
//      case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
//      case "iPhone10,3", "iPhone10,6":                return "iPhone X"
//      case "iPhone11,2":                              return "iPhone XS"
//      case "iPhone11,4", "iPhone11,6":                return "iPhone XS Max"
//      case "iPhone11,8":                              return "iPhone XR"
//      case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
//      case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
//      case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
//      case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
//      case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
//      case "iPad6,11", "iPad6,12":                    return "iPad 5"
//      case "iPad7,5", "iPad7,6":                      return "iPad 6"
//      case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
//      case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
//      case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
//      case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
//      case "iPad6,3", "iPad6,4":                      return "iPad Pro (9.7-inch)"
//      case "iPad6,7", "iPad6,8":                      return "iPad Pro (12.9-inch)"
//      case "iPad7,1", "iPad7,2":                      return "iPad Pro (12.9-inch) (2nd generation)"
//      case "iPad7,3", "iPad7,4":                      return "iPad Pro (10.5-inch)"
//      case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":return "iPad Pro (11-inch)"
//      case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":return "iPad Pro (12.9-inch) (3rd generation)"
//      case "AppleTV5,3":                              return "Apple TV"
//      case "AppleTV6,2":                              return "Apple TV 4K"
//      case "AudioAccessory1,1":                       return "HomePod"
//      case "i386", "x86_64":                          return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
//      default:                                        return identifier
//      }
//      #elseif os(tvOS)
//      switch identifier {
//      case "AppleTV5,3": return "Apple TV 4"
//      case "AppleTV6,2": return "Apple TV 4K"
//      case "i386", "x86_64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "tvOS"))"
//      default: return identifier
//      }
//      #endif
//    }
//
//    return mapToDevice(identifier: identifier)
//  }()
//}
