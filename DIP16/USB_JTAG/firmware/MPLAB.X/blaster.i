#line 1 "../src/blaster.c"
#line 1 "../src/blaster.c"














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






#line 15 "../src/blaster.c"

#line 1 "../src/jtag.h"












#line 14 "../src/jtag.h"



















#line 34 "../src/jtag.h"
#line 35 "../src/jtag.h"
#line 36 "../src/jtag.h"
#line 37 "../src/jtag.h"
#line 38 "../src/jtag.h"




void JTAG_Init(void);
void JTAG_Mode_SPI(void);
void JTAG_Mode_PORT(void);
void JTAG_SPI_Wait(void);
void JTAG_SPI_Put(uint8_t byte);
uint8_t JTAG_SPI_Get(void);
uint8_t bitrev(uint8_t byte);

#line 51 "../src/jtag.h"




#line 16 "../src/blaster.c"





#line 22 "../src/blaster.c"
#line 23 "../src/blaster.c"
#line 24 "../src/blaster.c"
#line 25 "../src/blaster.c"
#line 26 "../src/blaster.c"
#line 27 "../src/blaster.c"
#line 28 "../src/blaster.c"
#line 29 "../src/blaster.c"




extern const USB_DEVICE_DESCRIPTOR device_dsc; 
extern const uint8_t configDescriptor1[];      
extern const uint8_t *const USB_SD_Ptr[];      
extern volatile CTRL_TRF_SETUP SetupPkt;       
extern volatile uint8_t CtrlTrfData[];         

USB_VOLATILE uint8_t USB_InPacket[USBGEN_EP_SIZE]     @0x240; 
USB_VOLATILE uint8_t USB_OutPacket[2][USBGEN_EP_SIZE] @0x280; 

USB_HANDLE USB_OutHandle0;
USB_HANDLE USB_OutHandle1;
USB_HANDLE USB_InHandle0;

uint16_t eeprom_checksum; 

uint8_t  TXFIFO[(256) ]; 
uint8_t  TXFIFO_rp, TXFIFO_wp;
uint16_t TXFIFO_ocpy;

enum Rx_State_Enum {RX_INIT, RX_PPB_0, RX_PPB_1};
enum JTAG_State_Enum {JTAG_BIT_BANG, JTAG_BYTE_SHIFT};

uint8_t Rx_State;
uint8_t RxSize;
uint8_t ValidPPB;
uint8_t RxPtr;
uint8_t JTAG_State;
uint8_t Read;
uint8_t ByteSize;
uint8_t nCS;

#line 147 "../src/blaster.c"




void Blaster_Init(void)
{
    
    EEPROM_Checksum();

    
    JTAG_Init();

#line 164 "../src/blaster.c"
    
    
    TIMER0_Start_10ms();
}




void USB_Ept_Init(void)
{
    
    USB_OutHandle0 = 0;
    USB_OutHandle1 = 0;
    USB_InHandle0 = 0;

    
    TXFIFO_Init();

    
    Rx_State = RX_INIT;
    JTAG_State = JTAG_BIT_BANG;
    JTAG_Mode_PORT();
    ByteSize = 0;
    nCS = 1;

    
    USBEnableEndpoint(1,USB_IN_ENABLED |USB_HANDSHAKE_ENABLED|USB_DISALLOW_SETUP);
    USBEnableEndpoint(2,USB_OUT_ENABLED|USB_HANDSHAKE_ENABLED|USB_DISALLOW_SETUP);
}




void USB_FT245_Emulation(void)
{
    
    if (SetupPkt.RequestType == 2)
    {
        
        
        if (SetupPkt.DataDir == 0)
        {
            USBEP0SendRAMPtr((uint8_t*)CtrlTrfData, 0, USB_EP0_INCLUDE_ZERO);
        }
        
        else if (SetupPkt.bRequest == 0x90)
        {
            uint8_t addr = (SetupPkt.wIndex << 1) & 0x7e;
            CtrlTrfData[0] = EEPROM_Read(addr + 0);
            CtrlTrfData[1] = EEPROM_Read(addr + 1);
        }
        
        else
        {
            CtrlTrfData[0] = 0x36;
            CtrlTrfData[1] = 0x83;
        }
        USBEP0SendRAMPtr((uint8_t*)CtrlTrfData, 2, USB_EP0_INCLUDE_ZERO);
    }
}




