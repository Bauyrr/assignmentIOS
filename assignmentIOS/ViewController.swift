import UIKit

struct Team {
    let name: String
    let imageName: String
}

class ViewController: UIViewController {

    @IBOutlet weak var team1: UIImageView!
    @IBOutlet weak var team2: UIImageView!

    @IBOutlet weak var club1: UILabel!
    @IBOutlet weak var club2: UILabel!

    @IBOutlet weak var score1: UILabel!
    @IBOutlet weak var score2: UILabel!

    private let teams = [
        Team(name: "PSG", imageName: "psg"),
        Team(name: "Arsenal", imageName: "arsenal"),
        Team(name: "Chelsea", imageName: "chelsea"),
        Team(name: "Barcelona", imageName: "barcelona"),
        Team(name: "Milan", imageName: "milan"),
        Team(name: "Inter", imageName: "inter"),
        Team(name: "Bayern", imageName: "bayern"),
        Team(name: "Borussia", imageName: "borussia"),
        Team(name: "Real Madrid", imageName: "realmadrid"),
        Team(name: "Manchester United", imageName: "manchester.united"),
        Team(name: "Manchester City", imageName: "manchester.city"),
        Team(name: "Juventus", imageName: "juventus"),
        Team(name: "Tottenham", imageName: "tottenham"),
        Team(name: "Liverpool", imageName: "liverpool")
    ]

    private var selectedTeam1: Team?
    private var selectedTeam2: Team?

    override func viewDidLoad() {
        super.viewDidLoad()


        generateTeams()
    }


    @IBAction func generateTeamsButtonTapped(_ sender: UIButton) {
        generateTeams()
    }

    @IBAction func generateScoreButtonTapped(_ sender: UIButton) {
        generateScore()
    }

    private func generateTeams() {
        let chosenTeams = Array(teams.shuffled().prefix(2))
        guard chosenTeams.count == 2 else { return }

        selectedTeam1 = chosenTeams[0]
        selectedTeam2 = chosenTeams[1]

        club1.text = chosenTeams[0].name
        club2.text = chosenTeams[1].name

        team1.image = UIImage(named: chosenTeams[0].imageName)
        team2.image = UIImage(named: chosenTeams[1].imageName)

        score1.text = "–"
        score2.text = "–"
    }

    private func generateScore() {
        guard selectedTeam1 != nil, selectedTeam2 != nil else {
            generateTeams()
            return
        }

        score1.text = "\(Int.random(in: 0...5))"
        score2.text = "\(Int.random(in: 0...5))"
    }
}
