 unsigned char GB2312[][32]=
{
// 简体汉字点阵
// 字体：宋体   6个汉字
// 点阵：16×16
// 文本：年月日时分秒
//
// 年

0x08,0x00,
0x0F,0xFC,
0x10,0x80,
0x10,0x80,
0x20,0x80,
0x4F,0xF8,
0x88,0x80,
0x08,0x80,
0x08,0x80,
0x08,0x80,
0xFF,0xFE,
0x00,0x80,
0x00,0x80,
0x00,0x80,
0x00,0x80,
0x00,0x80,

// 月
0x07,0xF0,
0x04,0x10,
0x04,0x10,
0x04,0x10,
0x07,0xF0,
0x04,0x10,
0x04,0x10,
0x04,0x10,
0x07,0xF0,
0x04,0x10,
0x08,0x10,
0x08,0x10,
0x10,0x10,
0x20,0x50,
0x40,0x20,
0x00,0x00,
// 日
0x00,0x00,
0x1F,0xF0,
0x10,0x10,
0x10,0x10,
0x10,0x10,
0x10,0x10,
0x1F,0xF0,
0x10,0x10,
0x10,0x10,
0x10,0x10,
0x10,0x10,
0x10,0x10,
0x1F,0xF0,
0x10,0x10,
0x00,0x00,
0x00,0x00,
// 时
0x00,0x10,
0x00,0x10,
0x7C,0x10,
0x44,0x10,
0x47,0xFE,
0x44,0x10,
0x7C,0x10,
0x45,0x10,
0x44,0x90,
0x44,0x90,
0x7C,0x10,
0x00,0x10,
0x00,0x10,
0x00,0x10,
0x00,0x50,
0x00,0x20,
// 分
0x08,0x80,
0x0C,0x80,
0x08,0x40,
0x10,0x20,
0x10,0x30,
0x20,0x18,
0x40,0x0E,
0x9F,0xE4,
0x04,0x20,
0x04,0x20,
0x04,0x20,
0x04,0x20,
0x08,0x20,
0x10,0xA0,
0x20,0x40,
0x40,0x00,
// 秒
0x0C,0x20,
0xF0,0x20,
0x10,0x20,
0x11,0x28,
0xFD,0xA4,
0x11,0x22,
0x32,0x22,
0x3A,0x20,
0x54,0x22,
0x54,0x22,
0x90,0x04,
0x10,0x08,
0x10,0x10,
0x10,0x60,
0x11,0x80,
0x16,0x00,

//星
0x00,0x08,0x3F,0xFC,0x20,0x08,0x3F,
0xF8,0x20,0x08,0x3F,0xF8,0x01,0x00,
0x21,0x08,0x3F,0xFC,0x21,0x00,0x41,
0x10,0xBF,0xF8,0x01,0x00,0x01,0x04,
0xFF,0xFE,0x00,0x00,
//期
0x22,0x04,0x22,0x7E,0x22,0x44,0x7F,
0x44,0x22,0x44,0x3E,0x7C,0x22,0x44,
0x3E,0x44,0x22,0x44,0x22,0x7C,0xFF,
0xC4,0x00,0x44,0x24,0x44,0x22,0x84,
0x41,0x14,0x82,0x08,

//一
0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x04,
0xFF,0xFE,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,
//二
0x00,0x00,0x00,0x00,0x00,0x10,0x3F,
0xF8,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x04,0xFF,0xFE,0x00,0x00,
0x00,0x00,0x00,0x00,
//三
0x00,0x00,0x00,0x08,0x7F,0xFC,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x10,
0x3F,0xF8,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x04,0xFF,0xFE,
0x00,0x00,0x00,0x00,
//四
0x00,0x00,0x00,0x04,0x7F,0xFE,0x44,
0x44,0x44,0x44,0x44,0x44,0x44,0x44,
0x44,0x44,0x44,0x44,0x44,0x3C,0x48,
0x04,0x50,0x04,0x40,0x04,0x7F,0xFC,
0x40,0x04,0x00,0x00,
//五
0x00,0x00,0x00,0x08,0x7F,0xFC,0x02,
0x00,0x02,0x00,0x02,0x00,0x02,0x10,
0x3F,0xFC,0x04,0x10,0x04,0x10,0x04,
0x10,0x08,0x10,0x08,0x10,0x08,0x14,
0xFF,0xFE,0x00,0x00,
//六
0x00,0x00,0x04,0x00,0x02,0x00,0x03,
0x00,0x01,0x04,0xFF,0xFE,0x00,0x00,
0x00,0x00,0x04,0x40,0x0C,0x20,0x08,
0x10,0x10,0x18,0x10,0x0C,0x20,0x0C,
0x40,0x04,0x00,0x00,
//日
0x00,0x10,0x1F,0xF8,0x10,0x10,0x10,
0x10,0x10,0x10,0x10,0x10,0x10,0x10,
0x1F,0xF0,0x10,0x10,0x10,0x10,0x10,
0x10,0x10,0x10,0x10,0x10,0x1F,0xF0,
0x10,0x10,0x00,0x00,
//上
0x01,0x00,0x01,0x00,0x01,0x00,0x01,
0x00,0x01,0x10,0x01,0xF8,0x01,0x00,
0x01,0x00,0x01,0x00,0x01,0x00,0x01,
0x00,0x01,0x00,0x01,0x00,0x01,0x04,
0xFF,0xFE,0x00,0x00,
//下
0x00,0x04,0xFF,0xFE,0x02,0x00,0x02,
0x00,0x02,0x00,0x02,0x80,0x02,0x40,
0x02,0x30,0x02,0x10,0x02,0x00,0x02,
0x00,0x02,0x00,0x02,0x00,0x02,0x00,
0x02,0x00,0x02,0x00,
//午-18
0x08,0x00,0x08,0x10,0x0F,0xF8,0x11,
0x00,0x11,0x00,0x21,0x00,0x41,0x00,
0x01,0x04,0xFF,0xFE,0x01,0x00,0x01,
0x00,0x01,0x00,0x01,0x00,0x01,0x00,
0x01,0x00,0x01,0x00,

//欣
0x02,0x40,0x07,0x40,0x38,0x40,0x20,
0x40,0x20,0x7E,0x20,0x82,0x3F,0x24,
0x24,0x20,0x24,0x20,0x24,0x20,0x24,
0x50,0x24,0x50,0x44,0x88,0x44,0x88,
0x85,0x06,0x02,0x04,
//世
0x01,0x10,0x11,0x10,0x11,0x10,0x11,
0x10,0x11,0x14,0xFF,0xFE,0x11,0x10,
0x11,0x10,0x11,0x10,0x11,0x10,0x11,
0xF0,0x11,0x10,0x10,0x00,0x10,0x08,
0x1F,0xFC,0x00,0x00,
//纪
0x08,0x00,0x08,0x04,0x13,0xFE,0x10,
0x04,0x24,0x04,0xFC,0x04,0x08,0x04,
0x11,0xFC,0x21,0x04,0xFD,0x00,0x41,
0x00,0x01,0x00,0x1D,0x02,0xE1,0x02,
0x40,0xFE,0x00,0x00,
//电
0x02,0x00,0x02,0x00,0x02,0x10,0x7F,
0xF8,0x42,0x10,0x42,0x10,0x7F,0xF0,
0x42,0x10,0x42,0x10,0x7F,0xF0,0x42,
0x10,0x02,0x00,0x02,0x04,0x02,0x04,
0x01,0xFC,0x00,0x00,
//子
0x00,0x00,0x3F,0xF0,0x00,0x10,0x00,
0x20,0x00,0x40,0x01,0x80,0x01,0x04,
0xFF,0xFE,0x01,0x00,0x01,0x00,0x01,
0x00,0x01,0x00,0x01,0x00,0x01,0x00,
0x05,0x00,0x02,0x00,


/* 点阵结束 */
};
