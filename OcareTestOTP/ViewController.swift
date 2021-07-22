
import RxSwift
import RxCocoa
import UIKit
import FlagPhoneNumber

class ViewController: UIViewController {

    @IBOutlet weak var tfPhone: FPNTextField!
    @IBOutlet weak var tfTestOTP: UITextField!
    @IBOutlet weak var tfLang: UITextField!
    
    var isPhoneValid = false
    
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        tfTestOTP.textContentType = .oneTimeCode
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
            NetworkManage.shared.newRegister(m_user_name: phone,m_lang: lang ).subscribe(onNext : { [unowned self] responseData in
                
                print(responseData.error)
                
            }).disposed(by: disposeBag)
            let alert = UIAlertController(title: "請輸入簡訊驗證碼", message: "", preferredStyle: .alert)
            alert.addTextField { textField in
                textField.placeholder = "Input OTP"
                textField.textContentType = .oneTimeCode
            }
            let action = UIAlertAction(title: "OK", style: .default) { action in
                
            }
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }else{
            let alert = UIAlertController(title: "格式錯誤", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { action in
                
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }
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
    }
    
    func fpnDisplayCountryList() {
        
    }
    
    
}

