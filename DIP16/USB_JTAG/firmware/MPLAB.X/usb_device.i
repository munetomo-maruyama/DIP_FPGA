#line 1 "../../mla/framework/usb/src/usb_device.c"
#line 1 "../../mla/framework/usb/src/usb_device.c"

#line 17 "../../mla/framework/usb/src/usb_device.c"
 



#line 41 "../../mla/framework/usb/src/usb_device.c"
 









#line 1 "/Applications/microchip/mplabc18/v3.46/bin/../h/stddef.h"
 

#line 4 "/Applications/microchip/mplabc18/v3.46/bin/../h/stddef.h"

typedef unsigned char wchar_t;


#line 10 "/Applications/microchip/mplabc18/v3.46/bin/../h/stddef.h"
 
typedef signed short int ptrdiff_t;
typedef signed short int ptrdiffram_t;
typedef signed short long int ptrdiffrom_t;


#line 20 "/Applications/microchip/mplabc18/v3.46/bin/../h/stddef.h"
 
typedef unsigned short int size_t;
typedef unsigned short int sizeram_t;
typedef unsigned short long int sizerom_t;


#line 34 "/Applications/microchip/mplabc18/v3.46/bin/../h/stddef.h"
 
#line 36 "/Applications/microchip/mplabc18/v3.46/bin/../h/stddef.h"


#line 41 "/Applications/microchip/mplabc18/v3.46/bin/../h/stddef.h"
 
#line 43 "/Applications/microchip/mplabc18/v3.46/bin/../h/stddef.h"

#line 45 "/Applications/microchip/mplabc18/v3.46/bin/../h/stddef.h"
#line 51 "../../mla/framework/usb/src/usb_device.c"










#line 62 "../../mla/framework/usb/src/usb_device.c"
#line 64 "../../mla/framework/usb/src/usb_device.c"






#line 71 "../../mla/framework/usb/src/usb_device.c"
    
    
    
#line 75 "../../mla/framework/usb/src/usb_device.c"
#line 76 "../../mla/framework/usb/src/usb_device.c"
#line 77 "../../mla/framework/usb/src/usb_device.c"

#line 79 "../../mla/framework/usb/src/usb_device.c"
#line 81 "../../mla/framework/usb/src/usb_device.c"
#line 82 "../../mla/framework/usb/src/usb_device.c"
#line 83 "../../mla/framework/usb/src/usb_device.c"

#line 85 "../../mla/framework/usb/src/usb_device.c"
    
    
#line 88 "../../mla/framework/usb/src/usb_device.c"
#line 89 "../../mla/framework/usb/src/usb_device.c"

#line 91 "../../mla/framework/usb/src/usb_device.c"
    
    
#line 94 "../../mla/framework/usb/src/usb_device.c"
#line 95 "../../mla/framework/usb/src/usb_device.c"

#line 97 "../../mla/framework/usb/src/usb_device.c"
#line 106 "../../mla/framework/usb/src/usb_device.c"
#line 108 "../../mla/framework/usb/src/usb_device.c"
#line 109 "../../mla/framework/usb/src/usb_device.c"






typedef union
{
    uint8_t Val;
    struct __PACKED
    {
        unsigned b0:1;
        unsigned b1:1;
        unsigned b2:1;
        unsigned b3:1;
        unsigned b4:1;
        unsigned b5:1;
        unsigned b6:1;
        unsigned b7:1;
    } bits;
} uint8_t_VAL, uint8_t_BITS;






USB_VOLATILE USB_DEVICE_STATE USBDeviceState;
USB_VOLATILE uint8_t USBActiveConfiguration;
USB_VOLATILE uint8_t USBAlternateInterface[USB_MAX_NUM_INT];
volatile BDT_ENTRY *pBDTEntryEP0OutCurrent;
volatile BDT_ENTRY *pBDTEntryEP0OutNext;
volatile BDT_ENTRY *pBDTEntryOut[USB_MAX_EP_NUMBER+1];
volatile BDT_ENTRY *pBDTEntryIn[USB_MAX_EP_NUMBER+1];
USB_VOLATILE uint8_t shortPacketStatus;
USB_VOLATILE uint8_t controlTransferState;
USB_VOLATILE IN_PIPE inPipes[1];
USB_VOLATILE OUT_PIPE outPipes[1];
USB_VOLATILE uint8_t *pDst;
USB_VOLATILE bool RemoteWakeup;
USB_VOLATILE bool USBBusIsSuspended;
USB_VOLATILE USTAT_FIELDS USTATcopy;
USB_VOLATILE uint8_t endpoint_number;
USB_VOLATILE bool BothEP0OutUOWNsSet;
USB_VOLATILE EP_STATUS ep_data_in[USB_MAX_EP_NUMBER+1];
USB_VOLATILE EP_STATUS ep_data_out[USB_MAX_EP_NUMBER+1];
USB_VOLATILE uint8_t USBStatusStageTimeoutCounter;
volatile bool USBDeferStatusStagePacket;
volatile bool USBStatusStageEnabledFlag1;
volatile bool USBStatusStageEnabledFlag2;
volatile bool USBDeferINDataStagePackets;
volatile bool USBDeferOUTDataStagePackets;

 
#line 164 "../../mla/framework/usb/src/usb_device.c"
#line 166 "../../mla/framework/usb/src/usb_device.c"

volatile BDT_ENTRY BDT[BDT_NUM_ENTRIES] BDT_BASE_ADDR_TAG;


#line 171 "../../mla/framework/usb/src/usb_device.c"
 
volatile CTRL_TRF_SETUP SetupPkt CTRL_TRF_SETUP_ADDR_TAG;
volatile uint8_t CtrlTrfData[USB_EP0_BUFF_SIZE] CTRL_TRF_DATA_ADDR_TAG;


#line 177 "../../mla/framework/usb/src/usb_device.c"
 
#line 179 "../../mla/framework/usb/src/usb_device.c"
#line 184 "../../mla/framework/usb/src/usb_device.c"
#line 189 "../../mla/framework/usb/src/usb_device.c"
#line 193 "../../mla/framework/usb/src/usb_device.c"
#line 195 "../../mla/framework/usb/src/usb_device.c"
#line 197 "../../mla/framework/usb/src/usb_device.c"
#line 198 "../../mla/framework/usb/src/usb_device.c"


#line 201 "../../mla/framework/usb/src/usb_device.c"
    
    extern const USB_DEVICE_DESCRIPTOR device_dsc;
#line 204 "../../mla/framework/usb/src/usb_device.c"
#line 206 "../../mla/framework/usb/src/usb_device.c"

#line 208 "../../mla/framework/usb/src/usb_device.c"
    
    extern const uint8_t *const USB_CD_Ptr[];
