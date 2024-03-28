//
//  ViewController.swift
//  Lesson_21_UIDynamicAnimator_UICollision_UIGravity_UIPushBehavior
//
//  Created by Екатерина Алексеева on 16.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //var squareViews = [UIDynamicItem]()
    var squareView = UIView()
    var animator = UIDynamicAnimator()
    var push = UIPushBehavior()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createGestureRecognizer()
        createView()
        createBehavior()
    }
    
    // создаем квадрат
    func createView() {
        squareView.backgroundColor = UIColor.purple
        squareView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        squareView.center = view.center
        view.addSubview(squareView)
    }
    
    // создаем жест
    func createGestureRecognizer() {
        let gestureTap = UITapGestureRecognizer(target: self, action: #selector(tapReaction))
        view.addGestureRecognizer(gestureTap)
    }
    
    // создаем столкновения и ускорение
    func createBehavior() {
        animator = UIDynamicAnimator(referenceView: view)
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        push = UIPushBehavior(items: [squareView], mode: .continuous)
        
        animator.addBehavior(collision)
        animator.addBehavior(push)
    }
    
    // создаем реакцию на нажатие
    @objc func tapReaction(paramTap: UITapGestureRecognizer) {
        let tapPoint = paramTap.location(in: view)
        let squareCenter = squareView.center
        
        let direction = CGVector(dx: tapPoint.x - squareCenter.x, dy: tapPoint.y - squareCenter.y)
        push.pushDirection = direction
        
        let distanceBetweenPoints: CGFloat = sqrt(pow(tapPoint.x - squareCenter.x, 1) + pow(tapPoint.y - squareCenter.y, 2))
        push.magnitude = distanceBetweenPoints / 200
    }
    
        /*
        //создаем квадрат
        squareView.backgroundColor = UIColor.purple
        squareView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        squareView.center = view.center
        view.addSubview(squareView)
        
        //создаем анимацию тяготения
        animator = UIDynamicAnimator(referenceView: view)
        let gravity = UIGravityBehavior(items: [squareView])
        animator.addBehavior(gravity)
        */
        
        /*
        let numberOfViews = 3
        squareViews.reserveCapacity(numberOfViews)
        let colors = [UIColor.red, UIColor.purple, UIColor.blue]
        let sizeOfView = CGSize(width: 75, height: 75)
        var currentCenterPoint = view.center
        
        for count in 0 ..< numberOfViews {
            let view = UIView()
            view.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: sizeOfView)
            view.center = currentCenterPoint
            view.backgroundColor = colors[count]
            squareViews.append(view)
            self.view.addSubview(view)
            currentCenterPoint.y += 20
        }
        
        animator = UIDynamicAnimator(referenceView: view)
        let gravity = UIGravityBehavior(items: squareViews)
        animator.addBehavior(gravity)
        
        let collision = UICollisionBehavior(items: squareViews)
        collision.translatesReferenceBoundsIntoBoundary = true
        collision.addBoundary(withIdentifier: "bottomBoudary" as NSCopying,
                              from: CGPoint(x: 0, y: view.bounds.height - 50),
                              to: CGPoint(x: view.bounds.width, y: view.bounds.height - 50))
        collision.collisionDelegate = self
        animator.addBehavior(collision)
    }
}

extension ViewController: UICollisionBehaviorDelegate {
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        let identifier = identifier as? String
        let bottomIdentifier = "bottomBoudary"
        if identifier == bottomIdentifier {
            UIView.animate(withDuration: 2) {
                let view = item as? UIView
                view?.backgroundColor = UIColor.green
                view?.alpha = 0
                view?.transform = CGAffineTransform(scaleX: 2, y: 2)
            } completion: { (finished) in
                let view = item as? UIView
                behavior.removeItem(item)
                view?.removeFromSuperview()
            }
        }
    }
         */
    
}
