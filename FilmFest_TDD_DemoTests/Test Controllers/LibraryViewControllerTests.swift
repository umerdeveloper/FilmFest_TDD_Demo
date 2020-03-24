import XCTest
@testable import FilmFest_TDD_Demo

class LibraryViewControllerTests: XCTestCase {
    
    var sut: LibraryViewController!

    override func setUp() {
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as? LibraryViewController
          _ = sut.view
    }

    override func tearDown() { }
    
    // MARK: - Nil Checks
    func testLibraryCV_TableViewShouldNotBeNil() {
        XCTAssertNotNil(sut.libraryTableView)
    }
    // MARK: - Data Source
    func testDataSource_ViewDidLoad_SetsTableViewDataSource() {
        XCTAssertNotNil(sut.libraryTableView.dataSource)
        XCTAssertTrue(sut.libraryTableView.dataSource is MovieLibraryDataService)
    }
    // MARK: - Delegate
    func testDelegate_ViewDidLoad_SetsTableViewDelegate() {
        XCTAssertNotNil(sut.libraryTableView.delegate)
        XCTAssertTrue(sut.libraryTableView.delegate is MovieLibraryDataService)
    }
    // MARK: - Data Servicde Assumptions
    func testDataService_ViewDidLoad_SingleDataServiceObject() {
        XCTAssertEqual(sut.libraryTableView.delegate as! MovieLibraryDataService, sut.libraryTableView.dataSource as! MovieLibraryDataService)
        
    }




}
