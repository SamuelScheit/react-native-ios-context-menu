//
//  RNIContextMenuView+UIGestureRecognizerDelegate.swift
//  ReactNativeIosContextMenu
//
//  Created by Dominic Go on 11/2/23.
//

import Foundation

extension RNIContextMenuView: UIGestureRecognizerDelegate {
  
  public func gestureRecognizer(
    _ gestureRecognizer: UIGestureRecognizer,
    shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
  ) -> Bool {
    
    guard self.shouldPreventLongPressGestureFromPropagating,
          let longPressGestureRecognizer = self.longPressGestureRecognizer,
    
          gestureRecognizer === longPressGestureRecognizer,
          otherGestureRecognizer !== longPressGestureRecognizer
    else {
      return true;
    };
    
    otherGestureRecognizer.cancelTouch();
    return false;
  };
};