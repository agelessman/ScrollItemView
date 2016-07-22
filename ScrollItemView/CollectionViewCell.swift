//
//  CollectionViewCell.swift
//  ScrollItemView
//
//  Created by 马超 on 16/7/22.
//  Copyright © 2016年 qikeyun. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    var cusView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)

      initialFromXib()
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    
//        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    
    func initialFromXib() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "CollectionViewCell", bundle: bundle)
        cusView = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        cusView.frame = bounds
        addSubview(cusView)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        super.touchesEnded(touches, withEvent: event)
    }

}
