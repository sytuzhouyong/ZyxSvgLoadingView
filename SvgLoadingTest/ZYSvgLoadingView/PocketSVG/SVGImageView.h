/*
 * This file is part of the PocketSVG package.
 * Copyright (c) Ponderwell, Ariel Elkin, Fjölnir Ásgeirsson, and Contributors
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "SVGPortability.h"


NS_ASSUME_NONNULL_BEGIN

@class SVGBezierPath;

/*!
 * @brief A view that renders an SVG file.
 *
 */
IB_DESIGNABLE
@interface SVGImageView : PSVGView

/*!
 * @brief Initialises a view that renders the provided SVG.
 * @param url The URL of the SVG file.
 * @code let url = NSBundle.mainBundle().URLForResource("svg_file_name", withExtension: "svg")!
 let svgImageView = SVGImageView(contentsOfURL: url)
 *
 */
- (instancetype)initWithContentsOfURL:(NSURL *)url;


/*!
 * @discussion The SVG paths the view should draw.
 *
 */
@property (nonatomic, copy) NSArray<SVGBezierPath*> *paths;


/*!
 * @brief A color to fill the SVG shape with.
 * @discussion Setting this property solidly fills the shape formed by the SVG path with the given color.
 *
 */
@property(nonatomic, copy) IBInspectable PSVGColor *fillColor;


/*!
 * @brief The color to stroke the path with.
 * @discussion Setting this property solidly colors the path generated by the SVG file.
 *
 */
@property(nonatomic, copy) IBInspectable PSVGColor *strokeColor;


/*!
 * @brief Specifies whether line thickness should be scaled when scaling paths.
 *
 */
@property(nonatomic) IBInspectable BOOL scaleLineWidth;

- (void)setSvgName:(NSString *)svgName;

@end
NS_ASSUME_NONNULL_END
