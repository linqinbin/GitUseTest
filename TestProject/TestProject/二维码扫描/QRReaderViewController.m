//
//  QRReaderViewController.m
//  YunWan
//
//  Created by 张威 on 15/1/26.
//  Copyright (c) 2015年 ZhangWei. All rights reserved.
//

#import "QRReaderViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <objc/runtime.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface QRReaderViewController() <AVCaptureMetadataOutputObjectsDelegate,UIActionSheetDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong,nonatomic ) AVCaptureSession           *session;
@property (strong,nonatomic ) AVCaptureVideoPreviewLayer *previewLayer;
@property (strong, nonatomic) UILabel                    *infoLabel;
@property (nonatomic, strong) UIImageView                *scanLineImageView;
@property (nonatomic, strong) NSTimer
*scanLineTimer;
@property (strong, nonatomic) UIImagePickerController *imagePicker;
@end

@implementation QRReaderViewController

- (void)initViewAndSubViews {
    
    CGRect mainBounds = [[UIScreen mainScreen] bounds];
    self.view.frame = mainBounds;
    
    CGRect readerFrame = self.view.frame;
    CGSize viewFinderSize = CGSizeMake(readerFrame.size.width - 80, readerFrame.size.width - 80);
    /**********************************摄像头开始**********************************/
    // 1 实例化摄像头设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    // An AVCaptureDevice object abstracts a physical capture device that provides input data (such as audio or video) to an AVCaptureSession object.
    
    // 2 设置输入,把摄像头作为输入设备
    // 因为模拟器是没有摄像头的，因此在此最好做个判断
    NSError *error = nil;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (error) {
        NSLog(@"没有摄像头%@", error.localizedDescription);
        return;
    }
    
    // 3 设置输出(Metadata元数据)
    AVCaptureMetadataOutput *outPut = [[AVCaptureMetadataOutput alloc] init];
    CGRect scanCrop =
    CGRectMake((readerFrame.size.width - viewFinderSize.width)/2,
               (readerFrame.size.height - viewFinderSize.height)/2,
               viewFinderSize.width,
               viewFinderSize.height);
    
    outPut.rectOfInterest =
    CGRectMake(scanCrop.origin.y/readerFrame.size.height,
               scanCrop.origin.x/readerFrame.size.width,
               scanCrop.size.height/readerFrame.size.height,
               scanCrop.size.width/readerFrame.size.width
               );
    
    // 3.1 设置输出的代理
    // 使用主线程队列，相应比较同步，使用其他队列，相应不同步，容易让用户产生不好的体验。
    [outPut setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    // 4 拍摄会话
    AVCaptureSession *session = [[AVCaptureSession alloc]init];
    session.sessionPreset = AVCaptureSessionPreset640x480;
    // 添加session的输入和输出
    [session addInput:input];
    [session addOutput:outPut];
    // 4.1 设置输出的格式
    [outPut setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    
   
    
    self.session = session;
    /**********************************摄像头结束**********************************/
    
    /* 画一个取景框开始 */
    // 正方形取景框的边长
    CGFloat edgeLength = 20.0;
    
    UIImageView *topLeft =
    [[UIImageView alloc] initWithFrame:CGRectMake((readerFrame.size.width - viewFinderSize.width)/2,
                                                  (readerFrame.size.height - viewFinderSize.height)/2,
                                                  edgeLength, edgeLength)];
    topLeft.image = [UIImage imageNamed:@"qr_top_left.png"];
    [self.view addSubview:topLeft];
    
    UIImageView *topRight =
    [[UIImageView alloc] initWithFrame:CGRectMake((readerFrame.size.width + viewFinderSize.width)/2 - edgeLength,
                                                  (readerFrame.size.height - viewFinderSize.height)/2,
                                                  edgeLength, edgeLength)];
    topRight.image = [UIImage imageNamed:@"qr_top_right.png"];
    [self.view addSubview:topRight];
    
    UIImageView *bottomLeft =
    [[UIImageView alloc] initWithFrame:CGRectMake((readerFrame.size.width - viewFinderSize.width)/2,
                                                  (readerFrame.size.height + viewFinderSize.height)/2 - edgeLength,
                                                  edgeLength, edgeLength)];
    bottomLeft.image = [UIImage imageNamed:@"qr_bottom_left"];
    [self.view addSubview:bottomLeft];
    
    UIImageView *bottomRight =
    [[UIImageView alloc] initWithFrame:CGRectMake((readerFrame.size.width + viewFinderSize.width)/2 - edgeLength,
                                                  (readerFrame.size.height + viewFinderSize.height)/2 - edgeLength,
                                                  edgeLength, edgeLength)];
    bottomRight.image = [UIImage imageNamed:@"qr_bottom_right"];
    [self.view addSubview:bottomRight];
    
    UIView *topLine =
    [[UIView alloc] initWithFrame:CGRectMake((readerFrame.size.width - viewFinderSize.width)/2-1,
                                             (readerFrame.size.height - viewFinderSize.height)/2-1,
                                             viewFinderSize.width+2, 1)];
    topLine.backgroundColor = [UIColor grayColor];
    [self.view addSubview:topLine];
    
    UIView *bottomLine =
    [[UIView alloc] initWithFrame:CGRectMake((readerFrame.size.width - viewFinderSize.width)/2-1,
                                             (readerFrame.size.height + viewFinderSize.height)/2,
                                             viewFinderSize.width+2, 1)];
    bottomLine.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bottomLine];
    
    UIView *leftLine =
    [[UIView alloc] initWithFrame:CGRectMake((readerFrame.size.width - viewFinderSize.width)/2-1,
                                             (readerFrame.size.height - viewFinderSize.height)/2-1,
                                             1, viewFinderSize.height+2)];
    leftLine.backgroundColor = [UIColor grayColor];
    [self.view addSubview:leftLine];
    
    UIView *rightLine =
    [[UIView alloc] initWithFrame:CGRectMake((readerFrame.size.width + viewFinderSize.width)/2,
                                             (readerFrame.size.height - viewFinderSize.height)/2-1,
                                             1, viewFinderSize.height+2)];
    rightLine.backgroundColor = [UIColor grayColor];
    [self.view addSubview:rightLine];
    
    self.scanLineImageView =
    [[UIImageView alloc] initWithFrame:CGRectMake((readerFrame.size.width - 230)/2,
                                                  (readerFrame.size.height - viewFinderSize.height)/2,
                                                  230, 10)];
    self.scanLineImageView.image = [UIImage imageNamed:@"qr_scan_line"];
    
    [self.view addSubview:self.scanLineImageView];
    
    /* 画一个取景框结束 */
    
    /* 配置取景框之外颜色开始 */
    // scanCrop
    UIView *viewTopScan =
    [[UIView alloc] initWithFrame:CGRectMake(0, 0, mainBounds.size.width, scanCrop.origin.y)];
    
    UIView *viewBottomScan =
    [[UIView alloc] initWithFrame:CGRectMake(0, scanCrop.origin.y+scanCrop.size.height,
                                             mainBounds.size.width,
                                             mainBounds.size.height - scanCrop.size.height - scanCrop.origin.y)];
    
    UIView *viewLeftScan =
    [[UIView alloc] initWithFrame:CGRectMake(0, scanCrop.origin.y, scanCrop.origin.x, scanCrop.size.height)];
    
    UIView *viewRightScan =
    [[UIView alloc] initWithFrame:CGRectMake(scanCrop.origin.x + scanCrop.size.width,
                                             scanCrop.origin.y,
                                             mainBounds.size.width - scanCrop.origin.x - scanCrop.size.width,
                                             scanCrop.size.height)];
    viewTopScan.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.2];
    viewBottomScan.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.2];
    viewLeftScan.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.2];
    viewRightScan.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.2];
    [self.view addSubview:viewTopScan];
    [self.view addSubview:viewBottomScan];
    [self.view addSubview:viewLeftScan];
    [self.view addSubview:viewRightScan];
    
    /* 配置取景框之外颜色结束 */
    
    self.infoLabel =
    [[UILabel alloc] initWithFrame:CGRectMake((readerFrame.size.width - viewFinderSize.width)/2,
                                              (readerFrame.size.height + viewFinderSize.height)/2 + 20,
                                              viewFinderSize.width, 30)];
    self.infoLabel.text = @"对准二维码图案,即可自动扫描.";
    self.infoLabel.font = [UIFont systemFontOfSize:13.0];
    self.infoLabel.layer.cornerRadius = self.infoLabel.frame.size.height / 2;
    self.infoLabel.layer.backgroundColor = [[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5] CGColor];
    self.infoLabel.textColor = [UIColor whiteColor];
    self.infoLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:self.infoLabel];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViewAndSubViews];
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithTitle:@"更多" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClick)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
}
- (void)rightBarButtonClick{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从相册选取二维码",@"打开闪光灯", nil];
    [actionSheet showInView:self.view];
}
#pragma mark UIActionSheet Delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%ld",buttonIndex);
    switch (buttonIndex) {
        case 0:
        {
            [self selectImageFromAlbum];
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
            
        default:
            break;
    }
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"扫一扫";
    
    // 5 设置预览图层(用来让用户能够看到扫描情况)
    AVCaptureVideoPreviewLayer *preview = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    // AVCaptureVideoPreviewLayer -- to show the user what a camera is recording
    // 5.1 设置preview图层的属性
    [preview setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    // 5.2设置preview图层的大小
    
    [preview setFrame:self.view.bounds];
    //5.3将图层添加到视图的图层
    [self.view.layer insertSublayer:preview atIndex:0];
    self.previewLayer = preview;
    
    //6.启动会话
    [self.session startRunning];
     [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];

}

- (void)viewDidAppear:(BOOL)animated {
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (error) {
        NSLog(@"没有摄像头%@", error.localizedDescription);
        input = nil;
        [self.navigationController popViewControllerAnimated:NO];
        return;
    }
    
    if (self.scanLineTimer == nil) {
        [self moveUpAndDownLine];
        [self createTimer];
    }
    
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.session stopRunning];
    [self.previewLayer removeFromSuperlayer];
}

