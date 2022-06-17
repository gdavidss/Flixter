//
//  DetailsViewController.h
//  Flixter
//
//  Created by Gui David on 6/16/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *expandedTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *expandedSmallPosterImage;
@property (weak, nonatomic) IBOutlet UIImageView *expandedBigPosterImage;
@property (weak, nonatomic) IBOutlet UILabel *expandedSynopsisLabel;
@property (nonatomic, strong) NSDictionary *detailDict;

@end

NS_ASSUME_NONNULL_END
