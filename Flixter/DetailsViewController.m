//
//  DetailsViewController.m
//  Flixter
//
//  Created by Gui David on 6/16/22.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *expandedTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *expandedSmallPosterImage;
@property (weak, nonatomic) IBOutlet UIImageView *expandedBigPosterImage;
@property (weak, nonatomic) IBOutlet UILabel *expandedSynopsisLabel;
@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.expandedTitleLabel.text = self.movie.title;
    self.expandedSynopsisLabel.text = self.movie.synopsis;
    self.expandedSmallPosterImage.image = nil;
    if (self.movie.posterUrl != nil) {
        [self.expandedBigPosterImage setImageWithURL:self.movie.posterUrl];
        [self.expandedSmallPosterImage setImageWithURL:self.movie.posterUrl];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
