#line 1 "../src/usb_descriptors.c"
#line 1 "../src/usb_descriptors.c"

#line 139 "../src/usb_descriptors.c"
 


#line 147 "../src/usb_descriptors.c"
 

#line 150 "../src/usb_descriptors.c"

 


 
#line 156 "../src/usb_descriptors.c"
#line 158 "../src/usb_descriptors.c"

 
const USB_DEVICE_DESCRIPTOR device_dsc=
{
    0x12,                   
    USB_DESCRIPTOR_DEVICE,  
    0x0110,                 
    0x00,                   
    0x00,                   
    0x00,                   
    USB_EP0_BUFF_SIZE,      
    0x09FB,                 
    0x6001,                 
    0x0400,                 
    0x01,                   
    0x02,                   
    0x03,                   
    0x01                    
};

 
const uint8_t configDescriptor1[]={
     
    0x09,
    USB_DESCRIPTOR_CONFIGURATION,                
    0x20,0x00,            
    1,                      
    1,                      
    0,                      
    _DEFAULT | _SELF,               
    50,                     

     
    0x09,
    USB_DESCRIPTOR_INTERFACE,               
    0,                      
    0,                      
    2,                      
    0xFF,                   
    0xFF,                   
    0xFF,                   
    0,                      

     
    0x07,                        
    USB_DESCRIPTOR_ENDPOINT,    
    _EP01_IN,                   
    _BULK,                      
    USBGEN_EP_SIZE,0x00,        
    1,                          

    0x07,                        
    USB_DESCRIPTOR_ENDPOINT,    
    _EP02_OUT,                  
    _BULK,                      
    USBGEN_EP_SIZE,0x00,        
    1                           
};



const struct{uint8_t bLength;uint8_t bDscType;uint16_t string[1];}sd000={
sizeof(sd000),USB_DESCRIPTOR_STRING,{0x0409}};


const struct{uint8_t bLength;uint8_t bDscType;uint16_t string[6];}sd001={
sizeof(sd001),USB_DESCRIPTOR_STRING,
{'A','l','t','e','r','a'}};


const struct{uint8_t bLength;uint8_t bDscType;uint16_t string[11];}sd002={
sizeof(sd002),USB_DESCRIPTOR_STRING,
{'U','S','B','-','B','l','a','s','t','e','r'}};











const struct{BYTE bLength;BYTE bDscType;WORD string[8];}sd003={
sizeof(sd003),USB_DESCRIPTOR_STRING,
{'0','0','0','0','0','0','0','0'}};


const uint8_t *const USB_CD_Ptr[]=
{
    (const uint8_t *const)&configDescriptor1
};

const uint8_t *const USB_SD_Ptr[]=
{
    (const uint8_t *const)&sd000,
    (const uint8_t *const)&sd001,
    (const uint8_t *const)&sd002
   ,(const uint8_t *const)&sd003  
};



#line 263 "../src/usb_descriptors.c"
#line 323 "../src/usb_descriptors.c"

 

#line 327 "../src/usb_descriptors.c"
