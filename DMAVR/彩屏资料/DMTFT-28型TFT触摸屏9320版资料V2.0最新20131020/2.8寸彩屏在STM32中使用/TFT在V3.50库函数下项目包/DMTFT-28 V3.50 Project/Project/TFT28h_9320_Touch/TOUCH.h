

extern struct struct1 coordinate;      //����һ����ΪTp_pix�Ľṹ����,���ڴ�Ŵ����Ĵ����������
extern uint  lx,ly;  

void start_7843(void);
void Write_7843(uchar temp);          //SPIд8λ�����������IC
uint Read_7843(void);                     //SPI ������
struct struct1 AD7843(void) ;
uchar pix_filter(struct struct1 pix1,struct struct1 pix2);
uchar Getpix(void);
void drawpoint(unsigned int x,unsigned int y,unsigned int color);
void Print_Decimal(uchar i,u16 buffer);
void Display_Coordinate(int x,unsigned int y,unsigned int color);


