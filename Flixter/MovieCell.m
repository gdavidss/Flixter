//
//  MovieCell.m
//  Flixter
//
//  Created by Gui David on 6/16/22.
//

#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"

@implementation MovieCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setMovie:(Movie *)movie {
    _movie = movie;

    self.titleLabel.text = self.movie.title;
    self.synopsisLabel.text = self.movie.synopsis;

    self.posterImage.image = nil;
    if (self.movie.posterUrl != nil) {
            [self.posterImage setImageWithURL:self.movie.posterUrl];
        }
}

//- (void)settesteString:(NSString *)testeString {
//    _testeString = @"hello";
//    self.testeString2 = [testeString stringByAppendingString:@"chicken-pox"];
//    NSLog(@"%@", self.testeString2);
//}

@end
