import Dispatch
import KituraContracts
import KituraKit

/**
 This class provides methods to communicate with the Kitura back-end.
 This communication is done using KituraKit, which works much like the codable routing APIs on the back-end.
 */
class KituraService {
    
    let url = "http://localhost:8080"
    private let client: KituraKit
    
    init() {
        client = KituraKit(baseURL: url + "/api")!
    }
    
    func getRaces(completion: @escaping ([Race]) -> Void) {
        client.get("races") { (races: [Race]?, error: RequestError?) in
            DispatchQueue.main.async {
                completion(races ?? [])
            }
        }
    }
}
