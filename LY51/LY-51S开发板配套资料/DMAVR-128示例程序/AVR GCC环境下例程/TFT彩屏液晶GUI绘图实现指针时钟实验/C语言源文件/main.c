//DMAVR-128�Ļ���TFT����Һ����DS1302ʱ��оƬ��ָ��ʽ����ʱ�ӳ���
//ָ���������������Ǻ������㣬����Ӧ����math.hͷ�ļ�
//��ʼ����Ϊ12Сʱ�ƣ�����ʱ��
//���뻷�� AVR Studio 4.17/AVR GCC
//ϵͳʱ��7.3728MHZ��������˿λΪ�ⲿ��ƵʯӢ�����񵴣�����ʱ��4.1ms
//���ߣ����� www.avrgcc.com
//���ڣ�2010.01.28


#include <user/TFTclock_main.h>
     
	 
//***********************************************************************
//         ����ʱ�ӽ���
//***********************************************************************                             
void GUIclock()
 {
	GUIcircle(64,64,60,0x00ff);
	GUIfull(61,60,67,67,0xf800);    //ʱ������
	GUIline(64,5,64,10,0x700); 		//12���ӷ���
	GUIline(63,5,63,10,0x700); 		//12���ӷ���
	GUIline(65,5,65,10,0x700); 		//12���ӷ���
	GUIline(95,12,92,15,0x700); 	//1���ӷ���
	GUIline(116,34,113,37,0x700); 	//2���ӷ���
	GUIline(123,64,118,64,0x700);  	//3���ӷ���
	GUIline(123,63,118,63,0x700);  	//3���ӷ���
	GUIline(123,65,118,65,0x700);  	//3���ӷ���
    GUIline(116,94,113,91,0x700); 	//4���ӷ���
	GUIline(95,116,92,113,0x700); 	//5���ӷ���
    GUIline(64,123,64,118,0x700);  	//6���ӷ���
	GUIline(63,123,63,118,0x700);  	//6���ӷ���
	GUIline(65,123,65,118,0x700);  	//6���ӷ���
 	GUIline(34,116,37,113,0x700); 	//7���ӷ���
	GUIline(12,93,15,90,0x700);    	//8���ӷ���		
	GUIline(5,64,10,64,0x700);     	//9���ӷ���
	GUIline(5,63,10,63,0x700);     	//9���ӷ���
	GUIline(5,65,10,65,0x700);     	//9���ӷ���
	GUIline(12,34,15,37,0x700); 	//10���ӷ���
	GUIline(34,12,37,15,0x700); 	//11���ӷ���

 } 

//***********************************************************************
//         ��DS1302�ж�ȡʱ�����ݲ�����
//***********************************************************************
void TimeGet()
 {
    time_hour=((time_buf[4]&0x1F) >> 4)*10+(time_buf[4] & 0x0F);	//Сʱ
	time_h=(time_buf[4] >> 4)&0x02;									//�ж������绹������
	time_min=(time_buf[5] >> 4)*10+(time_buf[5] & 0x0F);			//����
	time_sec=(time_buf[6] >> 4)*10+(time_buf[6] & 0x0F);			//��
	data_yearq=(time_buf[0] >> 4);      		//�����ݵ�ǧλ
	data_yearb=(time_buf[0] & 0x0F);    		//�����ݵİ�λ
	data_years=(time_buf[1] >> 4);      		//�����ݵ�ʮλ
	data_yearg=(time_buf[1] & 0x0F);            //�����ݵĸ�λ
	data_months=(time_buf[2] >> 4);             //�����ݵ�ʮλ
	data_monthg=(time_buf[2] & 0x0F);			//�����ݵĸ�λ
	data_days=(time_buf[3] >> 4);				//�����ݵ�ʮλ
	data_dayg=(time_buf[3] & 0x0F);				//�����ݵĸ�λ
	week=(time_buf[7] & 0x0F);					//��������
 }

