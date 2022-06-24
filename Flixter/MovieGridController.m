//
//  MovieGridController.m
//  Flixter
//
//  Created by Gui David on 6/17/22.
//

#import "MovieGridController.h"
#import "UIImageView+AFNetworking.h"
#import "MovieGridCell.h"
#import "DetailsViewController.h"


@interface MovieGridController () <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *movies;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@end

@implementation MovieGridController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchMovies];
}

- (void)fetchMovies {
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    
    // Do any additional setup after loading the view.
    NSURL *url = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/now_playing?api_key=cc0c89003acca85f5b67f4b08f101f65"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error != nil) {
               NSLog(@"%@", [error localizedDescription]);
           if (error.code == -1009) {
               UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Cannot get movies" message:@"The internet connect appears to be offline." preferredStyle:UIAlertControllerStyleAlert];
               
               UIAlertAction* tryAgain = [UIAlertAction actionWithTitle:@"Try Again" style:UIAlertActionStyleDefault
                                                                handler:^(UIAlertAction * action) {[self fetchMovies];}];
               
               [alert addAction:tryAgain];
               [self presentViewController:alert animated:YES completion:nil];
           }
           }
           else {
               NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
               
               self.movies = dataDictionary[@"results"];
               [self.collectionView reloadData];
           }
        [self.refreshControl endRefreshing];
       }];
        [task resume];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    Movie *dataToPass = self.movies[[self.collectionView indexPathForCell:sender].row];
    DetailsViewController *detailVC = [segue destinationViewController];
    detailVC.movie = dataToPass;
 }

 
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.movies.count;
}


 - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
     
     movieGridCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"movieCollectionCell" forIndexPath:indexPath];
     
     NSDictionary *movie = self.movies[indexPath.row];
     
     NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
     NSString *posterURLString = movie[@"poster_path"];
     NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
     NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
     
     cell.posterImage.image = nil;
//     [cell.posterImage setImageWithURL:posterURL];
     [cell.posterImage setImageWithURL:posterURL];
     
     return cell;
 }

@end
