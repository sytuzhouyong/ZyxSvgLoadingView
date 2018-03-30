# ZyxSvgLoadingView
show remote image with svg image placeholder


### 配置
1. 添加库 `libxml2.tbd`
2. `Build Settings`中的`Header Search Paths`中添加`${SDKROOT}/usr/include/libxml2`
3. 如果还有编译错误，在`Build Phases`中将`PocketSVG`的相关文件的`Compiler Flags`都加上`-w -Xanalyzer -analyzer-disable-all-checks`


### 调用方法
```
ZyxSvgLoadingView *loadingView = [[ZyxSvgLoadingView alloc] initWithFrame:CGRectMake(100, 100, 100, 100) svgImageNamed:@"loading" size:CGSizeMake(48, 32)];
loadingView.backgroundColor = [UIColor lightGrayColor];
[self.view addSubview:loadingView];
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [loadingView setImageWithURLString:@"https://static.pgyer.com/static-20180328/images/newHome/distribute.png"];
});
```
