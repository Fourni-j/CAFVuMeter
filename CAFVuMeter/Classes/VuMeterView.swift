//
//  VuMeterView.swift
//  Remi
//
//  Created by Charles-Adrien Fournier on 31/10/2017.
//  Copyright © 2017 Charles-Adrien Fournier. All rights reserved.
//

import UIKit

protocol VuMeterViewDelegate : class {
    func didStepValueUpdate(_ newValue: CGFloat)
}

public class VuMeterView: UIView {
    @IBOutlet var view: UIView!
    @IBOutlet weak var fillView: UIView!
    @IBOutlet weak var heightFillConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthFillConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var slider: UISlider!
    /**
     Vu Meter animation style
     
     - bottomToTop: Started from the bottom to the top of the view
     - leftToRight: Started from left to the right of the view
     */
    enum AnimationStyle {
        case bottomToTop
        case leftToRight
    }
    
    private var currentValue = 0
    
    weak var delegate: VuMeterViewDelegate?
    
    /// The max value of the Vu Meter
    @IBInspectable var maxValue: CGFloat = 100

    /// The main fill color of the Vu Meter
    @IBInspectable var fillColor: UIColor = .white {
        didSet {
            self.fillView.backgroundColor = fillColor
        }
    }
    
    /// The secondary fill color of the Vu Meter
    @IBInspectable var secondaryFillColor: UIColor = .white
    
    /// The step required to change from main color to the secondary color, from 0 to 1
    @IBInspectable var percentStep : CGFloat = 0

    /// Animation style of the Vu Meter
    var animation : AnimationStyle = .leftToRight

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
//        let bundle = Bundle(for: VuMeterView.self)

        let podBundle = Bundle(for: VuMeterView.self)
        if let bundleURL = podBundle.url(forResource: "CAFVuMeter", withExtension: "bundle") {
            if let bundle = Bundle(url: bundleURL) {
                bundle.loadNibNamed("VuMeterView", owner: self, options: nil)![0]
            }
        }
        
//        _ = bundle.loadNibNamed("VuMeterView", owner: self, options: nil)![0]
        
//        _ = Bundle.main.loadNibNamed("VuMeterView", owner: self, options: nil)![0]
        self.addSubview(view)
        view.frame = self.bounds
    }

    /**
     Set the value of the view meter.
     
     - Parameter newValue: The value to display
     */
    public func setValue(newValue: Int) {
        currentValue = Int(newValue)
        
        let baseSize = animation == .bottomToTop ? self.view.bounds.height / maxValue : self.view.bounds.width / maxValue
        let fillSize = baseSize * CGFloat(self.currentValue)
        var color = self.fillColor
        if fillSize > baseSize * (self.maxValue * self.percentStep) {
            color = secondaryFillColor
        }
        
        UIView.animate(withDuration: 0.1) {
            if self.animation == .bottomToTop {
                self.heightFillConstraint.constant = fillSize.rounded()
                self.widthFillConstraint.constant = self.view.bounds.width
            } else {
                self.heightFillConstraint.constant = self.view.bounds.height
                self.widthFillConstraint.constant = fillSize.rounded()
            }
            self.fillView.backgroundColor = color
            self.layoutIfNeeded()
        }
    }
    
    public func setStep(_ step: CGFloat, animated: Bool) {
        percentStep = step
        self.slider.setValue(Float(step * 100).rounded(), animated: animated)
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        percentStep = CGFloat(((sender as? UISlider)?.value ?? 0) / ((sender as? UISlider)?.maximumValue ?? 1))
        delegate?.didStepValueUpdate(CGFloat(((sender as? UISlider)?.value ?? 0) / ((sender as? UISlider)?.maximumValue ?? 1)))
    }
    
}
