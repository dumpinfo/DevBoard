//DMAVR-128��ʵ��UC/OS-II��ֲ���룬����Ϊ���翪Դ���룬���Դ���������ѧϰʹ��
//ʵ��4�������л���ͨ��8��LED�����������ʾ���û��������ж��������л�
//���뻷�� AVR Studio 4.17/AVR GCC
//ϵͳʱ��7.3728MHZ��������˿λΪ�ⲿ��ƵʯӢ�����񵴣�����ʱ��4.1ms
//����: www.avrgcc.com
//���ڣ�2010.01.14
//***********************************************************************
//			�����ļ�
//***********************************************************************

#include <includes.h>



/* ��AVR Studio�Ϸ���ʱֵҪ���õ�СЩ,��20 */
#define	LED_DELAY_MS	1000									/* LED ��ʱ, �������� */
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
//			����4�������б��������������
//***********************************************************************

void task0( void * pdata )
{
	INT8U error;
	
	TimerInit();	
	while(1)
	{
		OSSemPend( sem, 0, &error );
		LED_ON();												//����LED��D1��D4
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
		LED_OFF();												//Ϩ��LED��D1��D4
		OSTimeDlyHMSM(0,0,0,LED_DELAY_MS );
		OSSemPost(sem);
	}
	
}

void task2(void * pdata)									    //����LED��D5��D8
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
		LED_OFF2();												 //Ϩ��LED��D5��D8
		OSTimeDlyHMSM(0,0,0,LED_DELAY_MS );
		OSSemPost(sem);
	}
	
}


//***********************************************************************
//			����4�������л�ִ��
//***********************************************************************

int	main()
{
	OSInit();                             //��ʼ��
    sem = OSSemCreate( 1 );				  //�����ź���
	OSTaskCreate( task0, (void *)OS_TASK_1_STK_SIZE, &Task1Stack[OS_TASK_1_STK_SIZE-1], OS_TASK_1_PRIO );//��������
	OSTaskCreate( task1, (void *)OS_TASK_2_STK_SIZE, &Task2Stack[OS_TASK_2_STK_SIZE-1], OS_TASK_2_PRIO );
	OSTaskCreate( task2, (void *)OS_TASK_3_STK_SIZE, &Task3Stack[OS_TASK_3_STK_SIZE-1], OS_TASK_3_PRIO );
	OSTaskCreate( task3, (void *)OS_TASK_4_STK_SIZE, &Task4Stack[OS_TASK_4_STK_SIZE-1], OS_TASK_4_PRIO );
	OSStart();                           //��������
}