#line 211 "../../mla/framework/usb/src/usb_device.c"
#line 213 "../../mla/framework/usb/src/usb_device.c"

extern const uint8_t *const USB_SD_Ptr[];







extern bool USER_USB_CALLBACK_EVENT_HANDLER(USB_EVENT event, void *pdata, uint16_t size);

static void USBCtrlEPService(void);
static void USBCtrlTrfSetupHandler(void);
static void USBCtrlTrfInHandler(void);
static void USBCheckStdRequest(void);
static void USBStdGetDscHandler(void);
static void USBCtrlEPServiceComplete(void);
static void USBCtrlTrfTxService(void);
static void USBCtrlTrfRxService(void);
static void USBStdSetCfgHandler(void);
static void USBStdGetStatusHandler(void);
static void USBStdFeatureReqHandler(void);
static void USBCtrlTrfOutHandler(void);
static void USBConfigureEndpoint(uint8_t EPNum, uint8_t direction);
static void USBWakeFromSuspend(void);
static void USBSuspend(void);
static void USBStallHandler(void);








#line 269 "../../mla/framework/usb/src/usb_device.c"
 
#line 271 "../../mla/framework/usb/src/usb_device.c"
#line 272 "../../mla/framework/usb/src/usb_device.c"
#line 273 "../../mla/framework/usb/src/usb_device.c"



#line 297 "../../mla/framework/usb/src/usb_device.c"
 
void USBDeviceInit(void)
{
    uint8_t i;

    USBDisableInterrupts();

    
    USBClearInterruptRegister(U1EIR);  
       
    
    USBClearInterruptRegister(U1IR); 

    
    U1EP0 = 0;
    
    DisableNonZeroEndpoints(USB_MAX_EP_NUMBER);

    SetConfigurationOptions();

    
    USBPowerModule();

    
    USBSetBDTAddress(BDT);

    
    for(i=0;i<(sizeof(BDT)/sizeof(BDT_ENTRY));i++)
    {
        BDT[i].Val = 0x00;
    }

    
    USBPingPongBufferReset = 1;                    

    
    U1ADDR = 0x00;                   

    
    USBPacketDisable = 0;           

    
    USBPingPongBufferReset = 0;

    
    while(USBTransactionCompleteIF == 1)      
    {
        USBClearInterruptFlag(USBTransactionCompleteIFReg,USBTransactionCompleteIFBitNum);
        
        inPipes[0].info.Val = 0;
        outPipes[0].info.Val = 0;
        outPipes[0].wCount.Val = 0;
    }

    
    
    USBStatusStageEnabledFlag1 = true;
    USBStatusStageEnabledFlag2 = true;
    
    USBDeferINDataStagePackets = false;
    USBDeferOUTDataStagePackets = false;
    USBBusIsSuspended = false;

    
    
    for(i = 0; i < (uint8_t)(USB_MAX_EP_NUMBER+1u); i++)
    {
        pBDTEntryIn[i] = 0u;
        pBDTEntryOut[i] = 0u;
        ep_data_in[i].Val = 0u;
        ep_data_out[i].Val = 0u;
    }

    
    pBDTEntryIn[0] = (volatile BDT_ENTRY*)&BDT[EP0_IN_EVEN];
    
    U1EP0 = EP_CTRL|USB_HANDSHAKE_ENABLED;        
	
    BDT[EP0_OUT_EVEN].ADR = ConvertToPhysicalAddress(&SetupPkt);
    BDT[EP0_OUT_EVEN].CNT = USB_EP0_BUFF_SIZE;
    BDT[EP0_OUT_EVEN].STAT.Val = _DAT0|_BSTALL;
    BDT[EP0_OUT_EVEN].STAT.Val |= _USIE;

    
    USBActiveConfiguration = 0;     

    
    USBDeviceState = DETACHED_STATE;
}


#line 488 "../../mla/framework/usb/src/usb_device.c"
 
void USBDeviceTasks(void)
{
    uint8_t i;

#line 512 "../../mla/framework/usb/src/usb_device.c"

#line 514 "../../mla/framework/usb/src/usb_device.c"
#line 548 "../../mla/framework/usb/src/usb_device.c"
#line 550 "../../mla/framework/usb/src/usb_device.c"
#line 552 "../../mla/framework/usb/src/usb_device.c"
#line 576 "../../mla/framework/usb/src/usb_device.c"
#line 599 "../../mla/framework/usb/src/usb_device.c"
#line 601 "../../mla/framework/usb/src/usb_device.c"

    if(USBDeviceState == ATTACHED_STATE)
    {
        
#line 611 "../../mla/framework/usb/src/usb_device.c"
 

        if(!USBSE0Event)
        {
            USBClearInterruptRegister(U1IR);
#line 617 "../../mla/framework/usb/src/usb_device.c"
#line 619 "../../mla/framework/usb/src/usb_device.c"
            USBResetIE = 1;             
            USBIdleIE = 1;             
            USBDeviceState = POWERED_STATE;
        }
    }

#line 635 "../../mla/framework/usb/src/usb_device.c"

    
#line 638 "../../mla/framework/usb/src/usb_device.c"
 
    if(USBActivityIF && USBActivityIE)
    {
        USBClearInterruptFlag(USBActivityIFReg,USBActivityIFBitNum);
#line 643 "../../mla/framework/usb/src/usb_device.c"
#line 645 "../../mla/framework/usb/src/usb_device.c"
            USBWakeFromSuspend();
#line 647 "../../mla/framework/usb/src/usb_device.c"
    }

    
#line 651 "../../mla/framework/usb/src/usb_device.c"
 
    if(USBSuspendControl==1)
    {
        USBClearUSBInterrupt();
        return;
    }

    
#line 667 "../../mla/framework/usb/src/usb_device.c"
 
    if(USBResetIF && USBResetIE)
    {
        USBDeviceInit();

        
        
        USBUnmaskInterrupts();

        USBDeviceState = DEFAULT_STATE;

#line 685 "../../mla/framework/usb/src/usb_device.c"

        USBClearInterruptFlag(USBResetIFReg,USBResetIFBitNum);
    }

    
#line 691 "../../mla/framework/usb/src/usb_device.c"
 
    if(USBIdleIF && USBIdleIE)
    { 
#line 698 "../../mla/framework/usb/src/usb_device.c"
            USBSuspend();
#line 700 "../../mla/framework/usb/src/usb_device.c"
        
        USBClearInterruptFlag(USBIdleIFReg,USBIdleIFBitNum);
    }

    if(USBSOFIF)
    {
        if(USBSOFIE)
        {
            USB_SOF_HANDLER(EVENT_SOF,0,1);
        }    
        USBClearInterruptFlag(USBSOFIFReg,USBSOFIFBitNum);
        
#line 713 "../../mla/framework/usb/src/usb_device.c"
#line 715 "../../mla/framework/usb/src/usb_device.c"
#line 733 "../../mla/framework/usb/src/usb_device.c"
#line 749 "../../mla/framework/usb/src/usb_device.c"
    }

    if(USBStallIF && USBStallIE)
    {
        USBStallHandler();
    }

    if(USBErrorIF && USBErrorIE)
    {
        USB_ERROR_HANDLER(EVENT_BUS_ERROR,0,1);
        USBClearInterruptRegister(U1EIR);               

        
        
        
#line 765 "../../mla/framework/usb/src/usb_device.c"
#line 767 "../../mla/framework/usb/src/usb_device.c"
    }

    
#line 773 "../../mla/framework/usb/src/usb_device.c"
 
    if(USBDeviceState < DEFAULT_STATE)
    {
        USBClearUSBInterrupt();
        return;
    }  

    
#line 782 "../../mla/framework/usb/src/usb_device.c"
 
    if(USBTransactionCompleteIE)
    {
        for(i = 0; i < 4u; i++)	
        {						
            if(USBTransactionCompleteIF)
            {
                
                USTATcopy.Val = U1STAT;
                endpoint_number = USBHALGetLastEndpoint(USTATcopy);

                USBClearInterruptFlag(USBTransactionCompleteIFReg,USBTransactionCompleteIFBitNum);

                
                
#line 798 "../../mla/framework/usb/src/usb_device.c"
                if(USBHALGetLastDirection(USTATcopy) == OUT_FROM_HOST)
                {
                    ep_data_out[endpoint_number].bits.ping_pong_state ^= 1;
                }
                else
                {
                    ep_data_in[endpoint_number].bits.ping_pong_state ^= 1;
                }
#line 807 "../../mla/framework/usb/src/usb_device.c"

                
                
                if(endpoint_number == 0)
                {
                    USBCtrlEPService();
                }
                else
                {
                    USB_TRANSFER_COMPLETE_HANDLER(EVENT_TRANSFER, (uint8_t*)&USTATcopy.Val, 0);
                }
            }
            else
            {
                break;	
            }
        }
    }

    USBClearUSBInterrupt();
}


