//DMAVR-128的DS1302实时时钟芯片驱动程序，如果使用备用电池，只需执行一次写DS1302操作
//编译环境 ICCAVR 7.16A
//使用前请通过修改time_buf[8]来设置当前启动日期
//当前设置2010-02-01 03：22 下午 周一
//0xb0表示12小时制，下午，当前时间的小时数为03，具体位的意义参考DS1302的数据手册
#include <TFTclock_main.h>
     
	 
//***********************************************************************
//         绘制时钟界面
//***********************************************************************                             
void GUIclock()
 {
	GUIcircle(64,64,60,0x00ff);
	GUIfull(61,60,67,67,0xf800);    //时钟中心
	GUIline(64,5,64,10,0x700); 		//12点钟方向
	GUIline(63,5,63,10,0x700); 		//12点钟方向
	GUIline(65,5,65,10,0x700); 		//12点钟方向
	GUIline(95,12,92,15,0x700); 	//1点钟方向
	GUIline(116,34,113,37,0x700); 	//2点钟方向
	GUIline(123,64,118,64,0x700);  	//3点钟方向
	GUIline(123,63,118,63,0x700);  	//3点钟方向
	GUIline(123,65,118,65,0x700);  	//3点钟方向
    GUIline(116,94,113,91,0x700); 	//4点钟方向
	GUIline(95,116,92,113,0x700); 	//5点钟方向
    GUIline(64,123,64,118,0x700);  	//6点钟方向
	GUIline(63,123,63,118,0x700);  	//6点钟方向
	GUIline(65,123,65,118,0x700);  	//6点钟方向
 	GUIline(34,116,37,113,0x700); 	//7点钟方向
	GUIline(12,93,15,90,0x700);    	//8点钟方向		
	GUIline(5,64,10,64,0x700);     	//9点钟方向
	GUIline(5,63,10,63,0x700);     	//9点钟方向
	GUIline(5,65,10,65,0x700);     	//9点钟方向
	GUIline(12,34,15,37,0x700); 	//10点钟方向
	GUIline(34,12,37,15,0x700); 	//11点钟方向

 } 

//***********************************************************************
//         从DS1302中读取时钟数据并处理
//***********************************************************************
void TimeGet()
 {
    time_hour=((time_buf[4]&0x1F) >> 4)*10+(time_buf[4] & 0x0F);	//小时
	time_h=(time_buf[4] >> 4)&0x02;									//判断是上午还是下午
	time_min=(time_buf[5] >> 4)*10+(time_buf[5] & 0x0F);			//分钟
	time_sec=(time_buf[6] >> 4)*10+(time_buf[6] & 0x0F);			//秒
	data_yearq=(time_buf[0] >> 4);      		//年数据的千位
	data_yearb=(time_buf[0] & 0x0F);    		//年数据的百位
	data_years=(time_buf[1] >> 4);      		//年数据的十位
	data_yearg=(time_buf[1] & 0x0F);            //年数据的个位
	data_months=(time_buf[2] >> 4);             //月数据的十位
	data_monthg=(time_buf[2] & 0x0F);			//月数据的个位
	data_days=(time_buf[3] >> 4);				//日数据的十位
	data_dayg=(time_buf[3] & 0x0F);				//日数据的个位
	week=(time_buf[7] & 0x0F);					//星期数据
 }

//***********************************************************************
//         显示日期和星期
//***********************************************************************
void DisplayData()
 {
    DisplayChar(data_yearq+'0',0,9,0x0eee);
	DisplayChar(data_yearb+'0',1,9,0x0eee);
	DisplayChar(data_years+'0',2,9,0x0eee);
	DisplayChar(data_yearg+'0',3,9,0x0eee);
    
	DisplayChar('/',4,9,0x0eee);  					// "/"符号

	DisplayChar(data_months+'0',5,9,0x0eee);
	DisplayChar(data_monthg+'0',6,9,0x0eee);
	DisplayChar('/',7,9,0x0eee);  					// "/"符号


	DisplayChar(data_days+'0',8,9,0x0eee);
	DisplayChar(data_dayg+'0',9,9,0x0eee);
    
	DisplayGB2312(6,5,9,0x3fef);   					//星
	DisplayGB2312(7,6,9,0x3fef);   					//期
	DisplayGB2312(week+7,7,9,0x3fef);  			 	//星期几
 }

