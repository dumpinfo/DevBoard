extern struct struct1       //定义一个类型名为struct1的结构,包含两个成员x和y
{
	unsigned int x;         //成员x
	unsigned int y;         //成员y
};  

extern struct struct1 coordinate;      //定义一个名为Tp_pix的结构变量,用于存放处理后的触摸坐标参数
extern unsigned int  lx,ly;  

void start_7843();
void Write_7843();          //SPI写8位命令到触摸控制IC
unsigned int Read_7843();   //SPI 读数据
struct struct1 AD7843() ;
unsigned char pix_filter(struct struct1 pix1,struct struct1 pix2);
unsigned char Getpix();

