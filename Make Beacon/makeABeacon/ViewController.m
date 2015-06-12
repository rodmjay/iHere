//
//  ViewController.m
//  makeABeacon
//
//  Created by Nathan Larson on 6/11/15.
//  Copyright (c) 2015 Nathan Larson. All rights reserved.
//

#import "ViewController.h"
#import <CoreBluetooth/CoreBluetooth.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CBPeripheralManagerDelegate, CBCentralManagerDelegate>

@property (nonatomic) CBPeripheralManager *peripManager;
@property (nonatomic) CBCentralManager *centralManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _peripManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil];
    _centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil options:0];
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
    //    UILocalNotification *notification = [[UILocalNotification alloc] init];
    //    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:1];
    //    notification.alertBody = @"State Changed!";
    //    notification.timeZone = [NSTimeZone defaultTimeZone];
    //    notification.soundName = UILocalNotificationDefaultSoundName;
    //
    //    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    //
    
    switch (central.state)
    {
        case CBCentralManagerStateUnsupported:
        {
            NSLog(@"State: Unsupported");
        } break;
            
        case CBCentralManagerStateUnauthorized:
        {
            NSLog(@"State: Unauthorized");
        } break;
            
        case CBCentralManagerStatePoweredOff:
        {
            NSLog(@"State: Powered Off");
        } break;
            
        case CBCentralManagerStatePoweredOn:
        {
            NSDictionary *options = @{
                                      CBCentralManagerScanOptionAllowDuplicatesKey: @YES
                                      };
            
            NSLog(@"State: Powered On");
            [self.centralManager scanForPeripheralsWithServices:nil options:options];
        } break;
            
        case CBCentralManagerStateUnknown:
        {
            NSLog(@"State: Unknown");
        } break;
            
        default:
        {
        }
    }
}


- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral
{
    if (peripheral.state != CBPeripheralManagerStatePoweredOn) {
        return;
    }
    
    NSString *identifier = @"MyBeacon";
    //Construct the region
    
   // NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6"];
   // CLBeaconRegion *beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:identifier];
    
    NSDictionary *advertisingData = @{CBAdvertisementDataLocalNameKey:@"my-peripheral",
                                      CBAdvertisementDataServiceUUIDsKey:@[[CBUUID UUIDWithString:@"2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6"]]};
    
    // Start advertising over BLE
    [_peripManager startAdvertising:advertisingData];
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral
     advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
    NSLog(@"%@", peripheral);
    if ([[advertisementData valueForKey:@"kCBAdvDataLocalName"] isEqualToString:@"my-peripheral"]) {
        [_centralManager stopScan];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"HEY" message:@"Found it!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
