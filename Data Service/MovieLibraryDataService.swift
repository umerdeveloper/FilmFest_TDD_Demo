import UIKit

enum LibrarySection: Int {
    case MovieToSee, MovieSeen
}

class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    var movieManager: MovieManager?
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movieManager = movieManager else { return 0 }
        guard let librarySection = LibrarySection(rawValue: section) else { fatalError() }
        
        switch librarySection {
            case .MovieSeen:
                return movieManager.moviesSeenCount
            case .MovieToSee:
                return movieManager.moviesToSeeCount
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    

}