uint8_t EEPROM_Read(uint8_t addr)
{
    uint8_t data = 0;
    
    switch(addr)
    {
        case   0 : {data = 0; break;}
        case   1 : {data = 0; break;}
        case   2 : {data = ((uint8_t*)(&device_dsc.idVendor))[0]; break;} 
        case   3 : {data = ((uint8_t*)(&device_dsc.idVendor))[1]; break;} 
        case   4 : {data = ((uint8_t*)(&device_dsc.idProduct))[0]; break;} 
        case   5 : {data = ((uint8_t*)(&device_dsc.idProduct))[1]; break;} 
        case   6 : {data = ((uint8_t*)(&device_dsc.bcdDevice))[0]; break;} 
        case   7 : {data = ((uint8_t*)(&device_dsc.bcdDevice))[1]; break;} 
        case   8 : {data = configDescriptor1[7]; break;} 
        case   9 : {data = configDescriptor1[8]; break;} 
        case  10 : {data = 0x1c; break;}
        case  11 : {data = 0; break;}
        case  12 : {data = ((uint8_t*)(&device_dsc.bcdUSB))[0]; break;} 
        case  13 : {data = ((uint8_t*)(&device_dsc.bcdUSB))[1]; break;} 
        case  14 : {data = 0x80 + (14 + 6) ; break;} 
        case  15 : {data =        (USB_SD_Ptr[1][0]) ; break;} 
        case  16 : {data = 0x80 + ((14 + 6)  + (USB_SD_Ptr[1][0]) ) ; break;} 
        case  17 : {data =        (USB_SD_Ptr[2][0]) ; break;} 
        case  18 : {data = 0x80 + (((14 + 6)  + (USB_SD_Ptr[1][0]) )  + (USB_SD_Ptr[2][0]) ) ; break;} 
        case  19 : {data =        (USB_SD_Ptr[3][0]) ; break;} 
        case 126 : {data = (uint8_t)(eeprom_checksum & 0x00ff); break;} 
        case 127 : {data = (uint8_t)(eeprom_checksum >> 8);     break;} 
        default  : {data = 0; break;} 
    }
    
    if (((14 + 6)  <= addr) && (addr < ((14 + 6)  + (USB_SD_Ptr[1][0]) ) ))
    {
        data = USB_SD_Ptr[1][addr - (14 + 6) ];
    }
    else if ((((14 + 6)  + (USB_SD_Ptr[1][0]) )  <= addr) && (addr < (((14 + 6)  + (USB_SD_Ptr[1][0]) )  + (USB_SD_Ptr[2][0]) ) ))
    {
        data = USB_SD_Ptr[2][addr - ((14 + 6)  + (USB_SD_Ptr[1][0]) ) ];
    }
    else if (((((14 + 6)  + (USB_SD_Ptr[1][0]) )  + (USB_SD_Ptr[2][0]) )  <= addr) && (addr < ((((14 + 6)  + (USB_SD_Ptr[1][0]) )  + (USB_SD_Ptr[2][0]) )  + (USB_SD_Ptr[3][0]) ) ))
    {
        data = USB_SD_Ptr[3][addr - (((14 + 6)  + (USB_SD_Ptr[1][0]) )  + (USB_SD_Ptr[2][0]) ) ];
    }
    
    return data;
}




void EEPROM_Checksum(void)
{
    uint8_t i;
    uint16_t eeprom_data;
    eeprom_checksum = 0xaaaa;
    for (i = 0; i < 126; i = i + 2)
    {
        eeprom_data = (uint16_t)(EEPROM_Read(i+1)); 
        eeprom_data = eeprom_data << 8;
        eeprom_data = eeprom_data | (uint16_t)(EEPROM_Read(i)); 
        eeprom_checksum = eeprom_checksum ^ eeprom_data;
        
        eeprom_checksum = (eeprom_checksum << 1) | (eeprom_checksum >> 15);
    }    
}




void TXFIFO_Init(void)
{
    TXFIFO_rp = 0;
    TXFIFO_wp = 0;
    TXFIFO_ocpy = 0;
}




void TXFIFO_Write(uint8_t data)
{
    TXFIFO[TXFIFO_wp++] = data;
    TXFIFO_ocpy++;
}




void TXFIFO_Read(uint8_t *ptr, uint8_t size)
{
    TXFIFO_ocpy = TXFIFO_ocpy - (uint16_t)size;
    while(size > 0)
    {
        *ptr++ = TXFIFO[TXFIFO_rp++];
        size--;
    }
}




uint16_t TXFIFO_Fill(void)
{
    return TXFIFO_ocpy;
}




uint16_t TXFIFO_Room(void)
{
    return ((256)  - TXFIFO_ocpy);
}




void TIMER0_Start_10ms(void)
{
    
    INTCONbits.TMR0IE=0;
    
    T0CON=0x00;
    
    INTCONbits.TMR0IF = 0;
    
    TMR0H = (65536 - 60000) >> 8;
    TMR0L = (65536 - 60000) &0x00FF;
    
    T0CON=0x80;
}




uint8_t TIMER0_Reach_10ms(void)
{
    uint8_t flag;
    flag = INTCONbits.TMR0IF;
    INTCONbits.TMR0IF = 0;
    return flag;
}




