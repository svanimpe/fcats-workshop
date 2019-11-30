import Fcats
import HeliumLogger
import Kitura

// Nothing much to see here, simply hook everything together and start the server.
HeliumLogger.use(.warning)

let persistence = try! Persistence()
let router = Router()
Routes(persistence: persistence).configure(using: router)
Kitura.addHTTPServer(onPort: 8080, with: router)
Kitura.run()