// 控制散光灯
- (void)torchSwitch:(id)sender {
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error;
    if (device.hasTorch) {  // 判断设备是否有散光灯
        BOOL b = [device lockForConfiguration:&error];
        if (!b) {
            if (error) {
                NSLog(@"lock torch configuration error:%@", error.localizedDescription);
            }
            return;
        }
        device.torchMode =
        (device.torchMode == AVCaptureTorchModeOff ? AVCaptureTorchModeOn : AVCaptureTorchModeOff);
        [device unlockForConfiguration];
    }
}

#define LINE_SCAN_TIME  3.0     // 扫描线从上到下扫描所历时间（s）

- (void)createTimer {
    self.scanLineTimer =
    [NSTimer scheduledTimerWithTimeInterval:LINE_SCAN_TIME
                                     target:self
                                   selector:@selector(moveUpAndDownLine)
                                   userInfo:nil
                                    repeats:YES];
}

// 扫描条上下滚动
- (void)moveUpAndDownLine {
    CGRect readerFrame = self.view.frame;
    CGSize viewFinderSize = CGSizeMake(self.view.frame.size.width - 80, self.view.frame.size.width - 80);
    
    CGRect scanLineframe = self.scanLineImageView.frame;
    scanLineframe.origin.y =
    (readerFrame.size.height - viewFinderSize.height)/2;
    self.scanLineImageView.frame = scanLineframe;
    self.scanLineImageView.hidden = NO;
    
    __weak __typeof(self) weakSelf = self;
    
    [UIView animateWithDuration:LINE_SCAN_TIME - 0.05
                     animations:^{
                         CGRect scanLineframe = weakSelf.scanLineImageView.frame;
                         scanLineframe.origin.y =
                         (readerFrame.size.height + viewFinderSize.height)/2 -
                         weakSelf.scanLineImageView.frame.size.height;
                         
                         weakSelf.scanLineImageView.frame = scanLineframe;
                     }
                     completion:^(BOOL finished) {
                         weakSelf.scanLineImageView.hidden = YES;
                     }];
}

