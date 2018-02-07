import UIKit

protocol StationDisplayLogic: class {
    func displayStation(viewModel: Station.StationName.ViewModel)
}

class StationViewController: UIViewController, StationDisplayLogic {
    
    var interactor: StationBusinessLogic?
    var router: (NSObjectProtocol & StationRoutingLogic & StationDataPassing)?

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup
    //Initialization VIP structure
    private func setup() {
        let viewController = self
        let interactor = StationInteractor()
        let presenter = StationPresenter()
        let router = StationRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: Routing

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        getStationData()
        registerNib()
    }

    // MARK: Do something

    @IBOutlet weak var tableView: UITableView!
    
    private var stationData: [StationDTO]?
    
    let sectionHeaderText = "Stations"
    
    func getStationData() {
        let request = Station.StationName.Request()
        interactor?.getStationData(request: request)
    }

    func displayStation(viewModel: Station.StationName.ViewModel) {
        stationData = [StationDTO]()
        stationData = viewModel.stationDtoList
        tableView.reloadData()
    }
}

extension StationViewController: UITableViewDataSource, UITableViewDelegate {

    private func registerNib() {
        let nib = UINib(nibName: StationTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: StationTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let stationData = stationData else {
            return 0
        }
        return stationData.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaderText
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let stationData = stationData else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: StationTableViewCell.identifier) as! StationTableViewCell
        
        cell.setStationData(id: stationData[indexPath.row].id, name: stationData[indexPath.row].stationName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let stationIndex = tableView.indexPathForSelectedRow, let stationData = stationData
        {
            let station = StationDTO(id: stationData[stationIndex.row].id, name: stationData[stationIndex.row].stationName)
            interactor?.setDataStore(data: station)
            router?.routeToSensor()
        }
    }
}