#line 877 "../../mla/framework/usb/src/usb_device.c"
 
void USBEnableEndpoint(uint8_t ep, uint8_t options)
{
    unsigned char* p;
        
    
    
    if(options & USB_OUT_ENABLED)
    {
        USBConfigureEndpoint(ep, OUT_FROM_HOST);
    }
    if(options & USB_IN_ENABLED)
    {
        USBConfigureEndpoint(ep, IN_TO_HOST);
    }

    
    
    
#line 897 "../../mla/framework/usb/src/usb_device.c"
#line 899 "../../mla/framework/usb/src/usb_device.c"
        p = (unsigned char*)(&U1EP0+ep);
#line 901 "../../mla/framework/usb/src/usb_device.c"
    *p = options;
}



#line 994 "../../mla/framework/usb/src/usb_device.c"
 
USB_HANDLE USBTransferOnePacket(uint8_t ep,uint8_t dir,uint8_t* data,uint8_t len)
{
    volatile BDT_ENTRY* handle;

    
    if(dir != 0)
    {
        
        handle = pBDTEntryIn[ep];
    }
    else
    {
        
        handle = pBDTEntryOut[ep];
    }
    
    
    
    if(handle == 0)
    {
        return 0;
    }

    
#line 1020 "../../mla/framework/usb/src/usb_device.c"
        handle->STAT.Val ^= _DTSMASK;
#line 1022 "../../mla/framework/usb/src/usb_device.c"
#line 1027 "../../mla/framework/usb/src/usb_device.c"

    
    handle->ADR = ConvertToPhysicalAddress(data);
    handle->CNT = len;
    handle->STAT.Val &= _DTSMASK;
    handle->STAT.Val |= (_DTSEN & _DTSEN );
    handle->STAT.Val |= _USIE;

    
    if(dir != OUT_FROM_HOST)
    {
        
        {((uint8_t_VAL*)&pBDTEntryIn[ep])->Val ^= USB_NEXT_PING_PONG;} ;      
    }
    else
    {
        
        {((uint8_t_VAL*)&pBDTEntryOut[ep])->Val ^= USB_NEXT_PING_PONG;} ;     
    }
    return (USB_HANDLE)handle;
}



#line 1072 "../../mla/framework/usb/src/usb_device.c"
 
void USBStallEndpoint(uint8_t ep, uint8_t dir)
{
    BDT_ENTRY *p;

    if(ep == 0)
    {
        
        
        
        pBDTEntryEP0OutNext->CNT = USB_EP0_BUFF_SIZE;
        pBDTEntryEP0OutNext->ADR = ConvertToPhysicalAddress(&SetupPkt);
        pBDTEntryEP0OutNext->STAT.Val = _DAT0|(_DTSEN & _DTSEN )|_BSTALL;
        pBDTEntryEP0OutNext->STAT.Val |= _USIE;
        pBDTEntryIn[0]->STAT.Val = _BSTALL; 
        pBDTEntryIn[0]->STAT.Val |= _USIE;
               
    }
    else
    {
        p = (BDT_ENTRY*)(&BDT[EP(ep,dir,0)]);
        p->STAT.Val |= _BSTALL;
        p->STAT.Val |= _USIE;
    
        
        
#line 1099 "../../mla/framework/usb/src/usb_device.c"
        p = (BDT_ENTRY*)(&BDT[EP(ep,dir,1)]);
        p->STAT.Val |= _BSTALL;
        p->STAT.Val |= _USIE;
#line 1103 "../../mla/framework/usb/src/usb_device.c"
    }
}


#line 1128 "../../mla/framework/usb/src/usb_device.c"
 
void USBCancelIO(uint8_t endpoint)
{
    if(USBPacketDisable == 1)
    {
    	
    	
    	pBDTEntryIn[endpoint]->Val &= _DTSMASK;	
    	pBDTEntryIn[endpoint]->Val ^= _DTSMASK;	
    	
    	
#line 1140 "../../mla/framework/usb/src/usb_device.c"
        
        
        
        {((uint8_t_VAL*)&pBDTEntryIn[endpoint])->Val ^= USB_NEXT_PING_PONG;} ;       
    
    	pBDTEntryIn[endpoint]->STAT.Val &= _DTSMASK;
    	pBDTEntryIn[endpoint]->STAT.Val ^= _DTSMASK;
#line 1148 "../../mla/framework/usb/src/usb_device.c"
    }
}


#line 1245 "../../mla/framework/usb/src/usb_device.c"
 