#pragma mark - method Action


- (void)restartScan
{
    //5.3将图层添加到视图的图层
    [self.view.layer insertSublayer:self.previewLayer atIndex:0];
    
    //6.启动会话
    [self.session startRunning];
}

#pragma mark AVCaptureMetadataOutputObjectsDelegate

//此方法是在识别到QRCode并且完成转换，如果QRCode的内容越大，转换需要的时间就越长。
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    // 会频繁的扫描，调用代理方法
    // 1如果扫描完成，停止会话
    [self.session stopRunning];
    //2删除预览图层
    [self.previewLayer removeFromSuperlayer];
    //设置界面显示扫描结果
    if (metadataObjects.count > 0) {
        AVMetadataMachineReadableCodeObject *obj = metadataObjects[0];
        [self dealScanResult:obj.stringValue];
    }
}

- (void)dealScanResult:(NSString *)result
{
    NSLog(@"%@",result);
    NSArray *temp = [result componentsSeparatedByString:@"data="];
    if (temp.count > 1) {
        NSString *codeStr = temp[1];
        NSLog(@"%@",codeStr);
    } else {
        NSLog(@"二维码数据出错，请更换重试");
    }
}

- (NSInteger)productIDFromURLStr:(NSString *)urlStr
{
    NSRange range = [urlStr rangeOfString:@"ProductDetails.aspx?ProductId"];
    NSString *productIDStr = [urlStr substringFromIndex:range.location + range.length + 1];
    NSLog(@"scanProduct--%@",productIDStr);
    return [productIDStr integerValue];
}
#pragma mark 从图库选取图片
- (void)selectImageFromAlbum{
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    self.imagePicker.mediaTypes = @[(NSString *)kUTTypeImage];
    [self presentViewController:self.imagePicker animated:YES completion:NULL];
}
#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString *)kUTTypeMovie]) {
        NSURL *videoURL = info[UIImagePickerControllerMediaURL];
        [picker dismissViewControllerAnimated:YES completion:nil];

    }else{
        UIImage *orgImage = info[UIImagePickerControllerOriginalImage];
        
        
        
        
        
        
        
        //iOS8及以后使用
        NSData *imageData = UIImageJPEGRepresentation(orgImage, 1);
        // kCIContextUseSoftwareRenderer : 软件渲染 -- 可以消除 "BSXPCMessage received error for message: Connection interrupted" 警告
        // kCIContextPriorityRequestLow : 低优先级在 GPU 渲染-- 设置为false可以加快图片处理速度
        CIContext *context = [CIContext contextWithOptions:@{kCIContextUseSoftwareRenderer : @(true), kCIContextPriorityRequestLow : @(false)}];
        
        CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:context options:nil];
        CIImage *ciImage = [CIImage imageWithData:imageData];
        NSArray *ar = [detector featuresInImage:ciImage];
        CIQRCodeFeature *feature = [ar firstObject];
        NSLog(@"detector: %@", detector);
        NSLog(@"context: %@", feature.messageString);
        
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.imagePicker dismissViewControllerAnimated:YES completion:nil];
}
- (UIImagePickerController *)imagePicker{
    if (_imagePicker == nil) {
        _imagePicker = [[UIImagePickerController alloc] init];
        _imagePicker.delegate = self;
    }
    return _imagePicker;
}

@end
