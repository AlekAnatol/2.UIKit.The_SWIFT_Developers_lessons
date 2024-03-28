//
//  ViewController.swift
//  Lesson_22_UIDynamics_UISnap_UIattachmentBehavior
//
//  Created by Екатерина Алексеева on 17.05.2022.
//

import UIKit

class ViewController: UIViewController {
 
    
    var greenView = UIView()
    var animator = UIDynamicAnimator()
    var snapBehavior: UISnapBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTapGestureRecognizer()
        createView()
        createAnimator()
    }
    
    // Создаем регистратор нажатия на экран
    func createTapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    // Создаем квдраты на экране
    func createView() {
        greenView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        greenView.center = view.center
        greenView.backgroundColor = UIColor.green
        view.addSubview(greenView)
    }
    
    // Создаем аниматор
    func createAnimator() {
        animator = UIDynamicAnimator(referenceView: view)
        snapBehavior = UISnapBehavior(item: greenView, snapTo: view.center)
        snapBehavior?.damping = 0.3
        animator.addBehavior(snapBehavior!)
    }
    
    // Cоздаем рекцию на касние экрана
    @objc func handleTap(paramTap: UITapGestureRecognizer) {
        let tapPoint = paramTap.location(in: view)
        if snapBehavior != nil {
            animator.removeBehavior(snapBehavior!)
        }
        snapBehavior = UISnapBehavior(item: greenView, snapTo: tapPoint)
        snapBehavior?.damping = 0.8
        animator.addBehavior(snapBehavior!)
    }
}
     
    
   /*
    var bigView = UIView()
    var littleView = UIView()
    var redView = UIView()
    var animator = UIDynamicAnimator()
    var attachmentBehavior: UIAttachmentBehavior?

    override func viewDidLoad() {
        super.viewDidLoad()
        createPanGestureRecognizer()
        createView()
        createAnimationWithBehavior()
    }

    // Создаем все view
    func createView() {
        bigView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        bigView.center = view.center
        bigView.backgroundColor = UIColor.green
        
        littleView = UIView(frame: CGRect(x: 80, y: 0, width: 20, height: 20))
        littleView.backgroundColor = UIColor.purple
        bigView.addSubview(littleView)
        view.addSubview(bigView)
        
        redView = UIView(frame: CGRect(x: 250, y: 50, width: 20, height: 20))
        redView.backgroundColor = UIColor.red
        view.addSubview(redView)
    }
    
    // Cоздаем регистратор жестов панорамирования
    func createPanGestureRecognizer() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGestureRecognizer)
    }
    
    // Создаем анимацию со столкновением и привязкой к якорю
    func createAnimationWithBehavior() {
        animator = UIDynamicAnimator(referenceView: view)
        let collision = UICollisionBehavior(items: [redView, bigView])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        attachmentBehavior = UIAttachmentBehavior(item: bigView, attachedToAnchor: redView.center)
        animator.addBehavior(attachmentBehavior!)
    }
    
    // Реакция на жест: в точку переставляется красный квдрат, за ним передвигается littleVieew, а с ним и bigView
    @objc func handlePan(paramPan: UIPanGestureRecognizer) {
        let currentTapPoint = paramPan.location(in: view)
        redView.removeFromSuperview()
        attachmentBehavior?.anchorPoint = currentTapPoint
        redView.center = currentTapPoint
        view.addSubview(redView)
    }
}

*/
