#include "inet_dsi_panel.h"
//#include <mach/sys_config.h>
#include "panels.h"

extern s32 bsp_disp_get_panel_info(u32 screen_id, struct disp_panel_para *info);
static void LCD_power_on(u32 sel);
static void LCD_power_off(u32 sel);
static void LCD_bl_open(u32 sel);
static void LCD_bl_close(u32 sel);

static void LCD_panel_init(u32 sel);
static void LCD_panel_exit(u32 sel);

static u8 const mipi_dcs_pixel_format[4] = {0x77,0x66,0x66,0x55};
#define panel_reset(val) sunxi_lcd_gpio_set_value(sel, 1, val)
#define power_en(val)  sunxi_lcd_gpio_set_value(sel, 0, val)

static void LCD_cfg_panel_info(struct panel_extend_para * info)
{
	u32 i = 0, j=0;
	u32 items;
	u8 lcd_gamma_tbl[][2] =
	{
		//{input value, corrected value}
		{0, 0},
		{15, 15},
		{30, 30},
		{45, 45},
		{60, 60},
		{75, 75},
		{90, 90},
		{105, 105},
		{120, 120},
		{135, 135},
		{150, 150},
		{165, 165},
		{180, 180},
		{195, 195},
		{210, 210},
		{225, 225},
		{240, 240},
		{255, 255},
	};

	u32 lcd_cmap_tbl[2][3][4] = {
	{
		{LCD_CMAP_G0,LCD_CMAP_B1,LCD_CMAP_G2,LCD_CMAP_B3},
		{LCD_CMAP_B0,LCD_CMAP_R1,LCD_CMAP_B2,LCD_CMAP_R3},
		{LCD_CMAP_R0,LCD_CMAP_G1,LCD_CMAP_R2,LCD_CMAP_G3},
		},
		{
		{LCD_CMAP_B3,LCD_CMAP_G2,LCD_CMAP_B1,LCD_CMAP_G0},
		{LCD_CMAP_R3,LCD_CMAP_B2,LCD_CMAP_R1,LCD_CMAP_B0},
		{LCD_CMAP_G3,LCD_CMAP_R2,LCD_CMAP_G1,LCD_CMAP_R0},
		},
	};

	items = sizeof(lcd_gamma_tbl)/2;
	for(i=0; i<items-1; i++) {
		u32 num = lcd_gamma_tbl[i+1][0] - lcd_gamma_tbl[i][0];

		for(j=0; j<num; j++) {
			u32 value = 0;

			value = lcd_gamma_tbl[i][1] + ((lcd_gamma_tbl[i+1][1] - lcd_gamma_tbl[i][1]) * j)/num;
			info->lcd_gamma_tbl[lcd_gamma_tbl[i][0] + j] = (value<<16) + (value<<8) + value;
		}
	}
	info->lcd_gamma_tbl[255] = (lcd_gamma_tbl[items-1][1]<<16) + (lcd_gamma_tbl[items-1][1]<<8) + lcd_gamma_tbl[items-1][1];

	memcpy(info->lcd_cmap_tbl, lcd_cmap_tbl, sizeof(lcd_cmap_tbl));

}

static s32 LCD_open_flow(u32 sel)
{       
	LCD_OPEN_FUNC(sel, LCD_power_on, 100);   //open lcd power, and delay 50ms
	LCD_OPEN_FUNC(sel, LCD_panel_init, 200);   //open lcd power, than delay 200ms
	LCD_OPEN_FUNC(sel, sunxi_lcd_tcon_enable, 50);     //open lcd controller, and delay 100ms
	LCD_OPEN_FUNC(sel, LCD_bl_open, 0);     //open lcd backlight, and delay 0ms

	return 0;
}

static s32 LCD_close_flow(u32 sel)
{
	LCD_CLOSE_FUNC(sel, LCD_bl_close, 200);       //close lcd backlight, and delay 0ms
	LCD_CLOSE_FUNC(sel, sunxi_lcd_tcon_disable, 20);         //close lcd controller, and delay 0ms
	LCD_CLOSE_FUNC(sel, LCD_panel_exit,	10);   //open lcd power, than delay 200ms
	LCD_CLOSE_FUNC(sel, LCD_power_off, 500);   //close lcd power, and delay 500ms

	return 0;
}

static void LCD_power_on(u32 sel)
{
	sunxi_lcd_power_enable(sel, 0);//config lcd_power pin to open lcd power
	sunxi_lcd_delay_ms(5);
	sunxi_lcd_power_enable(sel, 1);//config lcd_power pin to open lcd power1
	sunxi_lcd_delay_ms(5);
	sunxi_lcd_power_enable(sel, 2);//config lcd_power pin to open lcd power2
	sunxi_lcd_delay_ms(5);
	power_en(1);
	sunxi_lcd_delay_ms(20);
	panel_reset(1);
	sunxi_lcd_delay_ms(5);
	sunxi_lcd_pin_cfg(sel, 1);
}

