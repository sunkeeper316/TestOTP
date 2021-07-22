
import Foundation

var countdown = 0

class TimerModel : NSObject {
    static let sharedTimer = TimerModel()
    var timer: Timer?

    func runCountDown(){
        if timer != nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDownTimer), userInfo: nil, repeats: false)
        }
    }

    @objc func countDownTimer(){
        if countdown > 0 {
            countdown -= 1
            
        }
    }
}


