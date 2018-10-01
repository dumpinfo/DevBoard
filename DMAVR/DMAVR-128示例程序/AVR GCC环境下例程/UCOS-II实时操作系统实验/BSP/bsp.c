/*
*********************************************************************************************************
*                                           Atmel ATmega128
*                                         Board Support Package
*
*                                (c) Copyright 2005, Micrium, Weston, FL
*                                          All Rights Reserved
*
*
* File : BSP.C
* By   : Jean J. Labrosse
*********************************************************************************************************
*/

#include <includes.h>

/*
*********************************************************************************************************
*                                              PROTOTYPES
*********************************************************************************************************
*/

static  void  BSP_InitTickISR(void);
static  void  LED_Init(void);


/*
*********************************************************************************************************
*                                         BSP INITIALIZATION
*
* Description : This function should be called by your application code before you make use of any of the
*               functions found in this module.
*
* Arguments   : none
*********************************************************************************************************
*/

void  BSP_Init (void)
{
    LED_Init();

    BSP_InitTickISR();
}

/*	TimerInit()
 * 功能:初始化系统时钟
 * 参数:
 * 返回值:
 * 说明: 使用Timer 0作为系统时钟源.相关的时钟设置见文件头名的宏定义
 * */
void TimerInit( void )
{
	TCCR2 = 1<<3;												/* 工作于CTC模式, 不在相应端口输出信号 */
	OCR2= TIMER_INTERVAL;
	TCNT2 = 0;
	TIMSK |= 1<<7;    											 
	TCCR2 |= F_OSC_DIV;							   				/* 开启时钟 */
}
/*
*********************************************************************************************************
*                                        SETUP THE TICK RATE
*
* Note(s): 1) OCR0 = CPU_CLK_FREQ / (2 * Prescaler * OC_freq) - 1
*          2) The equation actually performs rounding by multiplying by 2, adding 1 and then divising by 2
*             in integer math, this is equivalent to adding 0.5
*********************************************************************************************************
*/

static  void  BSP_InitTickISR (void)
{
    INT32U  num;
    INT32U  denom;


    TCCR0  = 0x0E;                                                      /* Set TIMER0 prescaler to CTC Mode, CLK/256                */
    TCNT0  =    0;                                                      /* Start TCNT at 0 for a new cycle                          */
    num    = (INT32U)CPU_CLK_FREQ;
    denom  = 2 * 256 * (INT32U)OS_TICKS_PER_SEC;
    OCR0   = (INT8U)((2 * num / denom + 1) / 2 - 1);
    TIFR  |= 0x02;                                                      /* Clear  TIMER0 compare Interrupt Flag                     */
    TIMSK |= 0x02;                                                      /* Enable TIMER0 compare Interrupt                          */
}


/*
*********************************************************************************************************
*                                     HANDLE THE TICK INTERRUPT
*
* Note(s): 1) No need to clear the interrupt source since we use output compare mode for Timer #0 and
*             the interrupt is automatically cleard in hardware when the ISR runs.
*********************************************************************************************************
*/

void  BSP_TickISR_Handler (void)
{
    OSTimeTick();
}



/*$PAGE*/
/*
*********************************************************************************************************
*                                       uC/Probe, INITIALIZE TIMER
*
* Description: This function initializes a 16 or 32-bit free-running timer for uC/Probe.
*
* Arguments  : none
*
* Note(s)    : none
*********************************************************************************************************
*/
#if OS_PROBE_HOOKS_EN > 0                                               /* Do not compile this section if Probe is disabled         */
void  OSProbe_TmrInit (void)
{
#if (OS_PROBE_TIMER_SEL == 1)
    TCCR1B  =   0x00;                                                   /* Stop timer                                               */
    TCNT1   = 0xFFFF;                                                   /* Setup TCNT                                               */
    TCCR1A  =   0x00;                                                   /* Normal Mode, count up 0x0000 to 0xFFFF                   */
    TCCR1B  =   0x04;                                                   /* Start timer, prescale by 256                             */
#endif

#if (OS_PROBE_TIMER_SEL == 3)
    TCCR3B  =   0x00;                                                   /* Stop timer                                               */
    TCNT3   = 0xFFFF;                                                   /* Setup TCNT                                               */
    TCCR3A  =   0x00;                                                   /* Normal Mode, count up 0x0000 to 0xFFFF                   */
    TCCR3B  =   0x04;                                                   /* Start timer, prescale by 256                             */
#endif
}
#endif                                                                  /* #if OS_PROBE_HOOKS_EN > 0                                */