//***********************************************************************
//         主函数
//***********************************************************************

int main(void)
{
  delay_nms(100);
  McuInit();
  LCD_RD1; 
  LCD_Init();
  LCD_clear(0);
  ds1302_init();                        						//DS1302初始化
  delay_nms(10);
  ds1302_write_time();                 							//向DS1302写初始数据，如年月和时间等	 
  GUIclock();    												//画时钟界面框
	
  while(1)
    {
	  
    delay_nms(900);
	ds1302_read_time();                							//读DS1302数据
    GUIline(64,64,sxi,syi,0);  									//清除秒指针显示痕迹
	TimeGet(); 
	
  if(time_h==0x02)
   {
	DisplayGB2312(16,3,5,0x079ff);  			 				//下
   }
  else
   {
	DisplayGB2312(15,3,5,0x79ff);  			 					//上
   }

	DisplayGB2312(17,4,5,0x79ff);  			 					//午
	
	DisplayData();

   if(time_sec==00)
	{
    hxi=64+cos(PI*0.5-PI*(time_hour)/6-PI*(time_min-1)/360)*30;  //小时根据分钟的变化轨迹横坐标计算公式
    hyi=64-sin(PI*0.5-PI*(time_hour)/6-PI*(time_min-1)/360)*30;  //小时根据分钟的变化轨迹纵坐标计算公式
	GUIline(64,64,hxi,hyi,0);  						             //小时指针在小时更新后清除前一痕迹

	hxi=64+cos(PI*0.5-PI*(time_hour)/6-PI*time_min/360)*30;  	    
    hyi=64-sin(PI*0.5-PI*(time_hour)/6-PI*time_min/360)*30;
	GUIline(64,64,hxi,hyi,0x2ee0);  				             //小时指针在分钟更新后显示新的位置
	}
   else
	{
    hxi=64+cos(PI*0.5-PI*(time_hour)/6-PI*time_min/360)*30;
    hyi=64-sin(PI*0.5-PI*(time_hour)/6-PI*time_min/360)*30;
	GUIline(64,64,hxi,hyi,0x2ee0);  				            //小时指针在分钟不更新时显示原来位置
	}	


   if(time_sec==00)												//分钟指针在秒更新后清除前一痕迹
	{
	mxi=64+cos(PI*0.5-PI*(time_min-1)/30)*40;				
    myi=64-sin(PI*0.5-PI*(time_min-1)/30)*40;
	GUIline(64,64,mxi,myi,0);  									
	mxi=64+cos(PI*0.5-PI*time_min/30)*40;
    myi=64-sin(PI*0.5-PI*time_min/30)*40;
	GUIline(64,64,mxi,myi,0x2e0);  								//分钟指针在秒更新后显示新的位置
	}
  else
 	{
    mxi=64+cos(PI*0.5-PI*time_min/30)*40;						//分钟的变化轨迹横坐标计算公式
    myi=64-sin(PI*0.5-PI*time_min/30)*40;						//分钟的变化轨迹纵坐标计算公式
	GUIline(64,64,mxi,myi,0x2e0);  								//分钟指针在秒不更新时显示原来的位置
  	}

	sxi=64+cos(PI*0.5-PI*time_sec/30)*50;						//秒指针的变化轨迹横坐标计算公式
    syi=64-sin(PI*0.5-PI*time_sec/30)*50;						//秒指针的变化轨迹纵坐标计算公式
	
	GUIline(64,64,sxi,syi,0xffe0);  							//显示秒指针位置
    GUIfull(61,60,67,67,0xf800);   								//显示时钟中心      
	 }
}


