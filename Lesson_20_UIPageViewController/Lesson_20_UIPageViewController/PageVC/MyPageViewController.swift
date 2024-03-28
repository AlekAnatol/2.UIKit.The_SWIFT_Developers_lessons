//
//  MyPageViewController.swift
//  Lesson_20_UIPageViewController
//
//  Created by Екатерина Алексеева on 11.05.2022.
//

import UIKit

class MyPageViewController: UIPageViewController {
    
    //MARK: - Variables
    var carsArray = [CarsHelper]()
    //var carsImageArray = [UIImage]()
    let cyanCarImage  = UIImage(named: "cyan")
    let greenCarImage  = UIImage(named: "green")
    let purpleCarImage  = UIImage(named: "purple")
    let redCarImage  = UIImage(named: "red")
    let whiteCarImage  = UIImage(named: "white")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Cars"
        
        /*guard let cyanCarImage = cyanCarImage,
              let greenCarImage = greenCarImage,
              let purpleCarImage = purpleCarImage,
              let redCarImage = redCarImage,
              let whiteCarImage = whiteCarImage else { return }
        */
        let cyanCar  = CarsHelper(name: "Cyan", image: cyanCarImage!)
        let greenCar  = CarsHelper(name: "Green", image: greenCarImage!)
        let purpleCar = CarsHelper(name: "Purple", image: purpleCarImage!)
        let redCar  = CarsHelper(name: "Red", image: redCarImage!)
        let whiteCar  = CarsHelper(name: "White", image: whiteCarImage!)

        carsArray.append(cyanCar)
        carsArray.append(greenCar)
        carsArray.append(purpleCar)
        carsArray.append(redCar)
        carsArray.append(whiteCar)
        
        
    }
    
    //MARK: - Create VC
    lazy var carViewControllersArray: [CarViewController] = {
        var viewControlersArray = [CarViewController]()
        for car in carsArray {
            //let VC =
            viewControlersArray.append(CarViewController(carWith: car))
        }
        return viewControlersArray
    }()
    
    //MARK: - Init MyPageViewController
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        self.view.backgroundColor = UIColor.green
        self.delegate = self
        self.dataSource = self
        
        setViewControllers([carViewControllersArray[0]], direction: .forward, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension MyPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else { return nil }
        if let index = carViewControllersArray.firstIndex(of: viewController) {
            if index > 0 {
                return carViewControllersArray[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else { return nil }
        if let index = carViewControllersArray.firstIndex(of: viewController) {
            if index < carViewControllersArray.count - 1 {
                return carViewControllersArray[index + 1]
            }
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return carViewControllersArray.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}