static void LCD_power_off(u32 sel)
{   
	sunxi_lcd_pin_cfg(sel, 0);
	power_en(0);
	sunxi_lcd_delay_ms(20);
	panel_reset(0);
	sunxi_lcd_delay_ms(5);
	sunxi_lcd_power_disable(sel, 2);//config lcd_power pin to close lcd power2
	sunxi_lcd_delay_ms(5);
	sunxi_lcd_power_disable(sel, 1);//config lcd_power pin to close lcd power1
	sunxi_lcd_delay_ms(5);
	sunxi_lcd_power_disable(sel, 0);//config lcd_power pin to close lcd power
}

static void LCD_bl_open(u32 sel)
{
	sunxi_lcd_pwm_enable(sel);
	sunxi_lcd_delay_ms(50);
	sunxi_lcd_backlight_enable(sel);//config lcd_bl_en pin to open lcd backlight
}

static void LCD_bl_close(u32 sel)
{
	sunxi_lcd_backlight_disable(sel);//config lcd_bl_en pin to close lcd backlight
	sunxi_lcd_delay_ms(20);
	sunxi_lcd_pwm_disable(sel);
}

#define REGFLAG_DELAY             						0XFE 
#define REGFLAG_END_OF_TABLE      						0xFF   // END OF REGISTERS MARKER

struct LCM_setting_table {
    u8 cmd;
    u32 count;
    u8 para_list[64];
};

/*add panel initialization below*/

