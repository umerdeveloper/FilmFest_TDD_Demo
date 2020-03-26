import UIKit

enum LibrarySection: Int {
    case MovieToSee, MovieSeen
}

class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    var movieManager: MovieManager?
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movieManager = movieManager else { return 0 }
        guard let librarySection = LibrarySection(rawValue: section) else { fatalError() }
        
        switch librarySection {
            case .MovieSeen: return movieManager.moviesSeenCount
            case .MovieToSee: return movieManager.moviesToSeeCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: indexPath) as! MovieCell
        
        guard let movieManager = movieManager else { fatalError() }
        guard let librarySection = LibrarySection(rawValue: indexPath.section) else { fatalError() }
        let movieData = librarySection.rawValue == 0 ? movieManager.movieAtIndex(index: indexPath.row): movieManager.checkedOffMovieAtIndex(index: indexPath.row)
            cell.configMovieCell(movie: movieData)
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieManager = movieManager else { fatalError() }
        guard let librarySection = LibrarySection(rawValue: indexPath.section) else { fatalError() }
        
        if librarySection == .MovieToSee {
            movieManager.checkOffMovieAtIndex(index: indexPath.row)
            tableView.reloadData()
        }
    }
    
    // section title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let librarySection = LibrarySection(rawValue: section) else { fatalError() }
        let sectionTitle = librarySection.rawValue == 0 ? "Movies To See" : "Movies Seen"
        return sectionTitle
    }
}