void Main_Task_Blaster(void)
{    
    
    
    
    switch (Rx_State)
    {
        
        
        
        case RX_INIT :
        {
            
            
            USB_OutHandle0 = USBGenRead(2, (uint8_t*)&USB_OutPacket[0], 64);
            RxSize = 0;
            Rx_State = RX_PPB_0;
            break;
        }
        
        
        
        case RX_PPB_0 :
        {
            if (RxSize == 0)
            {
                if (!USBHandleBusy(USB_OutHandle0))
                {
                    RxSize = USBHandleGetLength(USB_OutHandle0);
                    ValidPPB = 0;
                    RxPtr = 0;
                    Rx_State = RX_PPB_1;
                    
                    
                    USB_OutHandle1 = USBGenRead(2, (uint8_t*)&USB_OutPacket[1], 64);
                    
#line 415 "../src/blaster.c"
                }
            }
            break;
        }
        
        
        
        case RX_PPB_1 :
        {
            if (RxSize == 0)
            {
                if (!USBHandleBusy(USB_OutHandle1))
                {
                    RxSize = USBHandleGetLength(USB_OutHandle1);
                    ValidPPB = 1;
                    RxPtr = 0;
                    Rx_State = RX_PPB_0;
                    
                    
                    USB_OutHandle0 = USBGenRead(2, (uint8_t*)&USB_OutPacket[0], 64);
                    
#line 441 "../src/blaster.c"
                }
            }
            break;
        }
        
        
        
        default :
        {
            Rx_State = RX_INIT;
            break;
        }
    } 

  

    
    
    
    switch (JTAG_State)
    {
        
        
        
        case JTAG_BIT_BANG :
        {
            if ((RxSize > 0) && (TXFIFO_Room() >=  RxSize))
            {
                JTAG_Mode_PORT();
                
                while(RxSize > 0)
                {
                    uint8_t opcode;
                    opcode = USB_OutPacket[ValidPPB][RxPtr++];
                    RxSize--;
                    
                    Read = opcode & 0x40;
                    
                    if (opcode & 0x80) 
                    {
                        LATBbits.LATB6  = 0;
                        ByteSize = opcode & 0x3f;
                        JTAG_State = JTAG_BYTE_SHIFT;
                        
#line 492 "../src/blaster.c"
                        
                        break; 
                    }
                    else 
                    {
                        LATBbits.LATB6  = (opcode & 0x01)? 1 : 0;
                        LATCbits.LATC6  = (opcode & 0x02)? 1 : 0;
                        LATCbits.LATC7  = (opcode & 0x10)? 1 : 0;
                        LATCbits.LATC2  = (opcode & 0x20)? 1 : 0;
                        nCS = (opcode & 0x08)? 1 : 0;
                        
                        if (Read)
                        {
                            TXFIFO_Write(PORTBbits.RB4  | 0x02); 
                        }
                        
#line 517 "../src/blaster.c"
                    }
                } 
            } 
            break;
        }
        
        
        
        case JTAG_BYTE_SHIFT :
        {
            if ((RxSize > 0) && (TXFIFO_Room() >=  RxSize))
            {
                JTAG_Mode_SPI();
                
                while((RxSize > 0) && (ByteSize > 0))
                {
                    uint8_t tx;
                  
                    tx = USB_OutPacket[ValidPPB][RxPtr++];
                    JTAG_SPI_Put(tx);
                    JTAG_SPI_Wait();
                  
                    if (Read)
                    {
                        if (nCS)
                          
                            TXFIFO_Write(JTAG_SPI_Get());
                        else
                            TXFIFO_Write(0xff); 
                    }
                    RxSize--;
                    ByteSize--;
                } 
                
#line 560 "../src/blaster.c"
            }
            
            if (ByteSize == 0)
            {
                JTAG_State = JTAG_BIT_BANG;
            }
            break;
        }
        
        
        
        default :
        {
            JTAG_State = JTAG_BIT_BANG;
            break;
        }
    } 


    
    
    
    if (!USBHandleBusy(USB_InHandle0))
    {
        uint8_t txfifo_size;

        txfifo_size = TXFIFO_Fill();
        
#line 596 "../src/blaster.c"

        
        
        
        if (txfifo_size > 0)
        {
            uint8_t txsize;
            txsize = (txfifo_size < 62)? txfifo_size : 62;

            
            USB_InPacket[0] = 0x31;
            USB_InPacket[1] = 0x60;

            
            TXFIFO_Read((uint8_t*)(USB_InPacket + 2), txsize);
            
            USB_InHandle0 = USBGenWrite(1, (uint8_t*)&USB_InPacket, txsize + 2);
            
            TIMER0_Start_10ms();
        }
        
        
        
        else if (TIMER0_Reach_10ms())
        {
            
            USB_InPacket[0] = 0x31;
            USB_InPacket[1] = 0x60;

            
            USB_InHandle0 = USBGenWrite(1, (uint8_t*)&USB_InPacket, 2);
            
            TIMER0_Start_10ms();
        }
    }
}