static struct LCM_setting_table LCM_LT080B21BA94_setting[] = {   //N86 jingjia suoling
	{0xFF, 0x03, {0x98, 0x81, 0x03}},
	{0x01, 0x01, {0x00}},
	{0x02, 0x01, {0x00}},
	{0x03, 0x01, {0x73}},
	{0x04, 0x01, {0x00}},
	{0x05, 0x01, {0x00}},
	{0x06, 0x01, {0x0A}},
	{0x07, 0x01, {0x00}},
	{0x08, 0x01, {0x00}},
	{0x09, 0x01, {0x01}},
	{0x0a, 0x01, {0x00}},//00 
	{0x0b, 0x01, {0x00}},
	{0x0c, 0x01, {0x01}},
	{0x0d, 0x01, {0x00}},
	{0x0e, 0x01, {0x00}},
	{0x0f, 0x01, {0x1D}},
	{0x10, 0x01, {0x1d}},//1D
	{0x11, 0x01, {0x00}},
	{0x12, 0x01, {0x00}},
	{0x13, 0x01, {0x00}},
	{0x14, 0x01, {0x00}},
	{0x15, 0x01, {0x00}},
	{0x16, 0x01, {0x00}},
	{0x17, 0x01, {0x00}},
	{0x18, 0x01, {0x00}},
	{0x19, 0x01, {0x00}},
	{0x1a, 0x01, {0x00}},
	{0x1b, 0x01, {0x00}},
	{0x1c, 0x01, {0x00}},
	{0x1d, 0x01, {0x00}},
	{0x1e, 0x01, {0x40}},
	{0x1f, 0x01, {0x80}},
	{0x20, 0x01, {0x06}},
	{0x21, 0x01, {0x02}},
	{0x22, 0x01, {0x00}},
	{0x23, 0x01, {0x00}},
	{0x24, 0x01, {0x00}},
	{0x25, 0x01, {0x00}},
	{0x26, 0x01, {0x00}},
	{0x27, 0x01, {0x00}},
	{0x28, 0x01, {0x33}},
	{0x29, 0x01, {0x03}},
	{0x2a, 0x01, {0x00}},
	{0x2b, 0x01, {0x00}},
	{0x2c, 0x01, {0x00}},
	{0x2d, 0x01, {0x00}},
	{0x2e, 0x01, {0x00}},
	{0x2f, 0x01, {0x00}},
	{0x30, 0x01, {0x00}},
	{0x31, 0x01, {0x00}},
	{0x32, 0x01, {0x00}},
	{0x33, 0x01, {0x00}},
	{0x34, 0x01, {0x04}},
	{0x35, 0x01, {0x00}},
	{0x36, 0x01, {0x00}},
	{0x37, 0x01, {0x00}},
	{0x38, 0x01, {0x3C}},
	{0x39, 0x01, {0x35}},
	{0x3A, 0x01, {0x01}},
	{0x3B, 0x01, {0x40}},
	{0x3C, 0x01, {0x00}},
	{0x3D, 0x01, {0x01}},
	{0x3E, 0x01, {0x00}},
	{0x3F, 0x01, {0x00}},
	{0x40, 0x01, {0x00}},
	{0x41, 0x01, {0x88}},
	{0x42, 0x01, {0x00}},
	{0x43, 0x01, {0x00}},
	{0x44, 0x01, {0x1F}},
	{0x50, 0x01, {0x01}},
	{0x51, 0x01, {0x23}},
	{0x52, 0x01, {0x45}},
	{0x53, 0x01, {0x67}},
	{0x54, 0x01, {0x89}},
	{0x55, 0x01, {0xab}},
	{0x56, 0x01, {0x01}},
	{0x57, 0x01, {0x23}},
	{0x58, 0x01, {0x45}},
	{0x59, 0x01, {0x67}},
	{0x5a, 0x01, {0x89}},
	{0x5b, 0x01, {0xab}},
	{0x5c, 0x01, {0xcd}},
	{0x5d, 0x01, {0xef}},
	{0x5e, 0x01, {0x11}},
	{0x5f, 0x01, {0x01}},
	{0x60, 0x01, {0x00}},
	{0x61, 0x01, {0x15}},
	{0x62, 0x01, {0x14}},
	{0x63, 0x01, {0x0E}},
	{0x64, 0x01, {0x0F}},
	{0x65, 0x01, {0x0C}},
	{0x66, 0x01, {0x0D}},
	{0x67, 0x01, {0x06}},
	{0x68, 0x01, {0x02}},
	{0x69, 0x01, {0x07}},
	{0x6a, 0x01, {0x02}},
	{0x6b, 0x01, {0x02}},
	{0x6c, 0x01, {0x02}},
	{0x6d, 0x01, {0x02}},
	{0x6e, 0x01, {0x02}},
	{0x6f, 0x01, {0x02}},
	{0x70, 0x01, {0x02}},
	{0x71, 0x01, {0x02}},
	{0x72, 0x01, {0x02}},
	{0x73, 0x01, {0x02}},
	{0x74, 0x01, {0x02}},
	{0x75, 0x01, {0x01}},
	{0x76, 0x01, {0x00}},
	{0x77, 0x01, {0x14}},
	{0x78, 0x01, {0x15}},
	{0x79, 0x01, {0x0E}},
	{0x7a, 0x01, {0x0F}},
	{0x7b, 0x01, {0x0C}},
	{0x7c, 0x01, {0x0D}},
	{0x7d, 0x01, {0x06}},
	{0x7e, 0x01, {0x02}},
	{0x7f, 0x01, {0x07}},
	{0x80, 0x01, {0x02}},
	{0x81, 0x01, {0x02}},
	{0x82, 0x01, {0x02}},
	{0x83, 0x01, {0x02}},
	{0x84, 0x01, {0x02}},
	{0x85, 0x01, {0x02}},
	{0x86, 0x01, {0x02}},
	{0x87, 0x01, {0x02}},
	{0x88, 0x01, {0x02}},
	{0x89, 0x01, {0x02}},
	{0x8A, 0x01, {0x02}},
	{0xFF, 0x03, {0x98, 0x81, 0x04}},
	{0x70, 0x01, {0x00}}, 
	{0x71, 0x01, {0x00}}, 
	{0x82, 0x01, {0x0F}},          //VGH_MOD clamp level=15v 
	{0x84, 0x01, {0x0F}},          //VGH clamp level 15V 
	{0x85, 0x01, {0x0D}},      //VGL clamp level (-10V) 
	{0x32, 0x01, {0xAC}}, 
	{0x8C, 0x01, {0x80}}, 
	{0x3C, 0x01, {0xF5}}, 
	{0xB5, 0x01, {0x07}},        //GAMMA OP 
	{0x31, 0x01, {0x45}},         //SOURCE OP 
	{0x3A, 0x01, {0x24}}, //24        //PS_EN OFF 
	{0x88, 0x01, {0x33}},  
	{0xFF, 0x03, {0x98, 0x81, 0x01}},
	{0x22, 0x01, {0x09}},         //BGR SS GS 
	{0x31, 0x01, {0x00}},         //column inversion 
	{0x53, 0x01, {0x8A}},         //VCOM1 
	{0x55, 0x01, {0xA2}},         //VCOM2 
	{0x50, 0x01, {0x5b}},         //VREG1OUT=5V 
	{0x51, 0x01, {0x5b}},         //VREG2OUT=-5V 
	{0x62, 0x01, {0x0D}},         //EQT Time setting 
	{0xFF, 0x03, {0x98, 0x81, 0x01}},
	{0xA0, 0x01, {0x00}},
	{0xA1, 0x01, {0x1A}},
	{0xA2, 0x01, {0x28}},
	{0xA3, 0x01, {0x13}},
	{0xA4, 0x01, {0x16}},
	{0xA5, 0x01, {0x29}},
	{0xA6, 0x01, {0x1D}},
	{0xA7, 0x01, {0x1E}},
	{0xA8, 0x01, {0x84}},
	{0xA9, 0x01, {0x1C}},
	{0xAA, 0x01, {0x28}},
	{0xAB, 0x01, {0x75}},
	{0xAC, 0x01, {0x1A}},
	{0xAD, 0x01, {0x19}},
	{0xAE, 0x01, {0x4D}},
	{0xAF, 0x01, {0x22}},
	{0xB0, 0x01, {0x28}},
	{0xB1, 0x01, {0x54}},
	{0xB2, 0x01, {0x66}},
	{0xB3, 0x01, {0x39}},
	{0xC0, 0x01, {0x00}},
	{0xC1, 0x01, {0x1A}},
	{0xC2, 0x01, {0x28}},
	{0xC3, 0x01, {0x13}},
	{0xC4, 0x01, {0x16}},
	{0xC5, 0x01, {0x29}},
	{0xC6, 0x01, {0x1D}},
	{0xC7, 0x01, {0x1E}},
	{0xC8, 0x01, {0x84}},
	{0xC9, 0x01, {0x1C}},
	{0xCA, 0x01, {0x28}},
	{0xCB, 0x01, {0x75}},
	{0xCC, 0x01, {0x1A}},
	{0xCD, 0x01, {0x19}},
	{0xCE, 0x01, {0x4D}},
	{0xCF, 0x01, {0x22}},
	{0xD0, 0x01, {0x28}},
	{0xD1, 0x01, {0x54}},
	{0xD2, 0x01, {0x66}},
	{0xD3, 0x01, {0x39}},
	{0xFF, 0x03, {0x98, 0x81, 0x00}},    
	{0x35, 0x01, {0x00}},  
 