//***********************************************************************
//         ��ʾ���ں�����
//***********************************************************************
void DisplayData()
 {
    DisplayChar(data_yearq+'0',0,9,0x0eee);
	DisplayChar(data_yearb+'0',1,9,0x0eee);
	DisplayChar(data_years+'0',2,9,0x0eee);
	DisplayChar(data_yearg+'0',3,9,0x0eee);
    
	DisplayChar('/',4,9,0x0eee);  					// "/"����

	DisplayChar(data_months+'0',5,9,0x0eee);
	DisplayChar(data_monthg+'0',6,9,0x0eee);
	DisplayChar('/',7,9,0x0eee);  					// "/"����


	DisplayChar(data_days+'0',8,9,0x0eee);
	DisplayChar(data_dayg+'0',9,9,0x0eee);
    
	DisplayGB2312(6,5,9,0x3fef);   					//��
	DisplayGB2312(7,6,9,0x3fef);   					//��
	DisplayGB2312(week+7,7,9,0x3fef);  			 	//���ڼ�
 }

//***********************************************************************
//         ������
//***********************************************************************

int main(void)
{
  delay_ms(100);
  McuInit();
  LCD_RD1; 
  LCD_Init();
  LCD_clear(0);
  ds1302_init();                        						//DS1302��ʼ��
  delay_ms(10);
  ds1302_write_time();                 							//��DS1302д��ʼ���ݣ������º�ʱ���	 
  GUIclock();    												//��ʱ�ӽ����
	
  while(1)
    {
	  
    delay_ms(900);
	ds1302_read_time();                							//��DS1302����
    GUIline(64,64,sxi,syi,0);  									//�����ָ����ʾ�ۼ�
	TimeGet(); 
	
  if(time_h==0x02)
   {
	DisplayGB2312(16,3,5,0x079ff);  			 				//��
   }
  else
   {
	DisplayGB2312(15,3,5,0x79ff);  			 					//��
   }

	DisplayGB2312(17,4,5,0x79ff);  			 					//��
	
	DisplayData();

   if(time_sec==00)
	{
    hxi=64+cos(PI*0.5-PI*(time_hour)/6-PI*(time_min-1)/360)*30;  //Сʱ���ݷ��ӵı仯�켣��������㹫ʽ
    hyi=64-sin(PI*0.5-PI*(time_hour)/6-PI*(time_min-1)/360)*30;  //Сʱ���ݷ��ӵı仯�켣��������㹫ʽ
	GUIline(64,64,hxi,hyi,0);  						             //Сʱָ����Сʱ���º����ǰһ�ۼ�

	hxi=64+cos(PI*0.5-PI*(time_hour)/6-PI*time_min/360)*30;  	    
    hyi=64-sin(PI*0.5-PI*(time_hour)/6-PI*time_min/360)*30;
	GUIline(64,64,hxi,hyi,0x2ee0);  				             //Сʱָ���ڷ��Ӹ��º���ʾ�µ�λ��
	}
   else
	{
    hxi=64+cos(PI*0.5-PI*(time_hour)/6-PI*time_min/360)*30;
    hyi=64-sin(PI*0.5-PI*(time_hour)/6-PI*time_min/360)*30;
	GUIline(64,64,hxi,hyi,0x2ee0);  				            //Сʱָ���ڷ��Ӳ�����ʱ��ʾԭ��λ��
	}	


   if(time_sec==00)												//����ָ��������º����ǰһ�ۼ�
	{
	mxi=64+cos(PI*0.5-PI*(time_min-1)/30)*40;				
    myi=64-sin(PI*0.5-PI*(time_min-1)/30)*40;
	GUIline(64,64,mxi,myi,0);  									
	mxi=64+cos(PI*0.5-PI*time_min/30)*40;
    myi=64-sin(PI*0.5-PI*time_min/30)*40;
	GUIline(64,64,mxi,myi,0x2e0);  								//����ָ��������º���ʾ�µ�λ��
	}
  else
 	{
    mxi=64+cos(PI*0.5-PI*time_min/30)*40;						//���ӵı仯�켣��������㹫ʽ
    myi=64-sin(PI*0.5-PI*time_min/30)*40;						//���ӵı仯�켣��������㹫ʽ
	GUIline(64,64,mxi,myi,0x2e0);  								//����ָ�����벻����ʱ��ʾԭ����λ��
  	}

	sxi=64+cos(PI*0.5-PI*time_sec/30)*50;						//��ָ��ı仯�켣��������㹫ʽ
    syi=64-sin(PI*0.5-PI*time_sec/30)*50;						//��ָ��ı仯�켣��������㹫ʽ
	
	GUIline(64,64,sxi,syi,0xffe0);  							//��ʾ��ָ��λ��
    GUIfull(61,60,67,67,0xf800);   								//��ʾʱ������      
	 }
}


