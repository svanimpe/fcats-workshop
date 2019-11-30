import Kitura
import KituraContracts

extension Routes {
    
    /**
     Adds the REST API routes to the given router.
     
     These routes are examples of codable routing.
     With codable routing, Kitura handles the request and response for you.
     Your handler simply receives and returns a `Codable` (or an error).
     All codable handlers are asynchronous so they return their result via a completion handler.
     */
    func configureRESTRoutes(using router: Router) {
        router.post("races", handler: addRace)
        router.get("races", handler: getRace)
        router.get("races", handler: getAllRaces)
    }
    
    /**
     Adds a `Race`.
     
     This is a typical POST handler that receives a codable and returns
     either a codable (on success) or an error.
     */
    private func addRace(race: Race, completion: (Race? , RequestError?) -> Void) {
        do {
            guard try persistence.race(forID: race.id) == nil else {
                return completion(nil, .conflict)
            }
            try persistence.add(race)
            return completion(race, nil)
        } catch {
            return completion(nil, .internalServerError)
        }
    }
    
    /**
     Returns the `Race` with the given ID, or an error.
     
     Because this handler includes an identifier parameter, Kitura automatically adds
     an :id route parameter. The complete route for this handler is /api/races/:id.
     */
    private func getRace(id: Int, completion: (Race?, RequestError?) -> Void) {
        do {
            guard let race = try persistence.race(forID: id) else {
                return completion(nil, .notFound)
            }
            return completion(race, nil)
        } catch {
            return completion(nil, .internalServerError)
        }
    }
    
    /**
     Returns a list of races, sorted by ID.
     */
    private func getAllRaces(completion: ([Race]?, RequestError?) -> Void) {
        do {
            let results = try persistence.allRaces()
            return completion(results, nil)
        } catch {
            return completion(nil, .internalServerError)
        }
    }
}
