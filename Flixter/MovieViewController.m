//
//  MovieViewController.m
//  Flixter
//
//  Created by Gui David on 6/15/22.
//

#import "MovieViewController.h"
#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"
#import "DetailsViewController.h"
#import "Movie.h"
#import "APIManager.h"

@interface MovieViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *movieTableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) NSArray *movies;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.movieTableView.dataSource = self;
    self.movieTableView.delegate = self;
    
    self.movieTableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.activityIndicator startAnimating];
    APIManager *manager = [APIManager new];
    [manager fetchNowPlaying:^(NSArray *movies, NSError *error) {
        self.movies = movies;
        [self.movieTableView reloadData];
    }];
    [self.activityIndicator stopAnimating];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchMovies) forControlEvents:UIControlEventValueChanged];
    [self.movieTableView insertSubview:self.refreshControl atIndex:0];
    
    
}

// - (void)fetchMovies {
    // Do any additional setup after loading the view.
    
//    NSURL *url = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/now_playing?api_key=cc0c89003acca85f5b67f4b08f101f65"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
//
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
//
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//           if (error != nil) {
//               NSLog(@"%@", [error localizedDescription]);
//               if (error.code == -1009) {
//                   UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Cannot get movies" message:@"The internet connect appears to be offline." preferredStyle:UIAlertControllerStyleAlert];
//
//                   UIAlertAction* tryAgain = [UIAlertAction actionWithTitle:@"Try Again" style:UIAlertActionStyleDefault
//                                                                    handler:^(UIAlertAction * action) {[self fetchMovies];}];
//
//                   [alert addAction:tryAgain];
//                   [self presentViewController:alert animated:YES completion:nil];
//               }
//           } else {
//               NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//
//               NSArray *dictionaries = dataDictionary[@"results"];
//               self.movies = [Movie moviesWithDictionaries:dictionaries];
//               [self.movieTableView reloadData];
//           }
//        [self.refreshControl endRefreshing];
//       }];
//        [task resume];
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idMovieCell"];
    
    cell.movie = self.movies[indexPath.row];

    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    Movie *dataToPass = self.movies[[self.movieTableView indexPathForCell:sender].row];
    DetailsViewController *detailVC = [segue destinationViewController];
    detailVC.movie = dataToPass;
}

@end
