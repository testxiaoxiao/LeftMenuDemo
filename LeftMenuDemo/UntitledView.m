//
// UntitledView.m
// Generated by Core Animator version 1.0 on 15/12/4.
//
// DO NOT MODIFY THIS FILE. IT IS AUTO-GENERATED AND WILL BE OVERWRITTEN
//

#import "UntitledView.h"

@interface UntitledView ()
@property (strong, nonatomic) NSMapTable *completionBlocksByAnimation;
@end

@implementation UntitledView

#pragma mark - Life Cycle

- (instancetype)init
{
	return [self initWithFrame:CGRectMake(0,0,120,220)];
}

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self)
	{
		[self setupHierarchy];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self)
	{
		[self setupHierarchy];
	}
	return self;
}

#pragma mark - Scaling

- (void)layoutSubviews
{
	[super layoutSubviews];

	UIView *scalingView = self.viewsByName[@"__scaling__"];
	float xScale = self.bounds.size.width / scalingView.bounds.size.width;
	float yScale = self.bounds.size.height / scalingView.bounds.size.height;
	switch (self.contentMode) {
		case UIViewContentModeScaleToFill:
			break;
		case UIViewContentModeScaleAspectFill:
		{
			float scale = MAX(xScale, yScale);
			xScale = scale;
			yScale = scale;
			break;
		}
		default:
		{
			float scale = MIN(xScale, yScale);
			xScale = scale;
			yScale = scale;
			break;
		}
	}
	scalingView.transform = CGAffineTransformMakeScale(xScale, yScale);
	scalingView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
}

#pragma mark - Setup

- (void)setupHierarchy
{
	self.completionBlocksByAnimation = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsOpaqueMemory valueOptions:NSPointerFunctionsStrongMemory];
	NSMutableDictionary *viewsByName = [NSMutableDictionary dictionary];
	NSBundle *bundle = [NSBundle bundleForClass:[self class]];

	UIView *__scaling__ = [UIView new];
	__scaling__.bounds = CGRectMake(0, 0, 120, 220);
	__scaling__.center = CGPointMake(60.0, 110.0);
	__scaling__.layer.masksToBounds = YES;
	[self addSubview:__scaling__];
	viewsByName[@"__scaling__"] = __scaling__;

	UIView *untitled = [UIView new];
	untitled.bounds = CGRectMake(0, 0, 93.0, 134.0);
	untitled.layer.position = CGPointMake(60.000, 144.399);
	[__scaling__ addSubview:untitled];
	viewsByName[@"Untitled"] = untitled;

	UIImageView *trash = [UIImageView new];
	trash.bounds = CGRectMake(0, 0, 82.0, 110.0);
	UIImage *imgTrash = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"trash.png" ofType:nil]];
	trash.image = imgTrash;
	trash.contentMode = UIViewContentModeCenter;
	trash.layer.position = CGPointMake(46.500, 78.970);
	[untitled addSubview:trash];
	viewsByName[@"trash"] = trash;

	UIImageView *trashlid = [UIImageView new];
	trashlid.bounds = CGRectMake(0, 0, 93.0, 18.0);
	trashlid.layer.anchorPoint = CGPointMake(-0.000, 0.959);
	UIImage *imgTrashlid = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"trashlid.png" ofType:nil]];
	trashlid.image = imgTrashlid;
	trashlid.contentMode = UIViewContentModeCenter;
	trashlid.layer.position = CGPointMake(-0.012, 17.255);
	[untitled addSubview:trashlid];
	viewsByName[@"trashlid"] = trashlid;

	self.viewsByName = viewsByName;
}

#pragma mark - open

- (void)addOpenAnimation
{
	[self addOpenAnimationWithBeginTime:0 andFillMode:kCAFillModeBoth andRemoveOnCompletion:NO completion:NULL];
}

- (void)addOpenAnimationWithCompletion:(void (^)(BOOL finished))completionBlock
{
	[self addOpenAnimationWithBeginTime:0 andFillMode:kCAFillModeBoth andRemoveOnCompletion:NO completion:completionBlock];
}

- (void)addOpenAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion
{
	[self addOpenAnimationWithBeginTime:0 andFillMode:removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth andRemoveOnCompletion:removedOnCompletion completion:NULL];
}

- (void)addOpenAnimationAndRemoveOnCompletion:(BOOL)removedOnCompletion completion:(void (^)(BOOL finished))completionBlock
{
	[self addOpenAnimationWithBeginTime:0 andFillMode:removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth andRemoveOnCompletion:removedOnCompletion completion:completionBlock];
}

- (void)addOpenAnimationWithBeginTime:(CFTimeInterval)beginTime andFillMode:(NSString *)fillMode andRemoveOnCompletion:(BOOL)removedOnCompletion completion:(void (^)(BOOL finished))completionBlock
{
	CAMediaTimingFunction *anticOverTiming = [CAMediaTimingFunction functionWithControlPoints:0.42 :-0.30 :0.58 :1.30];

	if (completionBlock)
	{
		CABasicAnimation *representativeAnimation = [CABasicAnimation animationWithKeyPath:@"not.a.real.key"];
		representativeAnimation.duration = 2.500;
		representativeAnimation.delegate = self;
		[self.layer addAnimation:representativeAnimation forKey:@"Open"];
		[self.completionBlocksByAnimation setObject:completionBlock forKey:[self.layer animationForKey:@"Open"]];
	}

	CAKeyframeAnimation *trashlidRotationAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
	trashlidRotationAnimation.duration = 2.500;
	trashlidRotationAnimation.values = @[@(0.000), @(-1.615)];
	trashlidRotationAnimation.keyTimes = @[@(0.000), @(1.000)];
	trashlidRotationAnimation.timingFunctions = @[anticOverTiming];
	trashlidRotationAnimation.beginTime = beginTime;
	trashlidRotationAnimation.fillMode = fillMode;
	trashlidRotationAnimation.removedOnCompletion = removedOnCompletion;
	[[self.viewsByName[@"trashlid"] layer] addAnimation:trashlidRotationAnimation forKey:@"open_Rotation"];
}

- (void)removeOpenAnimation
{
	[self.layer removeAnimationForKey:@"Open"];
	[[self.viewsByName[@"trashlid"] layer] removeAnimationForKey:@"open_Rotation"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
	void (^completion)(BOOL) = [self.completionBlocksByAnimation objectForKey:anim];
	[self.completionBlocksByAnimation removeObjectForKey:anim];
	if (completion)
	{
		completion(flag);
	}
}

- (void)removeAllAnimations
{
	for (UIView *view in self.viewsByName.allValues)
	{
		[view.layer removeAllAnimations];
	}
	[self.layer removeAnimationForKey:@"Open"];
}

@end