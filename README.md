
# Air Onboarding

This is our Air Onboarding project. It's purpose is to help anyone joining the Company to familiarise themselves with the codebase on a smaller scale.
It shows our code style and the architecture used which is Model View Presenter with Coordinator pattern (MVP-C)

## Features

- Light/dark mode natively
- Works on all devices
- Easy to understand folder structure
- No external library usage

## Usage Instructions

To run the project simply clone the repo and run it using
```Swift 
  MVP-C-Onboarding.xcodeproj
```
## Folder structrure

- MVP-C-Onboarding
    - Helpers
    - Extensions
    - Constants
    - Common
        - Protocols
        - ViewElements
    - Model
    - ViewControllers
        - Home
        - Company values
        - Our People
        - Our Apps
        - Team Fun
  
## How to create a new screen

First add a new group for your new screen to ViewControllers for example:
- ViewControllers
    - MyNewScreen

Next add three files to your group:
- MyNewScreen
    - MyNewScreenViewController.swift
    - MyNewScreenPresenter.swift
    - MyNewScreenCoordinator.swift

Then start filling in your files:
1. MyNewScreenCoordinator.swift
```Swift 
import UIKit

protocol MyNewScreenCoordinatorProtocol: Coordinator {
    func finish()
}

final class MyNewScreenCoordinator: MyNewScreenCoordinatorProtocol {
    private weak var parent: Coordinator?
    var childCoordinators = [Coordinator]()
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController, parent: Coordinator) {
        self.navigationController = navigationController
        self.parent = parent
    }
    
    func start() {
        // START We'll fill this later
    }
    
    func finish() {
        parent?.childDidStop(self)
    }
}
```
2. Optional if you haven't set your MyNewScreenViewController as a Cocoa Touch file which is a subclass of UIViewController then just fill it in with:
```Swift 
import UIKit

final class MyNewScreenViewController: UIViewController {
    
}
```
3. Fill in the 'MyNewScreenPresenter.swift' file:
```Swift
import Foundation

protocol MyNewScreenPresenterProtocol {
    func didTapGoBack()
}

final class MyNewScreenPresenter: MyNewScreenPresenterProtocol {
    private weak var coordinator: MyNewScreenCoordinatorProtocol?
    weak var view: MyNewScreenViewController?
    
    init(coordinator: MyNewScreenCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func didTapGoBack() {
        print("User tapped go back from MyNewScreen")
        coordinator?.finish()
    }
}
```
4. Fill the 'MyNewScreenViewController.swift' file with the missing details to connect it to the coordinator and the presenter:
```Swift
import UIKit

final class MyNewScreenViewController: UIViewController {
    private var presenter: MyNewScreenPresenterProtocol

    init(presenter: MyNewScreenPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "😎 My Awesome New Screen 😎"
        view.backgroundColor = ThemeColors.teamFunBackgroundColor
        // or add a new Color to ThemeColors.swift and use it instead
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.didTapGoBack()
    }
}

```
5. Now let's fill in the start method of our new coordinator. Go back to your 'MyNewScreenCoordinator.swift' 
Now replace the:

```Swift
func start() {
    // START We'll fill this later
}
```
with:

```Swift
func start() {
    let presenter = MyNewScreenPresenter(coordinator: self)
    let viewController = MyNewScreenViewController(presenter: presenter)
    presenter.view = viewController
    let myNewScreenNavigationController = UINavigationController(rootViewController: viewController)
    navigationController.present(myNewScreenNavigationController, animated: true)
}
```

6. Now we will hook this up to the 'HomeViewCoordinator.swift'
```Swift
protocol HomeCoordinatorProtocol: Coordinator {
    func navigateToCompanyValues()
    func navigateToOurPeople()
    func navigateToOurApps()
    func navigateToTeamFun()
    // Add your new navigation here:
    func navigateToMyNewScren()
}
```
then at the end of the HomeViewCoordinator class add the implementation of your new navigation route just after:
```Swift
func navigateToTeamFun() {
    print("Navigating to Team Fun")
    let coordinator = TeamFunCoordinator(navigationController: navigationController, parent: self)
    start(coordinator)
}

// Add your new navigation implementation below:
func navigateToMyNewScreen() {
    print("Navigating to My New Screen") // to check if it works
    let coordinator = MyNewScreenCoordinator(navigationController: navigationController, parent: self)
    start(coordinator) 
}
```
In case you are wondering why it is `start(coordinator)` and not `coordinator.start` the code uses the part of the Coordinator extension which appends the currently starting coordinator as the childCoordinator of the ParentCoordinator managing it. Look below for the implementation:
```Swift
extension Coordinator {
    func start(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.start()
    }
```
7. Next add the didTapMyNewScreen method to the HomeViewPresenter.swift into it's protocol and class implementation as below:
```Swift
import Foundation

protocol HomePresenterProtocol {
    func didTapCompanyValuesButton()
    func didTapOurPeopleButton()
    func didTapOurAppsButton()
    func didTapTeamFun()
    // Add your new tapHandler below:
    func didTapMyNewScreen()
}

final class HomePresenter: HomePresenterProtocol {
    private weak var coordinator: HomeCoordinatorProtocol?
    weak var view: HomeViewController?
    
    init(coordinator: HomeCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func didTapCompanyValuesButton() {
        coordinator?.navigateToCompanyValues()
    }
    
    func didTapOurPeopleButton() {
        coordinator?.navigateToOurPeople()
    }
    
    func didTapOurAppsButton() {
        coordinator?.navigateToOurApps()
    }
    
    func didTapTeamFun() {
        coordinator?.navigateToTeamFun()
    }
    
    // Add the implementation of your new screen tap below:
    func didTapMyNewScreen() {
        coordinator?.navigateMyNewScreen()
    }
}
```
8. Finally back to the 'HomeViewController.swift' we need to connect all of this together. The easiest way to try if everything went fine is to add a new `@objc private func tappedMyNewScreen()` at the end of the class:
```Swift
@objc private func tappedTeamFun() {
    presenter.didTapTeamFun()
}

// add your new tapHandler below:
@objc private func tappedMyNewScreen() {
    presenter.didTapMyNewScreen()
}
```
Next you can either add a new button and set it up or just use the 'teamFunButton' to test if your implementation works.
find the `setupButtons()` method which should be around line 66.
Then replace:
```Swift:
setupButton(teamFunButton, on: bottomRightTile, addTarget: #selector(tappedTeamFun))
```
with:
```Swift:
setupButton(teamFunButton, on: bottomRightTile, addTarget: #selector(tappedMyNewScreen))
```
All. Done. Now run the project and see if it worked. 🙌

## Additional notes

Some parts of the project could be abstracted further to keep the code D.R.Y. for example the repetition of:
```Swift:
override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    presenter.didTapGoBack()
}
```
and
```Swift:
func didTapGoBack() {
    print("User tapped go back from Team Fun")
    coordinator?.finish()
}
```
and
```Swift:
func finish() {
    parent?.childDidStop(self)
}
```

But please keep it there for readability and for someone who is new to the architecture so that they can easily follow the flow of the app and grasp the architecture. 

## Support

For support, drop a message on #development-ios on slack.

  
## Contributing

Contributions are always welcome!

Contact the team on slack with what you would like to add, create a new branch and go for it.

  
![Air Onboard](https://img.shields.io/badge/AirApps-Onboard-green)