#line 1247 "../../mla/framework/usb/src/usb_device.c"
#line 1255 "../../mla/framework/usb/src/usb_device.c"
#line 1285 "../../mla/framework/usb/src/usb_device.c"
#line 1287 "../../mla/framework/usb/src/usb_device.c"
#line 1289 "../../mla/framework/usb/src/usb_device.c"
#line 1312 "../../mla/framework/usb/src/usb_device.c"
#line 1314 "../../mla/framework/usb/src/usb_device.c"

#line 1350 "../../mla/framework/usb/src/usb_device.c"
 
#line 1352 "../../mla/framework/usb/src/usb_device.c"
#line 1380 "../../mla/framework/usb/src/usb_device.c"
#line 1384 "../../mla/framework/usb/src/usb_device.c"



#line 1415 "../../mla/framework/usb/src/usb_device.c"
 
void USBCtrlEPAllowStatusStage(void)
{
    
    
    
    
    
    if(USBStatusStageEnabledFlag1 == false)
    {
        USBStatusStageEnabledFlag1 = true;
        if(USBStatusStageEnabledFlag2 == false)
        {
            USBStatusStageEnabledFlag2 = true;
        
            
            
            if(controlTransferState == CTRL_TRF_RX)
            {
                pBDTEntryIn[0]->CNT = 0;
                pBDTEntryIn[0]->STAT.Val = _DAT1|(_DTSEN & _DTSEN );        
                pBDTEntryIn[0]->STAT.Val |= _USIE;
            }
            else if(controlTransferState == CTRL_TRF_TX)
            {
                BothEP0OutUOWNsSet = false;	

                
                
#line 1445 "../../mla/framework/usb/src/usb_device.c"
                    pBDTEntryEP0OutCurrent->CNT = USB_EP0_BUFF_SIZE;
                    pBDTEntryEP0OutCurrent->ADR = ConvertToPhysicalAddress(&SetupPkt);
                    pBDTEntryEP0OutCurrent->STAT.Val = _BSTALL; 
                    pBDTEntryEP0OutCurrent->STAT.Val |= _USIE;
                    BothEP0OutUOWNsSet = true;	
#line 1451 "../../mla/framework/usb/src/usb_device.c"

                
                pBDTEntryEP0OutNext->CNT = USB_EP0_BUFF_SIZE;
                pBDTEntryEP0OutNext->ADR = ConvertToPhysicalAddress(&SetupPkt);
                pBDTEntryEP0OutNext->STAT.Val = _USIE;           
            }
        }    
    }
}   



#line 1487 "../../mla/framework/usb/src/usb_device.c"
 
void USBCtrlEPAllowDataStage(void)
{
    USBDeferINDataStagePackets = false;
    USBDeferOUTDataStagePackets = false;

    if(controlTransferState == CTRL_TRF_RX) 
    {
        
        pBDTEntryEP0OutNext->CNT = USB_EP0_BUFF_SIZE;
        pBDTEntryEP0OutNext->ADR = ConvertToPhysicalAddress(&CtrlTrfData);
        pBDTEntryEP0OutNext->STAT.Val = _DAT1|(_DTSEN & _DTSEN );
        pBDTEntryEP0OutNext->STAT.Val |= _USIE;
    }   
    else    
    {
        
        
		if(SetupPkt.wLength < inPipes[0].wCount.Val)
		{
			inPipes[0].wCount.Val = SetupPkt.wLength;
		}
		USBCtrlTrfTxService();  
		                        

	    
	    
		pBDTEntryIn[0]->ADR = ConvertToPhysicalAddress(&CtrlTrfData);
		pBDTEntryIn[0]->STAT.Val = _DAT1|(_DTSEN & _DTSEN );
        pBDTEntryIn[0]->STAT.Val |= _USIE;
    }     
}    


 
 
 


#line 1542 "../../mla/framework/usb/src/usb_device.c"
 
static void USBConfigureEndpoint(uint8_t EPNum, uint8_t direction)
{
    volatile BDT_ENTRY* handle;

    
    
    handle = (volatile BDT_ENTRY*)&BDT[EP0_OUT_EVEN]; 
    handle += EP(EPNum,direction,0u);     
    
    handle->STAT.UOWN = 0;  
    

    
    
    if(direction == OUT_FROM_HOST)
    {
        pBDTEntryOut[EPNum] = handle;
    }
    else
    {
        pBDTEntryIn[EPNum] = handle;
    }

#line 1567 "../../mla/framework/usb/src/usb_device.c"
        handle->STAT.DTS = 0;
        (handle+1)->STAT.DTS = 1;
#line 1570 "../../mla/framework/usb/src/usb_device.c"
#line 1574 "../../mla/framework/usb/src/usb_device.c"
#line 1579 "../../mla/framework/usb/src/usb_device.c"
#line 1585 "../../mla/framework/usb/src/usb_device.c"
}



#line 1615 "../../mla/framework/usb/src/usb_device.c"
 
static void USBCtrlEPServiceComplete(void)
{
    
#line 1621 "../../mla/framework/usb/src/usb_device.c"
 
    USBPacketDisable = 0;

	
	
	
	
    if(inPipes[0].info.bits.busy == 0)
    {
        if(outPipes[0].info.bits.busy == 1)
        {
            controlTransferState = CTRL_TRF_RX;
            
#line 1636 "../../mla/framework/usb/src/usb_device.c"
 

            
            
            
            
            
            if(USBDeferOUTDataStagePackets == false)
            {
                USBCtrlEPAllowDataStage();
            }
            
            
            
            USBStatusStageEnabledFlag2 = false;
            USBStatusStageEnabledFlag1 = false;
        }
        else
        {
            
#line 1658 "../../mla/framework/usb/src/usb_device.c"
 
            pBDTEntryEP0OutNext->CNT = USB_EP0_BUFF_SIZE;
            pBDTEntryEP0OutNext->ADR = ConvertToPhysicalAddress(&SetupPkt);
            pBDTEntryEP0OutNext->STAT.Val = _DAT0|(_DTSEN & _DTSEN )|_BSTALL;
            pBDTEntryEP0OutNext->STAT.Val |= _USIE;
            pBDTEntryIn[0]->STAT.Val = _BSTALL;
            pBDTEntryIn[0]->STAT.Val |= _USIE;
        }
    }
    else    
    {
		if(SetupPkt.DataDir == USB_SETUP_DEVICE_TO_HOST_BITFIELD)
		{
			controlTransferState = CTRL_TRF_TX;
			
#line 1684 "../../mla/framework/usb/src/usb_device.c"
 
			if(USBDeferINDataStagePackets == false)
            {
                USBCtrlEPAllowDataStage();
			}

            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            USBStatusStageEnabledFlag2 = false;
            USBStatusStageEnabledFlag1 = false;
            if(USBDeferStatusStagePacket == false)
            {
                USBCtrlEPAllowStatusStage();
            } 
		}
		else   
		{
			
			
			
			
			
				
			
			
			

			controlTransferState = CTRL_TRF_RX;     
			
			
			pBDTEntryEP0OutNext->CNT = USB_EP0_BUFF_SIZE;
			pBDTEntryEP0OutNext->ADR = ConvertToPhysicalAddress(&SetupPkt);
			pBDTEntryEP0OutNext->STAT.Val = _BSTALL;
            pBDTEntryEP0OutNext->STAT.Val |= _USIE;
				
			
            USBStatusStageEnabledFlag2 = false;
            USBStatusStageEnabledFlag1 = false;
			if(USBDeferStatusStagePacket == false)
            {
                USBCtrlEPAllowStatusStage();
            } 
		}

    }

}



