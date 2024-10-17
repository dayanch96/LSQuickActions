#import <UIKit/UIKit.h>

@interface CSQuickActionsView : UIView
@property (nonatomic, strong) UIControl *flashlightButton;
@property (nonatomic, strong) UIControl *cameraButton;
@end

%hook CSQuickActionsViewController
+ (BOOL)deviceSupportsButtons { return YES; }

- (id)quickActionsViewIfLoaded {
    CSQuickActionsView *quickActionsView = %orig;

    if (quickActionsView) {
        CGRect flashlightFrame = quickActionsView.flashlightButton.frame;
        CGRect cameraFrame = quickActionsView.cameraButton.frame;

        flashlightFrame.origin.x = 20;
        flashlightFrame.origin.y = quickActionsView.frame.size.height - flashlightFrame.size.height - 20;
        quickActionsView.flashlightButton.frame = flashlightFrame;

        cameraFrame.origin.x = quickActionsView.frame.size.width - cameraFrame.size.width - 20;
        cameraFrame.origin.y = quickActionsView.frame.size.height - cameraFrame.size.height - 20;
        quickActionsView.cameraButton.frame = cameraFrame;
    }

    return quickActionsView;
}
%end