import MongoSwift

/**
 Persistence operations related to `Race`.
 */
extension Persistence {
    
    /**
     Adds a race to the database.
     Does nothing if a race for this ID already exists.
     */
    func add(_ race: Race) throws {
        guard try self.race(forID: race.id) == nil else {
            return
        }
        try raceCollection.insertOne(race)
    }
    
    /**
     Returns the race with the given ID, or `nil` if this race doesn't exist.
     */
    func race(forID id: Int) throws -> Race? {
        try raceCollection.find(["id": id]).next()
    }
    
    /**
     Returns a list of races, sorted by ID.
     */
    func allRaces() throws -> [Race] {
        Array(try raceCollection.find(options: FindOptions(sort: ["id": 1])))
    }
}