#line 1770 "../../mla/framework/usb/src/usb_device.c"
 
static void USBCtrlTrfTxService(void)
{
    uint8_t byteToSend;

    
    
    byteToSend = USB_EP0_BUFF_SIZE;         
    if(inPipes[0].wCount.Val < (uint8_t)USB_EP0_BUFF_SIZE)
    {
        byteToSend = inPipes[0].wCount.Val;

        
        
        
        
        
        if(shortPacketStatus == SHORT_PKT_NOT_USED)
        {
            shortPacketStatus = SHORT_PKT_PENDING;
        }
        else if(shortPacketStatus == SHORT_PKT_PENDING)
        {
            shortPacketStatus = SHORT_PKT_SENT;
        }
    }

    
    
    inPipes[0].wCount.Val -= byteToSend;
    
    
    
    
    pBDTEntryIn[0]->CNT = byteToSend;

    
    
    pDst = (USB_VOLATILE uint8_t*)CtrlTrfData;                
    if(inPipes[0].info.bits.ctrl_trf_mem == USB_EP0_ROM)   
    {
        while(byteToSend)
        {
            *pDst++ = *inPipes[0].pSrc.bRom++;
            byteToSend--;
        }
    }
    else  
    {
        while(byteToSend)
        {
            *pDst++ = *inPipes[0].pSrc.bRam++;
            byteToSend--;
        }
    }
}


#line 1851 "../../mla/framework/usb/src/usb_device.c"
 
static void USBCtrlTrfRxService(void)
{
    uint8_t byteToRead;
    uint8_t i;

    
    
    byteToRead = pBDTEntryEP0OutCurrent->CNT;   

    
    
    
    
    if(byteToRead > outPipes[0].wCount.Val)
    {
        byteToRead = outPipes[0].wCount.Val;
    }	
    
    outPipes[0].wCount.Val -= byteToRead;

    
    
    for(i=0;i<byteToRead;i++)
    {
        *outPipes[0].pDst.bRam++ = CtrlTrfData[i];
    }

    
	
    if(outPipes[0].wCount.Val > 0)
    {
        pBDTEntryEP0OutNext->CNT = USB_EP0_BUFF_SIZE;
        pBDTEntryEP0OutNext->ADR = ConvertToPhysicalAddress(&CtrlTrfData);
        if(pBDTEntryEP0OutCurrent->STAT.DTS == 0)
        {
            pBDTEntryEP0OutNext->STAT.Val = _DAT1|(_DTSEN & _DTSEN );
            pBDTEntryEP0OutNext->STAT.Val |= _USIE;
        }
        else
        {
            pBDTEntryEP0OutNext->STAT.Val = _DAT0|(_DTSEN & _DTSEN );
            pBDTEntryEP0OutNext->STAT.Val |= _USIE;
        }
    }
    else
    {
	    
	    
		
        pBDTEntryEP0OutNext->CNT = USB_EP0_BUFF_SIZE;
        pBDTEntryEP0OutNext->ADR = ConvertToPhysicalAddress(&SetupPkt);
        
        
        
        pBDTEntryEP0OutNext->STAT.Val = _BSTALL;
        pBDTEntryEP0OutNext->STAT.Val |= _USIE;

		
		
		
		
		
        if(outPipes[0].pFunc != 0 )
        {
#line 1917 "../../mla/framework/usb/src/usb_device.c"
#line 1924 "../../mla/framework/usb/src/usb_device.c"
                outPipes[0].pFunc();    
#line 1926 "../../mla/framework/usb/src/usb_device.c"
        }
        outPipes[0].info.bits.busy = 0;    

        
        
        
        
        
        
        
        
        
        
        
        
        if(USBDeferStatusStagePacket == false)
        {
            USBCtrlEPAllowStatusStage();
        }            
    }    

}



#line 1967 "../../mla/framework/usb/src/usb_device.c"
 
static void USBStdSetCfgHandler(void)
{
    uint8_t i;

    
    inPipes[0].info.bits.busy = 1;            

    
    DisableNonZeroEndpoints(USB_MAX_EP_NUMBER);

    
    memset((void*)&BDT[0], 0x00, sizeof(BDT));

    
    USBPingPongBufferReset = 1;                                   

	
	
	
	for(i = 0; i < (uint8_t)(USB_MAX_EP_NUMBER+1u); i++)
	{
		ep_data_in[i].Val = 0u;
        ep_data_out[i].Val = 0u;
	}

    
    memset((void*)&USBAlternateInterface,0x00,USB_MAX_NUM_INT);

    
    USBPingPongBufferReset = 0;

    pBDTEntryIn[0] = (volatile BDT_ENTRY*)&BDT[EP0_IN_EVEN];

	
    pBDTEntryEP0OutCurrent = (volatile BDT_ENTRY*)&BDT[EP0_OUT_EVEN];
    pBDTEntryEP0OutNext = pBDTEntryEP0OutCurrent;

    
    USBActiveConfiguration = SetupPkt.bConfigurationValue;

    
    if(USBActiveConfiguration == 0)
    {
        
        USBDeviceState = ADDRESS_STATE;
    }
    else
    {
        
        USB_SET_CONFIGURATION_HANDLER(EVENT_CONFIGURED,(void*)&USBActiveConfiguration,1);

        
        
        
        USBDeviceState = CONFIGURED_STATE;		
    }
}



#line 2042 "../../mla/framework/usb/src/usb_device.c"
 
