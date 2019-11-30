import MongoSwift

/**
 This class represents the persistence layer.
 It holds a database connection and provides access to the database's collections.
 
 The actual persistence operations are provided by repositories.
 These repositories aren't implemented as types because they don't require any state.
 They consist entirely of functions, which is why they're implemented as extensions on this class.
 */
public class Persistence {
    
    let raceCollection: MongoCollection<Race>
    
    /**
     Initializes the persistence layer and connects to the database.
     
     In a real app, you should load the database settings from environment variables.
     That will also allow you to use separate database for testing.
     */
    public init() throws {
        let client = try MongoClient()
        let database = client.db("fcats")
        raceCollection = database.collection("races", withType: Race.self)
    }
}
