//
//  DetailsViewController.m
//  Flixter
//
//  Created by Gui David on 6/16/22.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface DetailsViewController ()
@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.expandedTitleLabel.text = self.detailDict[@"title"];
    self.expandedSynopsisLabel.text = self.detailDict[@"overview"];
   
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = self.detailDict[@"poster_path"];
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
    
    self.expandedSmallPosterImage.image = nil;
    self.expandedBigPosterImage.image = nil;

    [self.expandedSmallPosterImage setImageWithURL:posterURL];
    [self.expandedBigPosterImage setImageWithURL:posterURL];

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
