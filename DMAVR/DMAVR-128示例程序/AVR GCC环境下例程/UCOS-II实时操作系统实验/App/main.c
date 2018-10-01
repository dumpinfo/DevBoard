//DMAVR-128的实现UC/OS-II移植代码，代码为网络开源代码，可以传播，任意学习使用
//实现4个任务切换，通过8个LED发光二极管演示，用户可以自行定义任务切换
//编译环境 AVR Studio 4.17/AVR GCC
//系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
//作者: www.avrgcc.com
//日期：2010.01.14
//***********************************************************************
//			包含文件
//***********************************************************************

#include <includes.h>



/* 在AVR Studio上仿真时值要设置的小些,如20 */
#define	LED_DELAY_MS	1000									/* LED 延时, 用于任务 */
#define	LED_ON()	{ DDRB = 0xff; PORTB = 0xF0; }
#define	LED_OFF()	{ DDRB = 0xff;PORTB = 0xff ;}

#define	LED_ON2()	{ DDRB = 0xff; PORTB = 0x0F; }
#define	LED_OFF2()	{ DDRB = 0xff;PORTB = 0xff ;}


// Variablen
OS_STK	Task1Stack[OS_TASK_1_STK_SIZE];		                   // startup task stack
OS_STK	Task2Stack[OS_TASK_2_STK_SIZE];
OS_STK	Task3Stack[OS_TASK_3_STK_SIZE];
OS_STK	Task4Stack[OS_TASK_4_STK_SIZE];

OS_EVENT * sem;

//***********************************************************************
//			定义4个任务列表，主程序调用任务
//***********************************************************************

void task0( void * pdata )
{
	INT8U error;
	
	TimerInit();	
	while(1)
	{
		OSSemPend( sem, 0, &error );
		LED_ON();												//点亮LED的D1～D4
		OSTimeDlyHMSM(0,0,0,2*LED_DELAY_MS );
		OSSemPost( sem );
	}
	
}

void task1(void * pdata )
{
	INT8U error;
	
	while(1)
	{
		OSSemPend(sem, 0, &error);
		LED_OFF();												//熄灭LED的D1～D4
		OSTimeDlyHMSM(0,0,0,LED_DELAY_MS );
		OSSemPost(sem);
	}
	
}

void task2(void * pdata)									    //点亮LED的D5～D8
{  
   while(1)
	{
		LED_ON2();
		OSTimeDlyHMSM(0,0,0,2*LED_DELAY_MS );
	}	
}

void task3(void * pdata )
{
	INT8U error;
	
	while(1)
	{
		OSSemPend(sem, 0, &error);
		LED_OFF2();												 //熄灭LED的D5～D8
		OSTimeDlyHMSM(0,0,0,LED_DELAY_MS );
		OSSemPost(sem);
	}
	
}


//***********************************************************************
//			启动4个任务，切换执行
//***********************************************************************

int	main()
{
	OSInit();                             //初始化
    sem = OSSemCreate( 1 );				  //建立信号量
	OSTaskCreate( task0, (void *)OS_TASK_1_STK_SIZE, &Task1Stack[OS_TASK_1_STK_SIZE-1], OS_TASK_1_PRIO );//创建任务
	OSTaskCreate( task1, (void *)OS_TASK_2_STK_SIZE, &Task2Stack[OS_TASK_2_STK_SIZE-1], OS_TASK_2_PRIO );
	OSTaskCreate( task2, (void *)OS_TASK_3_STK_SIZE, &Task3Stack[OS_TASK_3_STK_SIZE-1], OS_TASK_3_PRIO );
	OSTaskCreate( task3, (void *)OS_TASK_4_STK_SIZE, &Task4Stack[OS_TASK_4_STK_SIZE-1], OS_TASK_4_PRIO );
	OSStart();                           //启动任务
}


