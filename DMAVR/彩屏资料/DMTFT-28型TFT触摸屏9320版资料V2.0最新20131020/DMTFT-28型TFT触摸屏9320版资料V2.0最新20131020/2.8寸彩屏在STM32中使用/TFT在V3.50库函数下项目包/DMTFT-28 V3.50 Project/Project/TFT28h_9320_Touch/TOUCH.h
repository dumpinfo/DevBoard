

extern struct struct1 coordinate;      //定义一个名为Tp_pix的结构变量,用于存放处理后的触摸坐标参数
extern uint  lx,ly;  

void start_7843(void);
void Write_7843(uchar temp);          //SPI写8位命令到触摸控制IC
uint Read_7843(void);                     //SPI 读数据
struct struct1 AD7843(void) ;
uchar pix_filter(struct struct1 pix1,struct struct1 pix2);
uchar Getpix(void);
void drawpoint(unsigned int x,unsigned int y,unsigned int color);
void Print_Decimal(uchar i,u16 buffer);
void Display_Coordinate(int x,unsigned int y,unsigned int color);


