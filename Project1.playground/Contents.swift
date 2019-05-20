// Set up players
let player1: [String: String] = ["name": "Joe Smith",
                                 "height": "42",
                                 "experience": "YES",
                                 "guardians": "Jim and Jan Smith"
]

let player2: [String: String] = ["name": "Jill Tanner",
                                 "height": "36",
                                 "experience": "YES",
                                 "guardians": "Clara Tanner"
]

let player3: [String: String] = ["name": "Bill Bon",
                                 "height": "43",
                                 "experience": "YES",
                                 "guardians": "Sara and Jenny Bon"
]

let player4: [String: String] = ["name": "Eva Gordon",
                                 "height": "45",
                                 "experience": "NO",
                                 "guardians": "Wendy and Mike Gordon"
]

let player5: [String: String] = ["name": "Matt Gill",
                                 "height": "40",
                                 "experience": "NO",
                                 "guardians": "Charles and Sylvia Gill"
]

let player6: [String: String] = ["name": "Kimmy Stein",
                                 "height": "41",
                                 "experience": "NO",
                                 "guardians": "Bill and Hillary Stein"
]

let player7: [String: String] = ["name": "Sammy Adams",
                                 "height": "45",
                                 "experience": "NO",
                                 "guardians": "Jeff Adams"
]

let player8: [String: String] = ["name": "Karl Saygan",
                                 "height": "42",
                                 "experience": "YES",
                                 "guardians": "Heather Bledsoe"
]

let player9: [String: String] = ["name": "Suzane Greenberg",
                                 "height": "44",
                                 "experience": "YES",
                                 "guardians": "Henrietta Dumas"
]

let player10: [String: String] = ["name": "Sal Dali",
                                  "height": "41",
                                  "experience": "NO",
                                  "guardians": "Gala Dali"
]

let player11: [String: String] = ["name": "Joe Kavalier",
                                 "height": "39",
                                 "experience": "NO",
                                 "guardians": "Sam and Elaine Kavalier"
]

let player12: [String: String] = ["name": "Ben Finkelstein",
                                 "height": "44",
                                 "experience": "NO",
                                 "guardians": "Aaron and Jill Finkelstein"
]

let player13: [String: String] = ["name": "Diego Soto",
                                  "height": "41",
                                  "experience": "YES",
                                  "guardians": "Robin and Sarika Soto"
]

let player14: [String: String] = ["name": "Chloe Alaska",
                                  "height": "47",
                                  "experience": "NO",
                                  "guardians": "David and Jamie Alaska"
]

let player15: [String: String] = ["name": "Arnold Willis",
                                  "height": "43",
                                  "experience": "NO",
                                  "guardians": "Claire Willis"
]

let player16: [String: String] = ["name": "Phillip Helm",
                                  "height": "44",
                                  "experience": "YES",
                                  "guardians": "Thomas Helm and Eva Jones"
]

let player17: [String: String] = ["name": "Les Clay",
                                  "height": "42",
                                  "experience": "YES",
                                  "guardians": "Wynonna Brown"
]

let player18: [String: String] = ["name": "Herschel Krustofski",
                                  "height": "45",
                                  "experience": "YES",
                                  "guardians": "Hyman and Rachel Krustofski"
]

// Set up league with all players
let league = [player1, player2, player3, player4, player5, player6, player7, player8, player9, player10, player11, player12, player13, player14, player15, player16, player17, player18]

// Set up needed variables
var experiencedPlayers: [[String: String]] = []
var inexperiencedPlayers: [[String: String]] = []
var teamDragon: [[String: String]] = []
var teamRaptor: [[String: String]] = []
var teamShark: [[String: String]] = []
var teams = [teamDragon, teamRaptor, teamShark]

// Sort players by heights (roughly)
func isTall(player: [String: String], group: [[String: String]]) -> Int {
    var index = 0
    guard let heightString = player["height"], let playerHeight = Double(heightString) else { return 0 }
    for member in group {
        guard let heightString = member["height"], let memberHeight = Double(heightString) else { return 0 }
        if playerHeight < memberHeight {
            index += 1
        }
    }
    return index
}

// Add all experienced players to experiencedPlayers and all inexperienced players to inexperiencedPlayers
for player in league {
    if player["experience"] == "YES" {
        let index = isTall(player: player, group: experiencedPlayers)
        experiencedPlayers.insert(player, at: index)
    } else {
        let index = isTall(player: player, group: inexperiencedPlayers)
        inexperiencedPlayers.insert(player, at: index)
    }
}

// Divide experienced players, tallest to Dragons shortest to Sharks
while experiencedPlayers.count >= teams.count {
    teamDragon.append(experiencedPlayers.remove(at: 0))
    teamRaptor.append(experiencedPlayers.remove(at: 0))
    teamShark.append(experiencedPlayers.remove(at: 0))
}

// Divide inexperienced players, tallest to Sharks shortest to dragons
while inexperiencedPlayers.count >= teams.count {
    teamShark.append(inexperiencedPlayers.remove(at: 0))
    teamRaptor.append(inexperiencedPlayers.remove(at: 0))
    teamDragon.append(inexperiencedPlayers.remove(at: 0))
}

// Take teamName, team, and date of first practice and prints the letters to the console.
func printTeam(teamName: String, team: [[String: String]], date: String) {
    let leadingFill = 30
    let trailingFill = 60
    var titleLine = ""
    for _ in 1...leadingFill {
        titleLine += "-"
    }
    titleLine += "Team \(teamName)"
    for _ in 1...trailingFill {
        titleLine += "-"
    }
    print(titleLine)
    for member in team {
        guard let name = member["name"], let guardians = member["guardians"] else { return }
        print("To: \(guardians), Your child, \(name), from Team \(teamName) will attend their first team practice on \(date)")
    }
}

func printHeights(teamName: String, team: [[String: String]]) {
    var teamHeightsTotal: Double = 0
    
    for member in team {
        guard let height = member["height"], let unwrappedHeight = Double(height) else { return }
        teamHeightsTotal += unwrappedHeight
    }
    let averageHeight = teamHeightsTotal / Double(team.count)
    print("\(teamName) average height: \(averageHeight)")
}

// Call printTeam for each team with the appropriate date and name of the team
printTeam(teamName: "Sharks", team: teamShark, date: "March 17, 3pm")
printTeam(teamName: "Dragons", team: teamDragon, date: "March 17, 1pm")
printTeam(teamName: "Raptors", team: teamRaptor, date: "March 18, 1pm")

// Print heights titleLine
let leadingFill = 30
let trailingFill = 60
var heightsTitleLine = ""

for _ in 1...leadingFill {
    heightsTitleLine += "-"
}
heightsTitleLine += "Team Heights"
for _ in 1...trailingFill {
    heightsTitleLine += "-"
}
print(heightsTitleLine)

printHeights(teamName: "Sharks", team: teamShark)
printHeights(teamName: "Dragons", team: teamDragon)
printHeights(teamName: "Raptors", team: teamRaptor)
