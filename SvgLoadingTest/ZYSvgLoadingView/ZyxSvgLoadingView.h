//
//  ZyxSvgLoadingView.h
//  ZYUIKit
//
//  Created by zhouyong on 2017/12/22.
//

#import <UIKit/UIKit.h>
#import "PocketSVG.h"

@interface ZyxSvgLoadingView : UIView

@property (nonatomic, strong, readonly) SVGImageView *loadingView;
@property (nonatomic, strong, readonly) UIImageView *contentImageView;
@property (nonatomic, copy) NSString *svgImageName;

- (instancetype)initWithFrame:(CGRect)frame svgImageNamed:(NSString *)name size:(CGSize)size;

// 为了让此view作为可复用视图时，loadingview不可见的问题，在cellforindexpath等方法中调用下
- (void)backToInitState;

// 设置远程图片
- (void)setImageWithURL:(NSURL *)url;
- (void)setImageWithURL:(NSURL *)url animated:(BOOL)animated;
- (void)setImageWithURLString:(NSString *)url;
- (void)setImageWithURLString:(NSString *)url animated:(BOOL)animated;

// 设置本地图片
- (void)setImageNamed:(NSString *)imageName;

@end
