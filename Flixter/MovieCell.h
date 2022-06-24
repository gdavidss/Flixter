//
//  MovieCell.h
//  Flixter
//
//  Created by Gui David on 6/16/22.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterImage;

@property (nonatomic, strong) Movie *movie;
//@property (nonatomic, strong) NSString *testeString;
//@property (nonatomic, strong) NSString *testeString2;


@end

NS_ASSUME_NONNULL_END
