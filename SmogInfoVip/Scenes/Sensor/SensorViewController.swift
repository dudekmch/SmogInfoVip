import UIKit

protocol SensorDisplayLogic: class {
    func displaySomething(viewModel: Sensor.Something.ViewModel)
    func displayHeader(viewModel: Sensor.Header.ViewModel)
}

class SensorViewController: UIViewController, SensorDisplayLogic {
    var interactor: SensorBusinessLogic?
    var router: (NSObjectProtocol & SensorRoutingLogic & SensorDataPassing)?

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

    private func setup() {
        let viewController = self
        let interactor = SensorInteractor()
        let presenter = SensorPresenter()
        let router = SensorRouter()
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
        doSomething()
        getHeaderText()
    }

    @IBOutlet weak var tableView: UITableView!

    private var sectionHeaderText: String?

    func getHeaderText(){
        interactor?.getHeader()
    }
    
    func displayHeader(viewModel: Sensor.Header.ViewModel){
        self.sectionHeaderText = viewModel.text
        tableView.reloadData()
    }
    
    func doSomething() {
        let request = Sensor.Something.Request()
        interactor?.doSomething(request: request)
    }

    func displaySomething(viewModel: Sensor.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

extension SensorViewController: UITableViewDataSource, UITableViewDelegate {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaderText
    }
}
