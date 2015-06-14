//
//  MarkerView.swift
//  Around Me-Swift
//
//  Created by Nio Nguyen on 6/9/15.
//  nio.huynguyen@gmail.com
//  Copyright (c) 2015 Nio Nguyen. All rights reserved.
//

protocol MarkerViewDelegate {
    func didTouchMarkerView(markerView:MarkerView)
}


class MarkerView : UIView {
    var coordinate:ARGeoCoordinate!
    var delegate:MarkerViewDelegate?
    var distanceLabel:UILabel?
    let kWidth:CGFloat = 200.0
    let kHeight:CGFloat = 100.0
    
    override init(frame: CGRect) {
        super.init(frame : frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(_coordinate:ARGeoCoordinate, _delegate:MarkerViewDelegate) {
        let frame = CGRectMake(0, 0, kWidth, kHeight)
        super.init(frame: frame)
        
        self.coordinate = _coordinate
        self.delegate = _delegate
        
        self.userInteractionEnabled = true
        
        var titleFrame:CGRect = CGRectMake(0, 0, kWidth, 40.0)
        
        var title:UILabel = UILabel(frame: titleFrame)
        title.backgroundColor = UIColor(white: 0.3, alpha: 0.7)
        title.textColor = UIColor.whiteColor()
        title.textAlignment = NSTextAlignment.Center
        title.text = self.coordinate!.title
        title.sizeToFit()
        
        var distanceFrame:CGRect = CGRectMake(0, 45.0, kWidth, 40.0)
        
        self.distanceLabel = UILabel(frame: distanceFrame)
        self.distanceLabel!.backgroundColor = UIColor(white: 0.3, alpha: 0.7)
        self.distanceLabel!.textColor = UIColor.whiteColor()
        self.distanceLabel!.textAlignment = NSTextAlignment.Center
        self.distanceLabel!.text = String(format: "%.2f", self.coordinate!.distanceFromOrigin / 1000.0) + "km"
        self.distanceLabel!.sizeToFit()
        
        self.addSubview(title)
        self.addSubview(self.distanceLabel!)
        
        self.backgroundColor = UIColor.clearColor()
    }

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)

        self.distanceLabel!.text = String(format: "%.2f", self.coordinate!.distanceFromOrigin / 1000.0) + "km"
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent e: UIEvent) {
        self.delegate?.didTouchMarkerView(self)
    }
    
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        var theFrame = CGRectMake(0, 0, kWidth, kHeight)
        
        return CGRectContainsPoint(theFrame, point)
    }

}