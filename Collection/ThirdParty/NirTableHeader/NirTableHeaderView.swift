//
//  NirTableHeaderView.swift
//  TableHeaderViewAlbum
//
//  Created by Nirvana on 10/28/15.
//  Copyright © 2015 NSNirvana. All rights reserved.
//

import UIKit

class NirTableHeaderView: UIView {

    private var nirSubview: UIView?
    private var nirScrollview: UIScrollView?
    private var type = 0
    
    var tableView: UITableView?
    var maximumOffsetY: CGFloat?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(subview: UIView, andType type: Int) {
        super.init(frame: subview.frame)
        
        self.initialSetupForCustomSubView(subview, type: type)
    }
    
    func initialSetupForCustomSubView(subview: UIView, type: Int) {
        self.type = type
        
        self.nirSubview = subview
        self.nirSubview!.autoresizingMask = [.FlexibleLeftMargin, .FlexibleRightMargin, .FlexibleTopMargin, .FlexibleBottomMargin, .FlexibleHeight, .FlexibleWidth]
        
        let scrollView = UIScrollView(frame: self.bounds)
        self.nirScrollview = scrollView

        assert(nirSubview != nil, "nirSubView initialize failed")
        assert(nirScrollview != nil, "nirScrollView initialize failed")
        
        nirScrollview!.addSubview(nirSubview!)
        self.addSubview(nirScrollview!)
    }
    
    func layoutHeaderViewForScrollViewOffset(offset: CGPoint) {
        switch type {
        case 0:
            typeZeroParallax(offset)
        case 1:
            typeOneParallax(offset)
        case 2:
            typeTwoParallax(offset)
        case 3:
            typeThreeParallax(offset)
        case 4:
            typeFourParallax(offset)
        default:
            ()
        }
    }
    
    func typeZeroParallax(offset: CGPoint) {
        var delta: CGFloat = 0
        var rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
        
        delta = offset.y
        rect.origin.y += delta
        rect.size.height -= delta
        
        self.nirScrollview!.frame = rect
        self.clipsToBounds = false
    }
    
    func typeOneParallax(offset: CGPoint) {
        if (offset.y > 0)
        {
            
        } else {
            var delta: CGFloat = 0
            var rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
            
            delta = offset.y
            rect.origin.y += delta
            rect.size.height -= delta
            
            self.nirScrollview!.frame = rect
            self.clipsToBounds = false
        }
    }
    
    func typeTwoParallax(offset: CGPoint) {

    }

    func typeThreeParallax(offset: CGPoint) {
        guard maximumOffsetY != nil && tableView != nil else {
            print("maximumOffsetY或tableView未传入")
            return
        }
        if offset.y < maximumOffsetY! {
            tableView?.contentOffset.y = maximumOffsetY!
        } else {
            var delta: CGFloat = 0
            var rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
            
            delta = offset.y
            rect.origin.y += delta
            rect.size.height -= delta
            
            self.nirScrollview!.frame = rect
            self.clipsToBounds = false
        }
    }
    
    func typeFourParallax(offset: CGPoint) {
        if offset.y > 0 {
            var frame = self.nirScrollview!.frame
            frame.origin.y = offset.y
            self.nirScrollview?.frame = frame
            self.clipsToBounds = false
        } else {
            var delta: CGFloat = 0
            var rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
            
            delta = offset.y
            rect.origin.y += delta
            rect.size.height -= delta
            
            self.nirScrollview!.frame = rect
            self.clipsToBounds = false
        }
    }
    
}