/*$PAGE*/
/*
*********************************************************************************************************
*                                       uC/Probe, TIMER READ
*
* Description: This function reads a 16-bit free-running timer for uC/Probe.
*
* Arguments  : none
*
* Returns    : none
*********************************************************************************************************
*/
#if OS_PROBE_HOOKS_EN > 0                                               /* Do not compile this section if Probe is disabled         */
CPU_INT32U  OSProbe_TmrRd (void)
{
    INT16U  cnts;


#if (OS_PROBE_TIMER_SEL == 1)
    cnts    = (INT16U)TCNT1;                                            /* Read current counts of Timer #1                          */
#endif

#if (OS_PROBE_TIMER_SEL == 3)
    cnts    = (INT16U)TCNT3;                                            /* Read current counts of Timer #3                          */
#endif

    return ((INT32U)cnts);
}
#endif                                                                  /* #if OS_PROBE_HOOKS_EN > 0                                */


/*
*********************************************************************************************************
*                                         BSP INITIALIZATION
*
* Description : This function should be called by your application code before you make use of any of the
*               functions found in this module.
*
* Arguments   : none
*********************************************************************************************************
*/

static  void  LED_Init (void)
{
    DDRB  = 0xFF;                                                       /* All PORTD pins are outputs                               */
    PORTB = 0xFF;
   // LED_On(0);                                                         /* Turn ON all the LEDs                                     */
}

/*
*********************************************************************************************************
*                                             LED ON
*
* Description : This function is used to control any or all the LEDs on the board.
*
* Arguments   : led    is the number of the LED to control
*                      0    indicates that you want ALL the LEDs to be ON
*                      1    turns ON LED1 on the board
*                      .
*                      .
*                      8    turns ON LED8 on the board
*********************************************************************************************************
*/

void  LED_On (INT8U led)
{
#if OS_CRITICAL_METHOD == 3                                             /* Allocate storage for CPU status register                 */
    OS_CPU_SR  cpu_sr = 0;
#endif


    OS_ENTER_CRITICAL();
    switch (led) {
        case 0:
             PORTD  =  0x00;
             break;

        case 1:
             PORTD &= ~0x01;
             break;

        case 2:
             PORTD &= ~0x02;
             break;

        case 3:
             PORTD &= ~0x04;
             break;

        case 4:
             PORTD &= ~0x08;
             break;

        case 5:
             PORTD &= ~0x10;
             break;

        case 6:
             PORTD &= ~0x20;
             break;

        case 7:
             PORTD &= ~0x40;
             break;

        case 8:
             PORTD &= ~0x80;
             break;
    }
    OS_EXIT_CRITICAL();
}

/*
*********************************************************************************************************
*                                             LED OFF
*
* Description : This function is used to control any or all the LEDs on the board.
*
* Arguments   : led    is the number of the LED to turn OFF
*                      0    indicates that you want ALL the LEDs to be OFF
*                      1    turns OFF LED1 on the board
*                      .
*                      .
*                      8    turns OFF LED8 on the board
*********************************************************************************************************
*/

void  LED_Off (INT8U led)
{
#if OS_CRITICAL_METHOD == 3                                             /* Allocate storage for CPU status register                 */
    OS_CPU_SR  cpu_sr = 0;
#endif


    OS_ENTER_CRITICAL();
    switch (led) {
        case 0:
             PORTD  =  0xFF;
             break;

        case 1:
             PORTD |=  0x01;
             break;

        case 2:
             PORTD |=  0x02;
             break;

        case 3:
             PORTD |=  0x04;
             break;

        case 4:
             PORTD |=  0x08;
             break;

        case 5:
             PORTD |=  0x10;
             break;

        case 6:
             PORTD |=  0x20;
             break;

        case 7:
             PORTD |=  0x40;
             break;

        case 8:
             PORTD |=  0x80;
             break;
    }
    OS_EXIT_CRITICAL();
}

/*
*********************************************************************************************************
*                                        LED TOGGLE
*
* Description : This function is used to toggle the state of any or all the LEDs on the board.
*
* Arguments   : led    is the number of the LED to toggle
*                      0    indicates that you want ALL the LEDs to toggle
*                      1    Toggle LED1 on the board
*                      .
*                      .
*                      8    Toggle LED8 on the board
*********************************************************************************************************
*/

void  LED_Toggle (INT8U led)
{
#if OS_CRITICAL_METHOD == 3                                             /* Allocate storage for CPU status register                 */
    OS_CPU_SR  cpu_sr = 0;
#endif


    OS_ENTER_CRITICAL();
    switch (led) {
        case 0:
             PORTD ^=  0xFF;
             break;

        case 1:
             PORTD ^=  0x01;
             break;

        case 2:
             PORTD ^=  0x02;
             break;

        case 3:
             PORTD ^=  0x04;
             break;

        case 4:
             PORTD ^=  0x08;
             break;

        case 5:
             PORTD ^=  0x10;
             break;

        case 6:
             PORTD ^=  0x20;
             break;

        case 7:
             PORTD ^=  0x40;
             break;

        case 8:
             PORTD ^=  0x80;
             break;
    }
    OS_EXIT_CRITICAL();
}
