//
//  ViewController.swift
//  TestCircle3
//
//  Created by Gerry Rubio on 2/26/18.
//  Copyright © 2018 Gerry Rubio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View1=\(view1.center.x)  \(view1.center.y)")
        print("View2=\(view2.center.x)  \(view2.center.y)")
        print("View3=\(view3.center.x)  \(view3.center.y)")
        print("View4=\(view4.center.x)  \(view4.center.y)")
        newAnimation8()
        newAnimation7()
        newAnimation6()
        newAnimation4()
        newAnimation5()
    }

    func newAnimation8() {
        let ovalShapeLayer1 = CAShapeLayer()
        let ovalShapeLayer2 = CAShapeLayer()
        ovalShapeLayer1.fillColor = UIColor.clear.cgColor
        let refreshRadius = view2.frame.size.height/2
  //      let point1 = CGPoint(x: view2.center.x - 273, y: view2.center.y)
        let point1 = CGPoint(x: view2.layer.bounds.midX, y: view2.layer.bounds.midY)
        ovalShapeLayer1.path = UIBezierPath(arcCenter: point1, radius: refreshRadius, startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true).cgPath
        ovalShapeLayer2.path = UIBezierPath(arcCenter: point1, radius: refreshRadius - (refreshRadius * 0.80), startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true).cgPath
        
        
        ovalShapeLayer1.shadowPath = ovalShapeLayer1.path
        ovalShapeLayer1.shadowOpacity = 0.4
        ovalShapeLayer1.shadowColor = UIColor.green.cgColor
        view2.layer.addSublayer(ovalShapeLayer1)
        
        ovalShapeLayer2.shadowPath = ovalShapeLayer2.path
        view2.layer.addSublayer(ovalShapeLayer2)
        ovalShapeLayer2.strokeColor = UIColor.clear.cgColor
        ovalShapeLayer2.fillColor = UIColor.green.cgColor
        
        let basicAnimationStart = CABasicAnimation(keyPath: "shadowPath")
        basicAnimationStart.fromValue = ovalShapeLayer2.path
        basicAnimationStart.toValue = ovalShapeLayer1.path
        //      basicAnimationStart.toValue = ovalShapeLayer2.path
        basicAnimationStart.duration = 2
        basicAnimationStart.repeatCount = MAXFLOAT
        basicAnimationStart.fillMode = kCAFillModeForwards
        ovalShapeLayer1.add(basicAnimationStart, forKey: nil)
    }
    
    func newAnimation7() {
        let ovalShapeLayer = CAShapeLayer()
        ovalShapeLayer.strokeColor = UIColor.black.cgColor
        ovalShapeLayer.fillColor = UIColor.clear.cgColor
        ovalShapeLayer.lineWidth = 4.0
        //    ovalShapeLayer.lineDashPattern = [10,5]
        let refreshRadius = view1.frame.size.height/2 * 0.5
        let point1 = CGPoint(x: view1.layer.bounds.midX, y: view1.layer.bounds.midY)
        ovalShapeLayer.path = UIBezierPath(arcCenter: point1, radius: refreshRadius, startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true).cgPath
        
        view1.layer.addSublayer(ovalShapeLayer)
        
        let basicAnimationStart = CABasicAnimation(keyPath: "strokeStart")
        basicAnimationStart.fromValue = -0.1
        basicAnimationStart.toValue = 1.0
        basicAnimationStart.fillMode = kCAFillModeForwards
        
        
        let basicAnimationEnd = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimationEnd.fromValue = 0.0
        basicAnimationEnd.toValue = 1.0
        basicAnimationEnd.fillMode = kCAFillModeForwards
        
        
        let strokeAnimationGroup = CAAnimationGroup()
        strokeAnimationGroup.duration = 3
        strokeAnimationGroup.repeatCount = MAXFLOAT
        strokeAnimationGroup.animations = [basicAnimationStart,basicAnimationEnd]
        
        ovalShapeLayer.add(strokeAnimationGroup, forKey: nil)
    }
    
    func newAnimation6() {
        let ovalShapeLayer = CAShapeLayer()
        ovalShapeLayer.strokeColor = UIColor.orange.cgColor
        ovalShapeLayer.fillColor = UIColor.clear.cgColor
        ovalShapeLayer.lineWidth = 20.0
        ovalShapeLayer.lineDashPattern = [2,3]
        let refreshRadius = view3.frame.size.height/2 * 0.5
        let point1 = CGPoint(x: view3.layer.bounds.midX, y: view3.layer.bounds.midY)
        ovalShapeLayer.path = UIBezierPath(arcCenter: point1, radius: refreshRadius, startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true).cgPath
        view3.layer.addSublayer(ovalShapeLayer)
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.isRemovedOnCompletion = false
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.fromValue = 0
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.repeatCount = MAXFLOAT
        
        ovalShapeLayer.add(basicAnimation, forKey: nil)
    }
    
    func newAnimation4() {
        //circlePath will be ued by the circleLayer to draw the orbit circle.
        // Will also be used by the animation to pave the path to move the object along the orbit circle
        let point = CGPoint(x: view4.layer.bounds.midX, y: view4.layer.bounds.midY)
        let circlePath = UIBezierPath(arcCenter: point, radius: 60, startAngle: 0, endAngle: .pi*2, clockwise: true)
        
        let sunPath = UIBezierPath(arcCenter: view4.center, radius: 20, startAngle: 0, endAngle: .pi*2, clockwise: true)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 5
        animation.repeatCount = MAXFLOAT
        animation.path = circlePath.cgPath
        
        let ballLayer = CAShapeLayer()
        ballLayer.path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: 10, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true).cgPath
        ballLayer.fillColor = UIColor.blue.cgColor
        view4.layer.addSublayer(ballLayer)
        // You can also pass any unique string value for key
        ballLayer.add(animation, forKey: nil)
        
        
        
        // circleLayer is only used to locate the circle animation path
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeColor = UIColor.black.cgColor
        circleLayer.lineWidth = 0.25
        circleLayer.fillColor = UIColor.clear.cgColor
        view4.layer.addSublayer(circleLayer)
        
        // sun is only used to draw the orange sun circle
        let sunLayer = CAShapeLayer()
        sunLayer.path = sunPath.cgPath
        sunLayer.strokeColor = UIColor.orange.cgColor
        sunLayer.lineWidth = 1
        sunLayer.fillColor = UIColor.orange.cgColor
        view4.layer.addSublayer(sunLayer)
    }
    
    func newAnimation5() {
        //circlePath will be ued by the circleLayer to draw the orbit circle.
        // Will also be used by the animation to pave the path to move the object along the orbit circle
        let point = CGPoint(x: view5.layer.bounds.midX, y: view5.layer.bounds.midY)
        let circlePath1 = UIBezierPath(arcCenter: point, radius: 20, startAngle: 0, endAngle: .pi*2, clockwise: true)
        let circlePath2 = UIBezierPath(arcCenter: point, radius: 40, startAngle: 0, endAngle: .pi*2, clockwise: true)
        let circlePath3 = UIBezierPath(arcCenter: point, radius: 60, startAngle: 0, endAngle: .pi*2, clockwise: false)
        
        let sunPath = UIBezierPath(arcCenter: point, radius: 15, startAngle: 0, endAngle: .pi*2, clockwise: true)
        
        let animation1 = CAKeyframeAnimation(keyPath: "position")
        animation1.duration = 5
        animation1.repeatCount = MAXFLOAT
        animation1.path = circlePath1.cgPath
        
        let ballLayer1 = CAShapeLayer()
        ballLayer1.path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: 5, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true).cgPath
        ballLayer1.fillColor = UIColor.blue.cgColor
        view5.layer.addSublayer(ballLayer1)
        ballLayer1.zPosition = 2
        // You can also pass any unique string value for key
        ballLayer1.add(animation1, forKey: nil)
        
        // circleLayer is only used to locate the circle animation path
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath1.cgPath
        circleLayer.strokeColor = UIColor.black.cgColor
        circleLayer.lineWidth = 0.25
        circleLayer.fillColor = UIColor.clear.cgColor
        view5.layer.addSublayer(circleLayer)
        //-----------------------------------------
        
        let animation2 = CAKeyframeAnimation(keyPath: "position")
        animation2.duration = 10
        animation2.repeatCount = MAXFLOAT
        animation2.path = circlePath2.cgPath
        
        let ballLayer2 = CAShapeLayer()
        ballLayer2.path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: 5, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true).cgPath
        ballLayer2.fillColor = UIColor.green.cgColor
        view5.layer.addSublayer(ballLayer2)
        // You can also pass any unique string value for key
        ballLayer2.add(animation2, forKey: nil)
        
        // circleLayer is only used to locate the circle animation path
        let circleLayer2 = CAShapeLayer()
        circleLayer2.path = circlePath2.cgPath
        circleLayer2.strokeColor = UIColor.black.cgColor
        circleLayer2.lineWidth = 0.25
        circleLayer2.fillColor = UIColor.clear.cgColor
        circleLayer2.zPosition = -1
        view5.layer.addSublayer(circleLayer2)
        //-----------------------------------------
        
        // circleLayer is only used to locate the circle animation path
        let circleLayer3 = CAShapeLayer()
        circleLayer3.path = circlePath3.cgPath
        circleLayer3.strokeColor = UIColor.black.cgColor
        circleLayer3.lineWidth = 0.25
        circleLayer3.fillColor = UIColor.clear.cgColor
        view5.layer.addSublayer(circleLayer3)
        
        let animation3 = CAKeyframeAnimation(keyPath: "position")
        animation3.duration = 15
        animation3.repeatCount = MAXFLOAT
        animation3.path = circlePath3.cgPath
        
        let ballLayer3 = CAShapeLayer()
        ballLayer3.path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: 7, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true).cgPath
        ballLayer3.fillColor = UIColor.magenta.cgColor
        view5.layer.addSublayer(ballLayer3)
        // You can also pass any unique string value for key
        ballLayer3.add(animation3, forKey: nil)
        /*
         // circleLayer is only used to locate the circle animation path
         let circleLayer3 = CAShapeLayer()
         circleLayer3.path = circlePath3.cgPath
         circleLayer3.strokeColor = UIColor.black.cgColor
         circleLayer3.lineWidth = 0.25
         circleLayer3.fillColor = UIColor.clear.cgColor
         view.layer.addSublayer(circleLayer3)
         */
        // sun is only used to draw the orange sun circle
        let sunLayer = CAShapeLayer()
        sunLayer.path = sunPath.cgPath
        sunLayer.strokeColor = UIColor.orange.cgColor
        sunLayer.lineWidth = 1
        sunLayer.fillColor = UIColor.orange.cgColor
        view5.layer.addSublayer(sunLayer)
    }
    
}

