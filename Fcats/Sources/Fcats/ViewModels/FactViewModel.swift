/**
 A view model for **fact.stencil**.
 
 A view model groups the properties needed for a particular view.
 These properties can be taken from multiple models.
 They can be transformed, localized, ... as needed for the view.
 
 This is of course inspired by MVVM.
 */
struct FactViewModel: Codable {
    
    let id: Int
    let name: String
    let fact: String
    
    init(race: Race) {
        id = race.id
        name = race.name
        fact = race.facts.randomElement() ?? "Little is known about these cats."
    }
}
