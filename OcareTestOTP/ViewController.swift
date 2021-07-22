
import RxSwift
import RxCocoa
import UIKit
import FlagPhoneNumber

class ViewController: UIViewController {

    @IBOutlet weak var tfPhone: FPNTextField!
    @IBOutlet weak var tfMail: UITextField!
    
    @IBOutlet weak var tfLang: UITextField!
    
    var isPhoneValid = false
    
    var timer: Timer?
    var alert:UIAlertController!
    
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
//        tfMail.textContentType = .oneTimeCode
        tfPhone.setCountries(including: [.US,.CN,.TW,.AU,.GB,.AE,.CA,.HK,.JP,.KH,.KR,.MO,.MY,.SG,.TH,.VN,.ID,.IN,.PH])
        tfPhone.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func clickSubmit(_ sender: UIButton) {
        let phone = tfPhone.text!
        let lang = tfLang.text!
        if isPhoneValid {
            let title = "請輸入簡訊驗證碼"
            let message = "您輸入的電話號碼:\(phone)"
            NetworkManage.shared.newRegister(m_user_name: phone,m_lang: lang ).subscribe(onNext : { [unowned self] responseData in
                
                print(responseData.error)
                
            }).disposed(by: disposeBag)
            alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addTextField { textField in
                textField.placeholder = "Input OTP"
                textField.textContentType = .oneTimeCode
                textField.keyboardType = .numberPad
            }
            let action = UIAlertAction(title: "OK", style: .default) { [unowned self] action in
//                present(alert, animated: true, completion: nil)
                let code = alert.textFields!.first!.text!
                NetworkManage.shared.verifycode(m_user_name: phone, verify_code: code).subscribe(onNext: { [unowned self] responseData in
                    if responseData.error == 0 {
                        let successAlert = UIAlertController(title: "註冊成功", message: "", preferredStyle: .alert)
                        
                        DispatchQueue.main.async {
                            present(successAlert, animated: true, completion: nil)
                        }
                        
                        
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                            dismiss(animated: true, completion: nil)
                            self.view.endEditing(true)
                        }
                    }else{
                        DispatchQueue.main.async {
                            alert.message = "驗證碼輸入錯誤"
                            present(alert, animated: true, completion: nil)
                        }
                        
                    }
                }).disposed(by: disposeBag)
            }
            let actionReSend = UIAlertAction(title: "重新發送", style: .default) { [unowned self] action in
                
                alert.message = "您輸入的電話號碼:\(phone)\n已重新發送"
                alert.actions.forEach { action in
                    if action.title == "重新發送" {
                        action.isEnabled = false
                        countdown = 5
                        runCountDown()
                    }
                }
                present(alert, animated: true, completion: nil)
            }
            alert.addAction(actionReSend)
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
            
        }else{
            let alert = UIAlertController(title: "格式錯誤", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { action in
                
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    func runCountDown(){
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDownTimer), userInfo: nil, repeats: true)
        }
    }

    @objc func countDownTimer(){
        if countdown > 0 {
            countdown -= 1
            print("countdown\(countdown)")
            alert.actions.forEach { action in
                if action.isEnabled == false {
                    action.setValue("還有\(countdown)秒", forKey: "title")
                }
            }
            
        }else{
            alert.actions.forEach { action in
                if action.isEnabled == false {
                    action.setValue("重新發送", forKey: "title")
                    action.isEnabled = true
                }
            }
            timer?.invalidate()
            timer = nil
        }
    }
    
    @IBAction func clickEmail(_ sender: UIButton) {
        let mail = tfMail.text!
        let lang = tfLang.text!
        NetworkManage.shared.newRegister(m_user_name: mail,m_lang: lang ).subscribe(onNext : { [unowned self] responseData in
            
            print(responseData.error)
            
        }).disposed(by: disposeBag)
        let alert = UIAlertController(title: "請輸入簡訊驗證碼", message: "", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Input OTP"
            textField.textContentType = .oneTimeCode
        }
        let action = UIAlertAction(title: "OK", style: .default) { action in
            
        }
        let actionReSend = UIAlertAction(title: "重新發送", style: .default) { action in
            
        }
        
        alert.addAction(action)
        alert.addAction(actionReSend)
        present(alert, animated: true, completion: nil)
        self.view.endEditing(true)
    }
}

extension ViewController : FPNTextFieldDelegate {
    
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        print("name\(name) dialCode\(dialCode) code\(code)")
    }
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        isPhoneValid = isValid
        if isValid {
            textField.textColor = .blue
        }else{
            textField.textColor = .red
        }
        
//        print(
//            isValid,
//            textField.getFormattedPhoneNumber(format: .E164) ?? "E164: nil",
//            textField.getFormattedPhoneNumber(format: .International) ?? "International: nil",
//            textField.getFormattedPhoneNumber(format: .National) ?? "National: nil",
//            textField.getFormattedPhoneNumber(format: .RFC3966) ?? "RFC3966: nil",
//            textField.getRawPhoneNumber() ?? "Raw: nil"
//        )
    }
    
    func fpnDisplayCountryList() {
//        let navigationViewController = UINavigationController(rootViewController: listController)
//
//        listController.title = "Countries"
//        listController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissCountries))
//
//        self.present(navigationViewController, animated: true, completion: nil)
    }
    
    
}

