#include<p18f452.h>



void CONF_PUERTOS(void);
void BORRAR_BASURA(void);
void CONF_PWM(void);
void CONF_TIMER2(void);


void main(void)
{

	CONF_PUERTOS();
	BORRAR_BASURA();
	CONF_PWM();
	CONF_TIMER2();
	while(1)
	{
		
	}

	
}

///////////////////////////////////////////////////////
void CONF_PUERTOS(void)
{
			  //76543210
	TRISC	= 0b00000000;

}
///////////////////////////////////////////////////////
void BORRAR_BASURA(void)
{
	LATC 	= 0;
}
///////////////////////////////////////////////////////
void CONF_PWM(void)
{
			  //76543210
	CCP1CON = 0b00001100;
	CCP2CON = 0b00001100;

	CCPR1L 	= 100;  // Ancho de pulso del canal 1
	CCPR2L 	= 100; // Ancho de pulso del canal 2 

	PR2 	= 255; // Establece la frecuencia de
				   // de ambas señales(aplica para
				   // ambos canales)
}
///////////////////////////////////////////////////////
void CONF_TIMER2(void)
{
	TMR2 	= 0;
			  //76543210
	T2CON	= 0b00000111;

}