	{0x11, 0x01, {0x00}},
	{REGFLAG_DELAY, REGFLAG_DELAY, {120}},
	{0x29, 0x01, {0x00}},
	{REGFLAG_DELAY, REGFLAG_DELAY, {5}},
//#endif
	{REGFLAG_END_OF_TABLE, REGFLAG_END_OF_TABLE, {}}
};

static void LCD_panel_init(u32 sel)
{
	u32 i;
	char lcd_model_name[32];
	disp_sys_script_get_item("lcd0", "lcd_model_name", (int*)lcd_model_name, 2);
	
	sunxi_lcd_dsi_clk_enable(sel);
	sunxi_lcd_delay_ms(20);
	sunxi_lcd_dsi_dcs_write_0para(sel,DSI_DCS_SOFT_RESET);
	sunxi_lcd_delay_ms(10);
	
	sunxi_lcd_dsi_dcs_write_0para(sel,0x10);

	for(i=0;;i++)
	{
		if(LCM_LT080B21BA94_setting[i].count == REGFLAG_END_OF_TABLE)
			break;
		else if (LCM_LT080B21BA94_setting[i].count == REGFLAG_DELAY)
			sunxi_lcd_delay_ms(LCM_LT080B21BA94_setting[i].para_list[0]);
		else
			dsi_dcs_wr(sel,LCM_LT080B21BA94_setting[i].cmd,LCM_LT080B21BA94_setting[i].para_list,LCM_LT080B21BA94_setting[i].count);
	}

//	sunxi_lcd_dsi_dcs_write_0para(sel, 0x29);

	return;
}

static void LCD_panel_exit(u32 sel)
{
	sunxi_lcd_dsi_dcs_write_0para(sel,DSI_DCS_SET_DISPLAY_OFF);
	sunxi_lcd_delay_ms(20);
	sunxi_lcd_dsi_dcs_write_0para(sel,DSI_DCS_ENTER_SLEEP_MODE);
	sunxi_lcd_delay_ms(80);

	return ;
}

//sel: 0:lcd0; 1:lcd1
static s32 LCD_user_defined_func(u32 sel, u32 para1, u32 para2, u32 para3)
{
	return 0;
}

//sel: 0:lcd0; 1:lcd1
/*static s32 LCD_set_bright(u32 sel, u32 bright)
{
	sunxi_lcd_dsi_dcs_write_1para(sel,0x51,bright);
	return 0;
}*/

struct __lcd_panel hc_050_dsi_panel = {
	/* panel driver name, must mach the name of lcd_drv_name in sys_config.fex */
	.name = "hc_050",
	.func = {
		.cfg_panel_info = LCD_cfg_panel_info,
		.cfg_open_flow = LCD_open_flow,
		.cfg_close_flow = LCD_close_flow,
		.lcd_user_defined_func = LCD_user_defined_func,
		//.set_bright = LCD_set_bright,
	},
};