static void USBStdGetDscHandler(void)
{
    if(SetupPkt.bmRequestType == 0x80)
    {
        inPipes[0].info.Val = USB_EP0_ROM | USB_EP0_BUSY | USB_EP0_INCLUDE_ZERO;

        switch(SetupPkt.bDescriptorType)
        {
            case USB_DESCRIPTOR_DEVICE:
#line 2053 "../../mla/framework/usb/src/usb_device.c"
                    inPipes[0].pSrc.bRom = (const uint8_t*)&device_dsc;
#line 2055 "../../mla/framework/usb/src/usb_device.c"
#line 2057 "../../mla/framework/usb/src/usb_device.c"
                inPipes[0].wCount.Val = sizeof(device_dsc);
                break;
            case USB_DESCRIPTOR_CONFIGURATION:
                
                
                
                if(SetupPkt.bDscIndex < 1 )
                {
#line 2066 "../../mla/framework/usb/src/usb_device.c"
                        inPipes[0].pSrc.bRom = *(USB_CD_Ptr+SetupPkt.bDscIndex);
#line 2068 "../../mla/framework/usb/src/usb_device.c"
#line 2070 "../../mla/framework/usb/src/usb_device.c"

                    
                    
                    
                    inPipes[0].wCount.byte.LB = *(inPipes[0].pSrc.bRom+2);
                    inPipes[0].wCount.byte.HB = *(inPipes[0].pSrc.bRom+3);
                }
				else
				{
					inPipes[0].info.Val = 0;
				}
                break;
            case USB_DESCRIPTOR_STRING:
                
                
                
                if(SetupPkt.bDscIndex<USB_NUM_STRING_DESCRIPTORS)
                {
                    
                    inPipes[0].pSrc.bRom = *(USB_SD_Ptr+SetupPkt.bDscIndex);
                    
                    inPipes[0].wCount.Val = *inPipes[0].pSrc.bRom;                    
                }
#line 2094 "../../mla/framework/usb/src/usb_device.c"
#line 2102 "../../mla/framework/usb/src/usb_device.c"
                else
                {
                    inPipes[0].info.Val = 0;
                }
                break;
            default:
                inPipes[0].info.Val = 0;
                break;
        }
    }
}


#line 2128 "../../mla/framework/usb/src/usb_device.c"
 
static void USBStdGetStatusHandler(void)
{
    CtrlTrfData[0] = 0;                 
    CtrlTrfData[1] = 0;

    switch(SetupPkt.Recipient)
    {
        case USB_SETUP_RECIPIENT_DEVICE_BITFIELD:
            inPipes[0].info.bits.busy = 1;
            
#line 2141 "../../mla/framework/usb/src/usb_device.c"
 
            if(0  == 1) 
            {
                CtrlTrfData[0]|=0x01;
            }

            if(RemoteWakeup == true)
            {
                CtrlTrfData[0]|=0x02;
            }
            break;
        case USB_SETUP_RECIPIENT_INTERFACE_BITFIELD:
            inPipes[0].info.bits.busy = 1;     
            break;
        case USB_SETUP_RECIPIENT_ENDPOINT_BITFIELD:
            inPipes[0].info.bits.busy = 1;
            
#line 2159 "../../mla/framework/usb/src/usb_device.c"
 
            {
                BDT_ENTRY *p;

                if(SetupPkt.EPDir == 0)
                {
                    p = (BDT_ENTRY*)pBDTEntryOut[SetupPkt.EPNum];
                }
                else
                {
                    p = (BDT_ENTRY*)pBDTEntryIn[SetupPkt.EPNum];
                }

                if((p->STAT.UOWN == 1) && (p->STAT.BSTALL == 1))
                    CtrlTrfData[0]=0x01;    
                break;
            }
    }

    if(inPipes[0].info.bits.busy == 1)
    {
        inPipes[0].pSrc.bRam = (uint8_t*)&CtrlTrfData;        
        inPipes[0].info.bits.ctrl_trf_mem = USB_EP0_RAM;      
        inPipes[0].wCount.v[0] = 2;                           
    }
}


#line 2201 "../../mla/framework/usb/src/usb_device.c"
 
static void USBStallHandler(void)
{
    
#line 2212 "../../mla/framework/usb/src/usb_device.c"
 

    if(U1EP0bits.EPSTALL == 1)
    {
        
        if((pBDTEntryEP0OutCurrent->STAT.Val == _USIE) && (pBDTEntryIn[0]->STAT.Val == (_USIE|_BSTALL)))
        {
            
            pBDTEntryEP0OutCurrent->STAT.Val = _DAT0|(_DTSEN & _DTSEN )|_BSTALL;
            pBDTEntryEP0OutCurrent->STAT.Val |= _USIE;
        }
        U1EP0bits.EPSTALL = 0;               
    }

    USBClearInterruptFlag(USBStallIFReg,USBStallIFBitNum);
}


#line 2244 "../../mla/framework/usb/src/usb_device.c"
 
static void USBSuspend(void)
{
    
#line 2269 "../../mla/framework/usb/src/usb_device.c"
 
    USBActivityIE = 1;                     
    USBClearInterruptFlag(USBIdleIFReg,USBIdleIFBitNum);

#line 2274 "../../mla/framework/usb/src/usb_device.c"
        U1CONbits.SUSPND = 1;                   
                                                
#line 2277 "../../mla/framework/usb/src/usb_device.c"
    USBBusIsSuspended = true;
 
    
#line 2283 "../../mla/framework/usb/src/usb_device.c"
 
    USB_SUSPEND_HANDLER(EVENT_SUSPEND,0,0);
}


#line 2301 "../../mla/framework/usb/src/usb_device.c"
 
static void USBWakeFromSuspend(void)
{
    USBBusIsSuspended = false;

    
#line 2309 "../../mla/framework/usb/src/usb_device.c"
 
    USB_WAKEUP_FROM_SUSPEND_HANDLER(EVENT_RESUME,0,0);

#line 2313 "../../mla/framework/usb/src/usb_device.c"
        
        
        
        
        U1CONbits.SUSPND = 0;   
                                
#line 2320 "../../mla/framework/usb/src/usb_device.c"


    USBActivityIE = 0;

    
#line 2336 "../../mla/framework/usb/src/usb_device.c"
 

    
#line 2340 "../../mla/framework/usb/src/usb_device.c"
    while(USBActivityIF)
#line 2342 "../../mla/framework/usb/src/usb_device.c"
    {
        USBClearInterruptFlag(USBActivityIFReg,USBActivityIFBitNum);
    }  

}


#line 2368 "../../mla/framework/usb/src/usb_device.c"
 
