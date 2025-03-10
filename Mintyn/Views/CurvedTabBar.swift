//
//  CurvedTabBar.swift
//  Mintyn
//
//  Created by Faruk Amoo on 08/03/2025.
//


import UIKit

class CurvedTabBar: UITabBar {

    private var shapeLayer: CALayer?

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        addShape()
    }

    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.fillColor = UIColor.black.cgColor
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOffset = CGSize(width: 0, height: -3)
        shapeLayer.shadowOpacity = 0.3
        shapeLayer.shadowRadius = 5

        if let oldShapeLayer = self.shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }

    private func createPath() -> CGPath {
        let path = UIBezierPath()
        let width = self.bounds.width
        let height = self.bounds.height
        let curveHeight: CGFloat = 30
        let curveWidth: CGFloat = 100
        
        path.move(to: CGPoint(x: 0, y: 0))  // Start from left
        path.addLine(to: CGPoint(x: (width - curveWidth) / 2, y: 0))  // Left edge before curve
        path.addQuadCurve(
            to: CGPoint(x: (width + curveWidth) / 2, y: 0),
            controlPoint: CGPoint(x: width / 2, y: curveHeight)
        )  // Curve
        path.addLine(to: CGPoint(x: width, y: 0))  // Right edge after curve
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.close()

        return path.cgPath
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let isInside = self.layer.contains(point)
        return isInside ? super.hitTest(point, with: event) : nil
    }
}
