#line 1 "../src/main.c"
#line 1 "../src/main.c"






























































































#line 1 "../src/blaster.h"












#line 14 "../src/blaster.h"











#line 34 "../src/blaster.h"

void Blaster_Init(void);
void USB_Ept_Init(void);

uint8_t EEPROM_Read(uint8_t addr);
void EEPROM_Checksum(void);

void USB_FT245_Emulation(void);

void TXFIFO_Init(void);
void TXFIFO_Write(uint8_t data);
void TXFIFO_Read(uint8_t *ptr, uint8_t size);
uint16_t TXFIFO_Fill(void);
uint16_t TXFIFO_Room(void);

void TIMER0_Start_10ms(void);
uint8_t TIMER0_Reach_10ms(void);

void Main_Task_Blaster(void);

#line 55 "../src/blaster.h"






#line 95 "../src/main.c"





MAIN_RETURN main(void)
{
    
    
    
    Blaster_Init();

    
    
    
    USBDeviceInit();
    USBDeviceAttach();

    
    
    
    while(1)
    {
#line 119 "../src/main.c"
#line 133 "../src/main.c"

        
#line 136 "../src/main.c"
 
        if( USBGetDeviceState() < CONFIGURED_STATE )
        {
             
            continue;
        }

        
#line 146 "../src/main.c"
 
        if( USBIsDeviceSuspended()== true )
        {
             
            continue;
        }

        
        Main_Task_Blaster();

    }
}




bool USER_USB_CALLBACK_EVENT_HANDLER(USB_EVENT event, void *pdata, uint16_t size)
{
    switch((int)event)
    {
        case EVENT_TRANSFER:
            break;

        case EVENT_SOF:
            break;

        case EVENT_SUSPEND:
            break;

        case EVENT_RESUME:
            break;

        case EVENT_CONFIGURED:
            USB_Ept_Init();
            break;

        case EVENT_SET_DESCRIPTOR:
            break;

        case EVENT_EP0_REQUEST:
            
#line 187 "../src/main.c"
 
            USBCheckVendorRequest();
            USB_FT245_Emulation();
            break;

        case EVENT_BUS_ERROR:
            break;

        case EVENT_TRANSFER_TERMINATED:
            break;

        default:
            break;
    }
    return true;
}