static void USBCtrlEPService(void)
{
    
    
    
#line 2375 "../../mla/framework/usb/src/usb_device.c"
#line 2377 "../../mla/framework/usb/src/usb_device.c"
	
	
    if((USTATcopy.Val & USTAT_EP0_PP_MASK) == USTAT_EP0_OUT_EVEN)
    {
		
#line 2383 "../../mla/framework/usb/src/usb_device.c"
            pBDTEntryEP0OutCurrent = (volatile BDT_ENTRY*)&BDT[(USTATcopy.Val & USTAT_EP_MASK)>>1];
#line 2385 "../../mla/framework/usb/src/usb_device.c"
#line 2387 "../../mla/framework/usb/src/usb_device.c"
#line 2389 "../../mla/framework/usb/src/usb_device.c"

		
        pBDTEntryEP0OutNext = pBDTEntryEP0OutCurrent;
		
        ((uint8_t_VAL*)&pBDTEntryEP0OutNext)->Val ^= USB_NEXT_EP0_OUT_PING_PONG;

		
        if(pBDTEntryEP0OutCurrent->STAT.PID == PID_SETUP)
        {
            unsigned char setup_cnt;

	        
	        
	        
	        
            for(setup_cnt = 0; setup_cnt < 8u; setup_cnt++) 
            {
                *(uint8_t*)((uint8_t*)&SetupPkt + setup_cnt) = *(uint8_t*)ConvertToVirtualAddress(pBDTEntryEP0OutCurrent->ADR);
                pBDTEntryEP0OutCurrent->ADR++;
            }    
            pBDTEntryEP0OutCurrent->ADR = ConvertToPhysicalAddress(&SetupPkt);

			
            USBCtrlTrfSetupHandler();
        }
        else
        {
			
            USBCtrlTrfOutHandler();
        }
    }
    else if((USTATcopy.Val & USTAT_EP0_PP_MASK) == USTAT_EP0_IN)
    {
		
		
        USBCtrlTrfInHandler();
    }

}


#line 2468 "../../mla/framework/usb/src/usb_device.c"
 
static void USBCtrlTrfSetupHandler(void)
{
    
    
    
    shortPacketStatus = SHORT_PKT_NOT_USED;  
    USBDeferStatusStagePacket = false;
    USBDeferINDataStagePackets = false;
    USBDeferOUTDataStagePackets = false;
    BothEP0OutUOWNsSet = false;
    controlTransferState = WAIT_SETUP;

    
    
    
    
    
    
    
    pBDTEntryIn[0]->STAT.Val &= ~(_USIE);     
    ((uint8_t_VAL*)&pBDTEntryIn[0])->Val ^= USB_NEXT_EP0_IN_PING_PONG;
    pBDTEntryIn[0]->STAT.Val &= ~(_USIE);      
    ((uint8_t_VAL*)&pBDTEntryIn[0])->Val ^= USB_NEXT_EP0_IN_PING_PONG;
    pBDTEntryEP0OutNext->STAT.Val &= ~(_USIE);         

    inPipes[0].info.Val = 0;
    inPipes[0].wCount.Val = 0;
    outPipes[0].info.Val = 0;
    outPipes[0].wCount.Val = 0;
    

    
    
    
    USBCheckStdRequest();                                               
    USB_NONSTANDARD_EP0_REQUEST_HANDLER(EVENT_EP0_REQUEST,0,0); 


    
    
    
    
    
    
    
    
    
    
    USBCtrlEPServiceComplete();
}



#line 2540 "../../mla/framework/usb/src/usb_device.c"
 
static void USBCtrlTrfOutHandler(void)
{
    if(controlTransferState == CTRL_TRF_RX)
    {
        USBCtrlTrfRxService();	
    }
    else 
    {
        
        
        controlTransferState = WAIT_SETUP;

        
        
        
        
        
        if(BothEP0OutUOWNsSet == false)
        {
            pBDTEntryEP0OutNext->CNT = USB_EP0_BUFF_SIZE;
            pBDTEntryEP0OutNext->ADR = ConvertToPhysicalAddress(&SetupPkt);
            pBDTEntryEP0OutNext->STAT.Val = _DAT0|(_DTSEN & _DTSEN )|_BSTALL;
            pBDTEntryEP0OutNext->STAT.Val |= _USIE;
        }
        else
        {
                BothEP0OutUOWNsSet = false;
        }
    }
}


#line 2594 "../../mla/framework/usb/src/usb_device.c"
 
static void USBCtrlTrfInHandler(void)
{
    uint8_t lastDTS;

    lastDTS = pBDTEntryIn[0]->STAT.DTS;

    
    ((uint8_t_VAL*)&pBDTEntryIn[0])->Val ^= USB_NEXT_EP0_IN_PING_PONG;

    
    
    
    if(USBDeviceState == ADR_PENDING_STATE)
    {
        U1ADDR = (SetupPkt.bDevADR & 0x7F);
        if(U1ADDR != 0u)
        {
            USBDeviceState=ADDRESS_STATE;
        }
        else
        {
            USBDeviceState=DEFAULT_STATE;
        }
    }


    if(controlTransferState == CTRL_TRF_TX)
    {
        pBDTEntryIn[0]->ADR = ConvertToPhysicalAddress(CtrlTrfData);
        USBCtrlTrfTxService();

        
        
        
        
        if(shortPacketStatus == SHORT_PKT_SENT)
        {
            
            
            pBDTEntryIn[0]->STAT.Val = _BSTALL;
            pBDTEntryIn[0]->STAT.Val |= _USIE;
        }
        else
        {
            if(lastDTS == 0)
            {
                pBDTEntryIn[0]->STAT.Val = _DAT1|(_DTSEN & _DTSEN );
                pBDTEntryIn[0]->STAT.Val |= _USIE;
            }
            else
            {
                pBDTEntryIn[0]->STAT.Val = _DAT0|(_DTSEN & _DTSEN );
                pBDTEntryIn[0]->STAT.Val |= _USIE;
            }
        }
    }
	else 
	{
        
        
        
        if(outPipes[0].info.bits.busy == 1)
        {
            if(outPipes[0].pFunc != 0 )
            {
                outPipes[0].pFunc();
            }
            outPipes[0].info.bits.busy = 0;
        }
    	
        controlTransferState = WAIT_SETUP;
        
        
	}	

}



#line 2688 "../../mla/framework/usb/src/usb_device.c"
 
