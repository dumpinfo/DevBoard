/*-----------------------------------------------
  名称：外部中断0边沿触发
  论坛：www.doflye.net
  编写：shifang
  日期：2009.5
  修改：无
  内容：通过中断接口P3.2连接的独立按键测试，按一次P1口的LED灯反向，
        这里使用边沿触发，所以一直按键不松开和一次按键效果相同，区
        别于电平触发
------------------------------------------------*/
#include<reg52.h> //包含头文件，一般情况不需要改动，头文件包含特殊功能寄存器的定义
/*------------------------------------------------
                    主程序
------------------------------------------------*/
main()
{
  P1=0x55;       //P1口初始值
  EA=1;          //全局中断开
  EX0=1;         //外部中断0开
  IT0=1;         //边沿触发
  while(1)
  {
                 //在此添加其他程序
  }
}
/*------------------------------------------------
                 外部中断程序
------------------------------------------------*/
void ISR_Key(void) interrupt 0 using 1
{
 P1=~P1;         //s3按下触发一次，P1取反一次
}
