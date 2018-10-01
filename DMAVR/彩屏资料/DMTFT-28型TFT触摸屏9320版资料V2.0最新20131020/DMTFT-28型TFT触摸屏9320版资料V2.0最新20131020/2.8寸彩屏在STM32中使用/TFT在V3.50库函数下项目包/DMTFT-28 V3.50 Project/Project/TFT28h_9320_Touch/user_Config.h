
/*8��LED�ӿڶ���*/
#define RCC_GPIO_LED8                   RCC_APB2Periph_GPIOC    //LEDʹ�õ�GPIOʱ��
#define LEDn                            8                       //LED����Ϊ8
#define GPIO_LED8                       GPIOC                   //LEDʹ�õ�GPIOΪPC

#define DS1_PIN                         GPIO_Pin_0             	//DS1ʹ�õ�GPIO�ܽ�
#define DS2_PIN                         GPIO_Pin_1							//DS2ʹ�õ�GPIO�ܽ�
#define DS3_PIN                         GPIO_Pin_2  						//DS3ʹ�õ�GPIO�ܽ�
#define DS4_PIN                         GPIO_Pin_3							//DS4ʹ�õ�GPIO�ܽ�
#define DS5_PIN                         GPIO_Pin_4             	//DS5ʹ�õ�GPIO�ܽ�
#define DS6_PIN                         GPIO_Pin_5							//DS6ʹ�õ�GPIO�ܽ�
#define DS7_PIN                         GPIO_Pin_6  						//DS7ʹ�õ�GPIO�ܽ�
#define DS8_PIN                         GPIO_Pin_7							//DS8ʹ�õ�GPIO�ܽ�

/*2.8��TFT��������ʾ�ӿڶ���*/
#define GPIO_TFT_DATA                   GPIOC    				         //���ݿ�PC0~PC7
#define RCC_GPIO_TFT                    RCC_APB2Periph_GPIOC

#define GPIO_CTRA                   		GPIOA    				         //���ƿ�
#define RCC_GPIO_CTRA    		            RCC_APB2Periph_GPIOA
#define GPIO_CTRB			              		GPIOB    				         //���ƿ�
#define RCC_GPIO_CTRB    								RCC_APB2Periph_GPIOB

#define RS_CLR	        GPIO_ResetBits(GPIO_CTRA, GPIO_Pin_0)     //RS�õ�
#define RS_SET	        GPIO_SetBits(GPIO_CTRA, GPIO_Pin_0)       //RS�ø�

#define RW_CLR	        GPIO_ResetBits(GPIO_CTRA, GPIO_Pin_1)     //RW�õ�
#define RW_SET	        GPIO_SetBits(GPIO_CTRA, GPIO_Pin_1)  		  //RW�ø�

#define RD_CLR	        GPIO_ResetBits(GPIO_CTRB, GPIO_Pin_8)     //E�õ�
#define RD_SET	        GPIO_SetBits(GPIO_CTRB, GPIO_Pin_8)       //E�ø�

#define CS_CLR	        GPIO_ResetBits(GPIO_CTRB, GPIO_Pin_0)     //CS�õ�
#define CS_SET	        GPIO_SetBits(GPIO_CTRB, GPIO_Pin_0)       //CS�ø�

#define RST_CLR	        GPIO_ResetBits(GPIO_CTRB, GPIO_Pin_1)     //RST�õ�
#define RST_SET	        GPIO_SetBits(GPIO_CTRB, GPIO_Pin_1)       //RST�ø�

#define LE_CLR	        GPIO_ResetBits(GPIO_CTRB, GPIO_Pin_2)     //LE�õ�
#define LE_SET	        GPIO_SetBits(GPIO_CTRB, GPIO_Pin_2)       //LE�ø�

#define DataPort        GPIOC                     								//PC��Ϊ���ݿ�

#define D0              GPIO_Pin_0             										//D0ʹ�õ�GPIO�ܽ�
#define D1              GPIO_Pin_1																//D1ʹ�õ�GPIO�ܽ�
#define D2              GPIO_Pin_2  															//D2ʹ�õ�GPIO�ܽ�
#define D3							GPIO_Pin_3																//D3ʹ�õ�GPIO�ܽ�
#define D4					    GPIO_Pin_4             										//D4ʹ�õ�GPIO�ܽ�
#define D5				      GPIO_Pin_5																//D5ʹ�õ�GPIO�ܽ�
#define D6				     	GPIO_Pin_6  															//D6ʹ�õ�GPIO�ܽ�
#define D7				     	GPIO_Pin_7																//D7ʹ�õ�GPIO�ܽ�

//������TFT�������������Ӳ������

#define GPIO_TOUCHA                   		GPIOA    				         //���ƿ�
#define RCC_GPIO_TOUCHA    		            RCC_APB2Periph_GPIOA
#define GPIO_TOUCHC			              		GPIOC    				         //���ƿ�
#define RCC_GPIO_TOUCHC    								RCC_APB2Periph_GPIOC

#define PEN_CLR	        GPIO_ResetBits(GPIO_TOUCHC, GPIO_Pin_12)   //PEN�õ�,����������ʱ��ADS7843Penirq������δ����ʱ�ĸߵ�ƽ��Ϊ�͵�ƽ
#define PEN_SET	        GPIO_SetBits(GPIO_TOUCHC, GPIO_Pin_12)     //PEN�ø�
#define PEN             GPIO_ReadInputDataBit(GPIO_TOUCHC,GPIO_Pin_12)    //PC12�����ֵ

#define TPDO_CLR				GPIO_ResetBits(GPIO_TOUCHC, GPIO_Pin_11)   //TPDO�õ�
#define TPDO_SET				GPIO_SetBits(GPIO_TOUCHC, GPIO_Pin_11)     //TPDO�ø�
#define TPDOUT          GPIO_ReadInputDataBit(GPIO_TOUCHC,GPIO_Pin_11)   //PC11�����ֵ

#define BUSY_CLR				GPIO_ResetBits(GPIO_TOUCHC, GPIO_Pin_10)   //BUSY�õ�
#define BUSY_SET				GPIO_SetBits(GPIO_TOUCHC, GPIO_Pin_10)     //BUSY�ø�

#define TPDI_CLR				GPIO_ResetBits(GPIO_TOUCHA, GPIO_Pin_8)    //TPDI�õ�
#define TPDI_SET				GPIO_SetBits(GPIO_TOUCHA, GPIO_Pin_8)      //TPDI�ø�

#define TPCS_CLR				GPIO_ResetBits(GPIO_TOUCHC, GPIO_Pin_9)    //TPCS�õ�
#define TPCS_SET				GPIO_SetBits(GPIO_TOUCHC, GPIO_Pin_9)      //TPCS�ø�

#define TPCLK_CLR				GPIO_ResetBits(GPIO_TOUCHC, GPIO_Pin_8)    //TPCLK�õ�
#define TPCLK_SET				GPIO_SetBits(GPIO_TOUCHC, GPIO_Pin_8)      //TPCLK�ø�

#define TCLK            GPIO_Pin_8             										 //TCLKʹ�õ�GPIO�ܽ�
#define TCS             GPIO_Pin_9																 //TCSʹ�õ�GPIO�ܽ�
#define BUSY            GPIO_Pin_10  															 //BUSYʹ�õ�GPIO�ܽ�



/*ȫ�ֱ���-��ɫ����*/

#define White          0xFFFF           													//��ʾ��ɫ����
#define Black          0x0000
#define Blue           0x001F
#define Blue2          0x051F
#define Red            0xF800
#define Magenta        0xF81F
#define Green          0x07E0
#define Cyan           0x7FFF
#define Yellow         0xFFE0

/*����������*/
void RCC_Configuration(void);
void NVIC_Configuration(void);
void Delay(vu32 nCount);
void LED_Runing(u8 LED_NUM);