static void USBCheckStdRequest(void)
{
    if(SetupPkt.RequestType != USB_SETUP_TYPE_STANDARD_BITFIELD) return;

    switch(SetupPkt.bRequest)
    {
        case USB_REQUEST_SET_ADDRESS:
            inPipes[0].info.bits.busy = 1;            
            USBDeviceState = ADR_PENDING_STATE;       
             
            break;
        case USB_REQUEST_GET_DESCRIPTOR:
            USBStdGetDscHandler();
            break;
        case USB_REQUEST_SET_CONFIGURATION:
            USBStdSetCfgHandler();
            break;
        case USB_REQUEST_GET_CONFIGURATION:
            inPipes[0].pSrc.bRam = (uint8_t*)&USBActiveConfiguration;         
            inPipes[0].info.bits.ctrl_trf_mem = USB_EP0_RAM;               
            inPipes[0].wCount.v[0] = 1;                         
            inPipes[0].info.bits.busy = 1;
            break;
        case USB_REQUEST_GET_STATUS:
            USBStdGetStatusHandler();
            break;
        case USB_REQUEST_CLEAR_FEATURE:
        case USB_REQUEST_SET_FEATURE:
            USBStdFeatureReqHandler();
            break;
        case USB_REQUEST_GET_INTERFACE:
            inPipes[0].pSrc.bRam = (uint8_t*)&USBAlternateInterface[SetupPkt.bIntfID];  
            inPipes[0].info.bits.ctrl_trf_mem = USB_EP0_RAM;               
            inPipes[0].wCount.v[0] = 1;                         
            inPipes[0].info.bits.busy = 1;
            break;
        case USB_REQUEST_SET_INTERFACE:
            inPipes[0].info.bits.busy = 1;
            USBAlternateInterface[SetupPkt.bIntfID] = SetupPkt.bAltID;
            break;
        case USB_REQUEST_SET_DESCRIPTOR:
            USB_SET_DESCRIPTOR_HANDLER(EVENT_SET_DESCRIPTOR,0,0);
            break;
        case USB_REQUEST_SYNCH_FRAME:
        default:
            break;
    }
}


#line 2756 "../../mla/framework/usb/src/usb_device.c"
 
static void USBStdFeatureReqHandler(void)
{
    BDT_ENTRY *p;
    EP_STATUS current_ep_data;
#line 2762 "../../mla/framework/usb/src/usb_device.c"
#line 2764 "../../mla/framework/usb/src/usb_device.c"
        unsigned char* pUEP;             
#line 2766 "../../mla/framework/usb/src/usb_device.c"
    

#line 2800 "../../mla/framework/usb/src/usb_device.c"

    
    if((SetupPkt.bFeature == USB_FEATURE_DEVICE_REMOTE_WAKEUP)&&
       (SetupPkt.Recipient == USB_SETUP_RECIPIENT_DEVICE_BITFIELD))
    {
        inPipes[0].info.bits.busy = 1;
        if(SetupPkt.bRequest == USB_REQUEST_SET_FEATURE)
            RemoteWakeup = true;
        else
            RemoteWakeup = false;
    }

    
    if((SetupPkt.bFeature == USB_FEATURE_ENDPOINT_HALT)&&
       (SetupPkt.Recipient == USB_SETUP_RECIPIENT_ENDPOINT_BITFIELD)&&
       (SetupPkt.EPNum != 0) && (SetupPkt.EPNum <= USB_MAX_EP_NUMBER)&&
       (USBDeviceState == CONFIGURED_STATE))
    {
		
		
		inPipes[0].info.bits.busy = 1;

        
        if(SetupPkt.EPDir == OUT_FROM_HOST)
        {
            p = (BDT_ENTRY*)pBDTEntryOut[SetupPkt.EPNum];
            current_ep_data.Val = ep_data_out[SetupPkt.EPNum].Val;
        }
        else
        {
            p = (BDT_ENTRY*)pBDTEntryIn[SetupPkt.EPNum];
            current_ep_data.Val = ep_data_in[SetupPkt.EPNum].Val;
        }

        
        
        
#line 2838 "../../mla/framework/usb/src/usb_device.c"
            if(current_ep_data.bits.ping_pong_state == 0) 
            {
                {((uint8_t_VAL*)&p)->Val &= ~USB_NEXT_PING_PONG;} ;
            }
            else 
            {
                {((uint8_t_VAL*)&p)->Val |= USB_NEXT_PING_PONG;} ;
            }
#line 2847 "../../mla/framework/usb/src/usb_device.c"
        
        
        
        if(SetupPkt.EPDir == OUT_FROM_HOST)
        {
            pBDTEntryOut[SetupPkt.EPNum] = (volatile BDT_ENTRY *)p;
        }
        else
        {
            pBDTEntryIn[SetupPkt.EPNum] = (volatile BDT_ENTRY *)p;
        }

		
        if(SetupPkt.bRequest == USB_REQUEST_SET_FEATURE)
        {
            if(p->STAT.UOWN == 1)
            {
                
                
                if(SetupPkt.EPDir == OUT_FROM_HOST)
                {
                    ep_data_out[SetupPkt.EPNum].bits.transfer_terminated = 1;
                }
                else
                {
                    ep_data_in[SetupPkt.EPNum].bits.transfer_terminated = 1;
                }
            }

			
            p->STAT.Val |= _BSTALL;
            p->STAT.Val |= _USIE;
        }
        else
        {
			
#line 2884 "../../mla/framework/usb/src/usb_device.c"
                
                {((uint8_t_VAL*)&p)->Val ^= USB_NEXT_PING_PONG;} ;  

                if(p->STAT.UOWN == 1)
                {
                    
                    
                    p->STAT.Val &= (~_USIE);    
                    p->STAT.Val |= _DAT1;       
                    USB_TRANSFER_TERMINATED_HANDLER(EVENT_TRANSFER_TERMINATED,p,sizeof(p));
                }
                else
                {
                    
					p->STAT.Val |= _DAT1;
                }

                
                
                {((uint8_t_VAL*)&p)->Val ^= USB_NEXT_PING_PONG;} ;    
                
                
                
                
                
                if((current_ep_data.bits.transfer_terminated != 0) || (p->STAT.UOWN == 1))
                {
                    if(SetupPkt.EPDir == OUT_FROM_HOST)
                    {
                        ep_data_out[SetupPkt.EPNum].bits.transfer_terminated = 0;
                    }
                    else
                    {
                        ep_data_in[SetupPkt.EPNum].bits.transfer_terminated = 0;
                    }
                    
                    p->STAT.Val &= ~(_USIE | _DAT1 | _BSTALL);  
                    
					
                    USB_TRANSFER_TERMINATED_HANDLER(EVENT_TRANSFER_TERMINATED,p,sizeof(p));
                }
                else
                {
                    
                    p->STAT.Val &= ~(_USIE | _DAT1 | _BSTALL); 
                } 
#line 2931 "../../mla/framework/usb/src/usb_device.c"
#line 2970 "../../mla/framework/usb/src/usb_device.c"
            
			
#line 2973 "../../mla/framework/usb/src/usb_device.c"
#line 2976 "../../mla/framework/usb/src/usb_device.c"
                pUEP = (unsigned char*)(&U1EP0+SetupPkt.EPNum);
#line 2978 "../../mla/framework/usb/src/usb_device.c"

			
            *pUEP &= ~UEP_STALL;            
        }
    }
}


 
