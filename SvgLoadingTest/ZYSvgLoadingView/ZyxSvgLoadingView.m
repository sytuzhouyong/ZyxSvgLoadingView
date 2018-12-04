//
//  ZyxSvgLoadingView.m
//  ZYUIKit
//
//  Created by zhouyong on 2017/12/22.
//

#import "ZyxSvgLoadingView.h"
#import "PocketSVG.h"


@interface ZyxSvgLoadingView ()

@property (nonatomic, copy) NSString *currentURLString;

@end

@implementation ZyxSvgLoadingView

- (instancetype)initWithFrame:(CGRect)frame svgImageNamed:(NSString *)name size:(CGSize)size {
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = YES;
        
        SVGImageView *loadingView = [[SVGImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        [loadingView setSvgName:name];
        [self addSubview:loadingView];
        
        UIImageView *contentView = [[UIImageView alloc] init];
        contentView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:contentView];
        contentView.alpha = 0;
        
        _loadingView = loadingView;
        _contentImageView = contentView;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentImageView.frame = self.bounds;
    
    CGRect frame = self.frame;
    CGSize loadingSize = self.loadingView.frame.size;
    CGFloat x = (frame.size.width - loadingSize.width) / 2;
    CGFloat y = (frame.size.height - loadingSize.height) / 2;
    self.loadingView.frame = CGRectMake(x, y, loadingSize.width, loadingSize.height);
}

- (void)setSvgImageName:(NSString *)svgImageName {
    _svgImageName = [svgImageName copy];
    [self.loadingView setSvgName:svgImageName];
}

- (void)backToInitState {
    self.loadingView.alpha = 1;
    self.contentImageView.alpha = 0;
}

- (void)setImageWithURL:(NSURL *)url animated:(BOOL)animated {
    if ([url.absoluteString isEqualToString:self.currentURLString] && self.contentImageView.image != nil) {
        return;
    }
    
    self.contentImageView.image = nil;
    
    self.loadingView.alpha = 1;
    self.contentImageView.alpha = 0;
    
//    __weak __typeof(&*self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = nil;
        if ([url.pathExtension isEqualToString:@"gif"]) {
            // 这里调用gif的image函数，可以使用SDWebImage中的方法
            //            image = [UIImage animatedGIFWithData:data];
            image = [UIImage imageWithData:data];
        } else {
            image = [UIImage imageWithData:data];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self showImage:image withURL:url animated:animated];
        });
    });
}

- (void)showImage:(UIImage *)image withURL:(NSURL *)url animated:(BOOL)animated {
    self.currentURLString = url.absoluteString;
    self.contentImageView.image = image;
    if (animated) {
        [UIView animateWithDuration:0.35 animations:^{
            self.loadingView.alpha = 0;
            self.contentImageView.alpha = 1;
        }];
    } else {
        self.loadingView.alpha = 0;
        self.contentImageView.alpha = 1;
    }
}

- (void)setImageWithURL:(NSURL *)url {
    [self setImageWithURL:url animated:YES];
}

- (void)setImageWithURLString:(NSString *)url {
    [self setImageWithURL:[NSURL URLWithString:url] animated:YES];
}

- (void)setImageWithURLString:(NSString *)url animated:(BOOL)animated {
    [self setImageWithURL:[NSURL URLWithString:url] animated:animated];
}

- (void)setImageNamed:(NSString *)imageName {
    _contentImageView.image = [UIImage imageNamed:imageName];
    _loadingView.alpha = 0;
    _contentImageView.alpha = 1;
}

@end
