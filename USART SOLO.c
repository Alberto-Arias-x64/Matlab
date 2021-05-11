/*
 * File:   USART SOLO.c
 * Author: Andrés T.
 *
 * Created on July 13, 2017, 10:53 AM
 */



// CONFIG1H
#pragma config OSC = XT         // Oscillator Selection bits (XT oscillator)
#pragma config OSCS = OFF       // Oscillator System Clock Switch Enable bit (Oscillator system clock switch option is disabled (main oscillator is source))

// CONFIG2L
#pragma config PWRT = ON        // Power-up Timer Enable bit (PWRT enabled)
#pragma config BOR = OFF        // Brown-out Reset Enable bit (Brown-out Reset disabled)
#pragma config BORV = 20        // Brown-out Reset Voltage bits (VBOR set to 2.0V)

// CONFIG2H
#pragma config WDT = OFF        // Watchdog Timer Enable bit (WDT disabled (control is placed on the SWDTEN bit))
#pragma config WDTPS = 128      // Watchdog Timer Postscale Select bits (1:128)

// CONFIG3H
#pragma config CCP2MUX = ON     // CCP2 Mux bit (CCP2 input/output is multiplexed with RC1)

// CONFIG4L
#pragma config STVR = OFF       // Stack Full/Underflow Reset Enable bit (Stack Full/Underflow will not cause RESET)
#pragma config LVP = OFF        // Low Voltage ICSP Enable bit (Low Voltage ICSP disabled)

// CONFIG5L
#pragma config CP0 = OFF        // Code Protection bit (Block 0 (000200-001FFFh) not code protected)
#pragma config CP1 = OFF        // Code Protection bit (Block 1 (002000-003FFFh) not code protected)
#pragma config CP2 = OFF        // Code Protection bit (Block 2 (004000-005FFFh) not code protected)
#pragma config CP3 = OFF        // Code Protection bit (Block 3 (006000-007FFFh) not code protected)

// CONFIG5H
#pragma config CPB = OFF        // Boot Block Code Protection bit (Boot Block (000000-0001FFh) not code protected)
#pragma config CPD = OFF        // Data EEPROM Code Protection bit (Data EEPROM not code protected)

// CONFIG6L
#pragma config WRT0 = OFF       // Write Protection bit (Block 0 (000200-001FFFh) not write protected)
#pragma config WRT1 = OFF       // Write Protection bit (Block 1 (002000-003FFFh) not write protected)
#pragma config WRT2 = OFF       // Write Protection bit (Block 2 (004000-005FFFh) not write protected)
#pragma config WRT3 = OFF       // Write Protection bit (Block 3 (006000-007FFFh) not write protected)

// CONFIG6H
#pragma config WRTC = OFF       // Configuration Register Write Protection bit (Configuration registers (300000-3000FFh) not write protected)
#pragma config WRTB = OFF       // Boot Block Write Protection bit (Boot Block (000000-0001FFh) not write protected)
#pragma config WRTD = OFF       // Data EEPROM Write Protection bit (Data EEPROM not write protected)

// CONFIG7L
#pragma config EBTR0 = OFF      // Table Read Protection bit (Block 0 (000200-001FFFh) not protected from Table Reads executed in other blocks)
#pragma config EBTR1 = OFF      // Table Read Protection bit (Block 1 (002000-003FFFh) not protected from Table Reads executed in other blocks)
#pragma config EBTR2 = OFF      // Table Read Protection bit (Block 2 (004000-005FFFh) not protected from Table Reads executed in other blocks)
#pragma config EBTR3 = OFF      // Table Read Protection bit (Block 3 (006000-007FFFh) not protected from Table Reads executed in other blocks)

// CONFIG7H
#pragma config EBTRB = OFF      // Boot Block Table Read Protection bit (Boot Block (000000-0001FFh) not protected from Table Reads executed in other blocks)

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.

#include <xc.h>
#define _XTAL_FREQ 4000000 

void CONF_PUERTOS(void);
void CONF_USART(void);

void main(void) 

{
    CONF_PUERTOS();
    CONF_USART();
    
    while(1)
    {
    
        
        while(PORTCbits.RC0 == 1)
        {
            if(PIR1bits.RCIF ==1 )
            {
                LATB = RCREG;
                PIR1bits.RCIF = 0;
            }
        }
        
        __delay_ms(20);
        
        while(PORTCbits.RC0 == 0)
        {
            if(PIR1bits.RCIF ==1 )
            {
                LATB = RCREG;
                PIR1bits.RCIF = 0;
            }
        }
        
        __delay_ms(20);
        
        TXREG = PORTD;
            
        
        
        
    }    
}

//---------------------------------------------
void CONF_PUERTOS(void)
{
            //76543210
    TRISD = 0b11111111; // Los dipswitch
    TRISC = 0b10000001; //
    TRISB = 0b00000000; // Bus datos LEDS
    
    LATB = LATC = LATD = 0;       
}
//---------------------------------------------
void CONF_USART(void)
{
            //76543210
    TXSTA = 0b00100110;
    RCSTA = 0b10010000;
    SPBRG = 25;
}
//---------------------------------------------



















