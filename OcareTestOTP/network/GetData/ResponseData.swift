

import Foundation

struct ResponseData: Codable {
    var error: Int?
    var data : token?
    
    struct token : Codable {
        var token : String?
    }
}
