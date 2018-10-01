//DMAVR-M128�Ķ�дSD������ʵ�飬��ָ����ַд��ָ�����ݣ���ȡ������д��ģʽ��һ��512�ֽ�
//Ҫд��SD��������ͨ������д�룬ʹ�ô��ڵ������֣�������9600��8λ���ݣ�1λֹͣλ����У�鷽ʽ
//��ʼ��SD���ɹ��󣬽�����Please Input the Data Want to Write to SD�ַ�������ʱͨ�����ڵ������ַ��������ַ�����
//����д��SD�����ֶ�������ʾ�����ڵ������֣�ͨ���Աȿ����ж�д���Ƿ�ɹ�
//���뻷�� AVR Studio 4.17/AVR GCC���Ż���-01
//ϵͳʱ��7.3728MHZ��������˿λΪ�ⲿ��ƵʯӢ�����񵴣�����ʱ��4.1ms
//���ߣ����� www.avrgcc.com
//���ڣ�2010.01.14
//***********************************************************************
//			�����ļ�
//***********************************************************************

#include <user/SDData_main.h>


u32 sectorwr=200;	//��SD����д�����ݵĵ�ַ��Ϊ������������һ������Ϊ512�ֽڵ�SD��ʵ�ʵ�ַΪsectorwr*512�ֽ�
u08 buffer1[1]={0x08};  //��SD����д������ݣ�����ֻ������һ���ֽڵĳ��ȣ����Զ���Ϊ512���ֽڳ���	
u08 buffer2[512];   	//��ȡ���ݴ����
u32 SD_Size;            //SD��������ȡ�洢����
int i;
static res=1;
//***********************************************************************
//		�ر�����ܺ�����Ϊ������ܲ���ʾ���룬���ڳ�ʼ������
//***********************************************************************

void LED_Off()
{
    PORTD=0xFF;
	DDRD=0xFF;
	D_LE1;                             //�ص�����ܣ�������ʾ����                   
    W_LE1;                     
    Data_IO=0xFF;                      //�������            
    W_LE0; 
}

//***********************************************************************
//			������������SD����д����
//***********************************************************************

int main(void)
{

 u16 i;
 u08 retry=0;
 u08 a;

  delay_ms(10);
  McuInit();												//IO¥��ʼ��  						  
  //delay_ms(500);
  UART_Init();                 							  //���ڳ�ʼ��
  LED_Off();                   							  //�������
  printf("DMAVR-128��дSD������ʵ��\n");
  printf("DMAVR-M128 Initialize Success!\n");
  printf("Waiting Initialize SD����\n");
  delay_ms(1000);
  mmcInit();
  mmcInit();
 //delay_ms(50);
 while(mmcReset())			 							  //��ʼ��SD��					
	{
		retry++;
		if(retry>20)
		{
			printf("DMAVR-M128 Initialize SD Failure!\n");//��ʼ��ʧ����ʾ
			printf("Please Checking the SD or Reset the System!\n");

			while(1)   		
			{
				
			}
		}
	} 
 printf("DMAVR-M128 Initialize SD Success!\n");         //��ʼ���ɹ���ʾ��ʾ��Ϣ
 SD_Size=mmcCapacity();
 printf ("Size=%ld\n",SD_Size);							//���SD����������λ�ֽ�
while(1)
 {
 printf("Please Input the Data Want to Write to SD!\n");
 //printf("The Data is:");
 scanf("%c",&a);                                        //���Ӵ������������д��SD��������Ϊ�����ַ�����a
 //printf("\n");
 printf("The Data Write to SD is %c\n",a) ;
 buffer1[0]=a;                                          //��������������ݸ���buffer1��׼��д��SD��
 printf("DMAVR-M128 Starting Read and Write SD!\n");

 mmcWrite(sectorwr,buffer1);         					//��ָ����ַ(sectorwr*512)д������
 delay_ms(1000);
 mmcRead(sectorwr,buffer2);								//��ȡ�ղ�д��ռ�����ݣ��ж��Ƿ�д��ɹ�
 for(i=0;i<512;i++)
   {
   		printf ("Data=%c \r",buffer2[i]);				//�������������
   }
 printf ("\n");
 if(buffer1[1]=buffer2[1])
 {
 	printf("Write Data Success!\n");
//	printf("Please Take Out the SD!\n");
 }
 else
 {
 	printf("Write Data Failure!\n");

 }
 
 }

}

