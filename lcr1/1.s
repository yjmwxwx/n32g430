	@单片机：N32G430C8L7
	@功能:lcr数字电桥
	@作者：yjmwxwx
	@时间：20220903
	@编译器：arm-none-eabi
	.thumb
	.syntax unified
.section .text
vectors:					@向量表
	.word STACHINIT	
	.word _start + 1			@复位向量
        .word _nmi_handler + 1 
        .word _hard_fault + 1 
        .word _memory_fault + 1 
        .word _bus_fault + 1
        .word _usage_fault + 1
	.word 0
	.word 0
	.word 0
	.word 0
	.word aaa +1 @_svc_handler + 1
	.word aaa +1 @_debugmon_handler + 1
	.word 0
	.word aaa +1 @_pendsv_handler + 1
	.word __systick_zhongduan +1
	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	.word aaa +1 @0 _wwdg +1
	.word aaa +1 @1 _pvd +1
	.word aaa +1 @2 _rtc_tamper_stamp +1
	.word aaa +1 @3 _rtc_wkup +1
	.word aaa +1 @4 _flash +1
	.word aaa +1 @5 _rcc +1
	.word aaa +1 @6 _exti0 +1
	.word aaa +1 @7 _exti1 +1
	.word aaa +1 @8 _exti2 +1
	.word aaa +1 @9 _exti3 +1
	.word aaa +1 @10 _exti4 +1
	.word _dma_channel1 +1
	.word aaa +1 @12 _dma_channel2 +1
	.word aaa +1 @13 _dma_channel3 +1
	.word aaa +1 @14 _dma_channel4 +1
	.word aaa +1 @15 _dma_channel5 +1
	.word aaa +1 @16 _dma_channel6 +1
	.word aaa +1 @17 _dma_channel7 +1
	.word aaa +1 @18 _dma_channel8 +1
	.word aaa +1 @19 _adc +1
	.word aaa +1 @20 _mmu +1
	.word aaa +1 @21 _comp_1_2_3 +1
	.word aaa +1 @22 _exti9_5 +1
	.word aaa +1 @23 _tim1_brk +1
	.word aaa +1 @24 _tim1_up +1
	.word aaa +1 @25 _tim1_trg_com +1
	.word aaa +1 @26 _tim1_cc +1
	.word aaa +1 @27 _tim2 +1
	.word aaa +1 @28  _tim3 +1
	.word aaa +1 @29 _tim4 +1
	.word aaa +1 @30 _i2c1_ev +1
	.word aaa +1 @31 _i2c1_er +1
	.word aaa +1 @32 _i2c2_ev +1
	.word aaa +1 @33 _i2c2_er +1
	.word aaa +1 @34 _spi1 +1
	.word aaa +1 @35 _spi2 +1
	.word aaa +1 @36 _usart1 +1
	.word aaa +1 @37 _usart2 +1
	.word aaa +1 @38 _uart3 +1
	.word aaa +1 @39 _exti15_10 +1
	.word aaa +1 @40 _rtcalarm +1
	.word aaa +1 @41 _lptim_wkup +1
	.word aaa +1 @42 _tim8_brk +1
	.word aaa +1 @43 _tim8_up +1
	.word aaa +1 @44 _tim8_trg +1
	.word aaa +1 @45 _tim8_cc +1
	.word aaa +1 @46 _uart4 +1
	.word aaa +1 @47 _tim5 +1
	.word aaa +1 @48 _tim6 +1
	.word aaa +1 @49 _can_tx +1
	.word aaa +1 @50 _can_rx0 +1
	.word aaa +1 @51 _can_rx1 +1
	.word aaa +1 @52 _can_sce +1
_start:
	ldr r0, = 0xe000ed88
	ldr r1, = 0x00f00000
	str r1, [r0]		@开FPU协处理器
__shizhong:
	ldr r2, = 0x40022000   @FLASH访问控制
	movs r1, # 0x33
	str r1, [r2]           @FLASH缓冲 缓冲开启
	ldr r0, = 0x40021000 @ rcc
	ldr r1, = 0x10001
	str r1, [r0]
__denghse:
	ldr r1, [r0]
	lsls r1, r1, # 14
	bpl __denghse
__dengpllguan:
	ldr r1, [r0]
	lsls r1, r1, # 6
	bmi __dengpllguan
	ldr r1, = 0x390002
	mov r0, r0
	str r1, [r0, # 0x04]
	mov r0, r0
	ldr r1, = 0x1010000
	mov r0, r0
	str r1, [r0]

__dengpll:
	ldr r1, [r0]
	lsls r1, # 6
	bpl __dengpll
__waishe_shizhong:
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@外设时钟
	@rcc_ahbpclken  0x40021014
	@0=dma,2=sram,4=flitf,6=crc,7=pa,8=pb,9=pc,10=pd,12=adc
	@rcc_apb2pclken 0x40021018
	@0=afio,1=beeper,11=tim1,12=spi1,13=tim8,14=usart1,17=uart3,19=spi2
	@rcc_apb1pclken 0x4002101c
	@0=tim2,1=tim3,2=tim4,3=tim5,4=tim6,6=comp,7=compfilt,11wwdg,
	@17=usart2,21=i2c1,22=i2c2,25=can,28=pwr
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	movw r1, # 0x1795
	str r1, [r0, # 0x14]
	movw r1, # 0x3800
	str r1, [r0, # 0x18]
	movs r1, # 0x06
	str r1, [r0, # 0x1c]
	movw r1, # 0x3c00
	str r1, [r0, # 0x2c]	@adc
	movs r1, # 0x01
	str r1, [r0, # 0x80]	@adc

_waishezhongduan:			@外设中断
	@0xE000E100    0-31  写1开，写0没效
	@0XE000E180    0-31 写1关，写0没效
	@0XE000E200    0-31 挂起，写0没效
	@0XE000E280    0-31 清除， 写0没效
@	ldr r0, =  0xe000e100
@	ldr r1, = 0x800	@tim4
@	str r1, [r0]

_neicunqingling:
	ldr r0, = 0x20004000
	ldr r2, = 0x20000000
	movs r1, # 0
_neicunqinglingxunhuan:
	subs r0, r0, # 4
	str r1, [r0]
	cmp r0, r2
	bne _neicunqinglingxunhuan


	ldr r0, = zhengxian_100khz
	ldr r1, = 0x20000100
	movs r4, # 0 
fuzhi_xunhuan:
	ldrb r2, [r0, r4]
	strb r2, [r1, r4]
	adds r4, r4, # 1
	cmp r4, # 40
	bne fuzhi_xunhuan
	
	
	
__io_shezhi:
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@   pa=0x40023400,    pb=0x40023800,  pc=0x40023c00,  pd=0x40024000
        @0x00 端口模式寄存器(GPIOx_PMODE)
	@寄存器复位值
	@pa=0xabffffff  pb= 0xfffffebf  pc= 0xfc000000   pd=0xff000000
	@00=输入模式，01=通用输出模式，10=复用功能模式，11模拟功能模式
	@0x04 端口类型定义寄存器(GPIOx_POTYPE) 复位值0
	@ 0=推挽输出，1=开漏输出
	@0x08 翻转率配置寄存器(GPIOx_SR)
	@复位值，PA=0XFFFF，PB=0XFFFF，PC=0XE000,PD=0XF001
	@0=快速，1=慢速
	@0x0c 端口上下拉寄存器(GPIOx_PUPD)
	@寄存器复位值
	@pa=0x64000000,pb=0x100,pc=0,pd=0x02
	@00=无上拉下拉，01=上拉，10=下拉
	@0x10 端口输入数据寄存器(GPIOx_PID)
	@0x14 端口输出数据寄存器(GPIOx_POD)
	@0x18 GPIO 端口位设置/清除寄存器(GPIOx_PBSC)
	@高16位 pbcy = 1 IO低,  低16位 pbsy = 1 IO高
	@0x1c 端口锁定配置寄存器(GPIOx_PLOCK)
	@高16 PLOCKK=1端口配置锁键位被激活
	@低16 PLOCKY=1锁定端口的配置
	@0x20 复用功能低配置寄存器(GPIOx_AFL)
	@0x24复用功能高配置寄存器(GPIOx_AFH)
	@af0=0000,af1=0001,af2=0010,af3=0011...................
	@0x28 端口位清除寄存器(GPIOx_PBC)
	@pbcy=1 清除对应的 PODy 位为 0
	@0x2c 驱动能力配置寄存器(GPIOx_DS)
	@复位值
	@PA=0X55555555,PB=0X55555555,PC=0X54000000,PD=0X55000001
	@00=2mA,01=8mA,10=4mA,11=12mA
	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@PA
	ldr r0, = 0x40023400
	ldr r1, = 0x6b7e555f
	str r1, [r0]
	movw r1, # 0x1e00
	str r1, [r0, # 0x04]
	movw r1, # 0xfeff
	str r1, [r0, # 0x08]
	ldr r1, = 0x24000000
	str r1, [r0, # 0x0c]
	ldr r1, = 0x3
	str r1, [r0, # 0x24]
	@PB
	ldr r0, = 0x40023800
	ldr r1, = 0x5559bd
	str r1, [r0]
	movw r1, # 0xe40
	str r1, [r0, # 0x04]
	movw r1, # 0xffff
	str r1, [r0, # 0x08]
	ldr r1, = 0x55000000
	str r1, [r0, # 0x0c]
	ldr r1, = 0x3102000
	str r1, [r0, # 0x20]
	
__dma_chushihua:
	ldr r0, = 0x40020000
        movs r1, # 0
	str r1, [r0, # 0x08]
	ldr r1, = 0x4002084c
	str r1, [r0, # 0x10]
	ldr r1, = dianyabiao
	str r1, [r0, # 0x14]
	ldr r1, = 4000			@采样数量	sl
	str r1, [r0, # 0x0c]
	movw r1, # 0x35a1 			@0x3581(单次)，0x35a1(循环) 
	str r1, [r0, # 0x08]

        ldr r0, = 0x40020014
	movs r1, # 0
	str r1, [r0, # 0x08]
	ldr r1, = 0x40012c34
	str r1, [r0, # 0x10]
	ldr r1, = zhengxian_100khz
	str r1, [r0, # 0x14]
	ldr r1, = 40
	str r1, [r0, # 0x0c]
	movs r1, # 0x11
	str r1, [r0, # 0x18]
	movw r1, # 0x32b1
	str r1, [r0, # 0x08]
	
__adc_chushihua:
	@采样时间1\128000000（MHZ）*14(周期)= 9142857HZ
	ldr r0, = 0x40020800
	ldr r1, =  0x05
	str r1, [r0, # 0x08]		@开ADC和校准
__deng_adc_jiaozhun:	
	ldr r1, [r0, # 0x08]
	lsls r1, r1, # 29
	bmi __deng_adc_jiaozhun		@等ADC校准
__deng_adc_zhunbeihao:
	ldr r1, [r0, # 0x58]
	lsls r1, r1, # 26
	bpl __deng_adc_zhunbeihao	@等ADC准备好
@	ldr r1, = 0x100000
@	str r1, [r0, # 0x2c]		@几个通道循环
	movs r1, # 0x01			@通道选择
	str r1, [r0, # 0x34]  		
@	movw r1, # 0x100
@	str r1, [r0, # 0x04]		@通道循环采
	ldr r1, = 0x180101	@0X100101  @0x180101
	str r1, [r0, # 0x08]
        str r1, [r0, # 0x08]		@为啥还要开两次。。。



	ldr r0, = lvbo_changdu
	ldr r1, = lvbo_youyi
	movs r2, # 100
	str r2, [r0]
	movs r2, # 13
	str r2, [r1]
	
 @       ldr r0, = 0xe000e010
@	ldr r1, = 127999
@	str r1, [r0, # 4]
@	str r1, [r0, # 8]
@	movs r1, # 0x07
@	str r1, [r0]    @systick 开

	
__tim3chushihua:
	ldr r3, = 0x40000400 @ tim3_cr1
	ldr r2, = 0
	str r2, [r3, # 0x28] @ psc
	ldr r2, = 31                  @639=200KHZ
	str r2, [r3, # 0x2c] @ ARR
	movs r2, # 0x20
	str r2, [r3, # 0x04] @ TRGO
	movs r2, # 0x01
	str r2, [r3, # 0x0c]
	movs r2, # 0x81
__tim1_chushiha:
	ldr r4, = 0x40012c00 @ tim1_cr1
	movs r5, # 0
	str r5, [r4, # 0x28] @ psc
	ldr r5, = 31
	str r5, [r4, # 0x2c] @ ARR
@	movs r2, # 0x20
@	str r2, [r4, # 0x04]	 @TRGO
	movw r5, # 0x200
	str r5, [r4, # 0x0c]
	movs r5, # 0x68
	str r5, [r4, # 0x18]   
	movs r5, # 0x03
	str r5, [r4, # 0x20] @ ccer
	ldr r5, = 0x8000
	str r5, [r4, # 0x44] @ BDTR
	ldr r5, = 0x81
	str r5, [r4]
	str r2, [r3]


__spi_chushihua:
	ldr r0, = 0x40013000	
	movw r1, # 0x436c
	str r1, [r0]

__lcd_chushihua:
	ldr r0,  = 0x40023418
	movw r1, # 0x8000
	str r1, [r0]		@RST=1
	ldr r2, = 0x1ffff
	bl __lcd_yanshi
	
	lsls r1, r1, # 16
	str r1, [r0]		@RST=0
	ldr r2, = 0x1ffff
	bl __lcd_yanshi
	
	lsrs r1, r1, # 16
	str r1, [r0]		@RST=1
	ldr r2, = 0x1ffff
	bl __lcd_yanshi

	ldr r0, = 0x40023818
	movs r1, # 0x10
	lsls r1, r1, # 16
	str r1, [r0]		@RS=0
	ldr r2, = 0x1ffff
	bl __lcd_yanshi

	movs r0, # 0xa2		@ 偏置选择
	bl __xie_spi1
	movs r0, # 0xa0		@SEG方向（横 0=0到131，1=131到0）
	bl __xie_spi1
	movs r0, # 0xc8		@选择COM方向（竖 0=0到63, 1=63到1）
	bl __xie_spi1
	movs r0, # 0x2f		@选择调节率
	bl __xie_spi1
	movs r0, # 0x81		@设置EV命令
	bl __xie_spi1
	movs r0, # 0x25		@设置EV（0x00-0x3f 对比度）
	bl __xie_spi1
	movs r0, # 0x2f		@助推器开启
	bl __xie_spi1		@调节器开、追踪器开
	movs r0, # 0xaf		@显示开
	bl __xie_spi1



	
	bl __lcd_qingping

		
	
ting:

__qiehuan_shangbi1:
	ldr r0, = 0x40023800
	movs r1, # 1
	lsls r1, r1, # 16
	str r1, [r0, # 0x18]

	ldr r0, = 100000
y:
	subs r0, r0, # 1
	bne y
	
	ldr r0, = cos_sin
	ldr r1, = cos_sin_100khz1
	ldr r2, = dft_shuliang
	str r1, [r0]
	movs r1, # 25
	str r1, [r2]
	bl __dft_jisuan1
	mvns r0, r0
	adds r0, r0, # 1
	mvns r1, r1
	adds r1, r1, # 1
	push {r0-r1}
	
	mov r4, r0
	ldr r2, = lvboqizhizhen2
	ldr r0, =lvboqihuanchong2
	bl __lv_bo_qi
	ldr r2, = shangbi_i
	str r0, [r2]

	mov r1, r4
	ldr r2, = lvboqizhizhen3
	ldr r0, =lvboqihuanchong3
	bl __lv_bo_qi
	ldr r2, = shangbi_r
	str r0, [r2]
	
__qiehuan_xiabi1:
	ldr r0, = 0x40023800
	movs r1, # 1
	str r1, [r0, # 0x18]
	ldr r0, = 100000
y1:	
	subs r0, r0, # 1
	bne y1
	ldr r0, = cos_sin
	ldr r1, = cos_sin_100khz1
	ldr r2, = dft_shuliang
	str r1, [r0]
	movs r1, # 25
	str r1, [r2]
	bl __dft_jisuan1
	push {r0-r1}
	mov r4, r0
	ldr r2, = lvboqizhizhen
	ldr r0, =lvboqihuanchong
	bl __lv_bo_qi
	ldr r2, = xiabi_i
	str r0, [r2]

	mov r1, r4
	ldr r2, = lvboqizhizhen1
	ldr r0, =lvboqihuanchong1
	bl __lv_bo_qi
	ldr r2, = xiabi_r
	str r0, [r2]

	bl __jisuan_zukang
	
	pop {r0-r3}
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	ldr r4, = xiabi_rr
	str r0, [r4]
	str r1, [r4, # 0x04]
	str r2, [r4, # 0x08]
	str r3, [r4, # 0x0c]
	bl __jisuan_z_fudu1
	mov r6, r0

	ldr r0, = shangbi_r
	ldr r1, = shangbi_i
	ldr r2, = xiabi_r
	ldr r3, = xiabi_i
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	ldr r3, [r3]
	asrs r0, r0, # 3
	asrs r1, r1, # 3
	asrs r2, r2, # 3
	asrs r3, r3, # 3
	bl __jisuan_z_fudu
	mov r1, r0
	subs r0, r0, r6
	bpl __kuaiman_jiance
	subs r0, r6, r1
__kuaiman_jiance:
	cmp r0, # 20
	bhi __kuaisu
	b __mansu

__mansu:
	

	bl __xianshi_shangxia_bi


	bl __jisuan_zukang
	bl __xianshi_zukang
	b ting
	
	
	
	@	ldr r0, = 0x20000200
	@	ldrh r0, [r0]
@	mov r0, r1
@	movs r1, # 6
@	ldr r2, = asciibiao
@	movs r3, # 0xff            @小数点位置
@	bl _zhuanascii
@	movs r0, # 6            @写几个字
@	movs r1, # 48           @字库单字长度
@	movs r2, # 3            @宽度
@	movw r3, # 0x1102              @lcd位置
@	bl __xie_lcd_ascii
@	b ting
__kuaisu:
	ldr r0, = shangbi_rr
	ldr r1, = shangbi_ii
	ldr r2, = xiabi_rr
	ldr r3, = xiabi_ii
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	ldr r3, [r3]
	ldr r4, = shangbi_r
	ldr r5, = shangbi_i
	ldr r6, = xiabi_r
	ldr r7, = xiabi_i
	str r0, [r4]
	str r1, [r5]
	str r2, [r6]
	str r3, [r7]

	bl __xianshi_shangxia_bi
	bl __jisuan_zukang
	bl __xianshi_zukang
	b ting
	
	mov r0, r6
        movs r1, # 6
	ldr r2, = asciibiao
	movs r3, # 0xff            @小数点位置
	bl _zhuanascii
	movs r0, # 6            @写几个字
	movs r1, # 48           @字库单字长度
	movs r2, # 3            @宽度
	movw r3, # 0x1105              @lcd位置
	bl __xie_lcd_ascii
	b ting
	
	bl __jisuan_zukang
	bl __xianshi_zukang
	b ting

	ldr r0, = 0x40020800
	ldrh r0, [r0, # 0x4c]
	movs r1, # 5             @转换几个字符
	ldr r2, = asciibiao
	movs r3, # 0xff             @小数点位置
	bl __zhuanascii
	ldr r0, = asciibiao
	movs r1, # 5           @显示几个字符
	movw r2, # 0x00         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii

	ldr r0, = 0x40023800
	ldr r3, = 0x20000100
	ldr r4, [r3]
	cmp r4, # 1
	bne __shangbi_kai
__xiabi_kai:
	movs r1, # 1
	str r1, [r0, # 0x18]
	b ting

	
	ldr r1, = 0x20000104
	ldr r2, [r1]
	adds r2, r2, # 1
	str r2, [r1]
	cmp r2, # 100
	bls ting
	movs r2, # 0
	str r2, [r1]
	movs r1, # 0
	str r1, [r3]
	b ting
__shangbi_kai:	
	movs r1, # 1
@	lsls r1, r1, # 16
	str r1, [r0, # 0x18]
	b ting
	
	ldr r1, = 0x20000104
	ldr r2, [r1]
	adds r2, r2, # 1
	str r2, [r1]
	cmp r2, # 100
	bls ting
	movs r2, # 0
	str r2, [r1]
	movs r1, # 1
	str r1, [r3]
	b ting

__xianshi_zukang:
	push {r0-r6,lr}
        ldr r0, = z_r
	ldr r1, = z_i
	ldr r0, [r0]
	ldr r5, [r1]
	movs r6, r0
	bmi __z_r_shi_fu
__z_r_bushi_fu:
	ldr r0, = kong
	movs r1, # 1           @显示几个字符
	movw r2, # 0x00         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii
	b __xianshi_z_r
__z_r_shi_fu:
	ldr r0, = fu
	movs r1, # 1           @显示几个字符
	movw r2, # 0x00         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii
	mvns r6, r6
	adds r6, r6, # 1
__xianshi_z_r:
	mov r0, r6
        movs r1, # 6
	ldr r2, = asciibiao
	movs r3, # 3            @小数点位置
	bl _zhuanascii
	movs r0, # 6            @写几个字
	movs r1, # 48           @字库单字长度
	movs r2, # 3            @宽度
	movw r3, # 0x1102              @lcd位置
	bl __xie_lcd_ascii
	

	movs r6, r5
	bmi __z_i_shi_fu
__z_i_bushi_fu:
	ldr r0, = kong
	movs r1, # 1           @显示几个字符
	movw r2, # 0x4200         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii
	b __xianshi_z_i
__z_i_shi_fu:
	ldr r0, = fu
	movs r1, # 1           @显示几个字符
	movw r2, # 0x4200         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii
	mvns r6, r6
	adds r6, r6, # 1
__xianshi_z_i:
	mov r0, r6
        movs r1, # 6
	ldr r2, = asciibiao
	movs r3, # 3            @小数点位置
	bl _zhuanascii
	movs r0, # 6            @写几个字
	movs r1, # 48           @字库单字长度
	movs r2, # 3            @宽度
	movw r3, # 0x1105              @lcd位置
	bl __xie_lcd_ascii
	pop {r0-r6,pc}
	

__jisuan_z_fudu:
	@入口R0=a，R1=b，R2=c，R3=d
	push {r4,lr}
	bl __ji_suan_fu_du
	mov r4, r0
	mov r0, r2
	mov r1, r3
	bl __ji_suan_fu_du
	ldr r2, = 1000
	muls r4, r4, r2
	udiv r0, r4, r0
	pop {r4,pc}

__jisuan_z_fudu1:
	@入口R0=c，R1=d，R2=a，R3=b
	push {r4,lr}
	bl __ji_suan_fu_du
	mov r4, r0
	mov r0, r2
	mov r1, r3
	bl __ji_suan_fu_du
	ldr r2, = 1000
	muls r0, r0, r2
	udiv r0, r0, r4
	pop {r4,pc}
	
	
__jisuan_zukang:
	push {r0-r4,r6-r7,lr}
@	ldr r0, = zukang_dianzu_biao
@	ldr r1, = liangcheng
@	ldr r1, [r1]
@	lsls r1, r1, # 2
	@	ldr r4, [r0, r1]
	ldr r4, = 10000
	
	ldr r0, = shangbi_r
	ldr r1, = shangbi_i
	ldr r2, = xiabi_r
	ldr r3, = xiabi_i
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	ldr r3, [r3]
	lsls r0, r0, # 10
	lsls r1, r1, # 10
	lsls r2, r2, # 10
	lsls r3, r3, # 10
	bl __fushu_chufa
	mov r6, r0
	mov r7, r1
	mov r3, r1
	mov r1, r4
	movs r2, # 0
	movs r0, r0
	bpl __z_r_cheng_dianzu
	movs r2, # 1
	mvns r0, r0
	adds r0, r0, # 1
__z_r_cheng_dianzu:
	bl __chengfa
	lsls r0, r0, # 17
	lsrs r1, r1, # 15
	orrs r1, r1, r0
	cmp r2, # 1
	bne __z_i_jiance
	mvns r1, r1
	adds r1, r1, # 1
__z_i_jiance:
	mov r0, r3
	mov r3, r1
	mov r1, r4
	movs r2, # 0
	movs r0, r0
	bpl __z_i_cheng_dianzu
	movs r2, # 1
	mvns r0, r0
	adds r0, r0, # 1
__z_i_cheng_dianzu:
	bl __chengfa
	lsls r0, r0, # 17
	lsrs r1, r1, # 15
	orrs r0, r0, r1
	cmp r2, # 1
	bne __jisuan_zukang_fanhui
	mvns r0, r0
	adds r0, r0, # 1
__jisuan_zukang_fanhui:
	mov r1, r3
	ldr r2, = z_r
	ldr r3, = z_i
	str r1, [r2]
	str r0, [r3]
	mov r0, r6
	mov r1, r7
	bl __suan_atan2
	movs r1, # 100
	muls r0, r0, r1
	asrs r0, r0, # 15
	ldr r3, = 18000
	cmp r0, r3
	bls __bao
	ldr r3, = 36000
	subs r0, r0, r3
__bao:
	ldr r2, = z_jiao_du
	str r0, [r2]
	pop {r0-r4,r6-r7,pc}


	
__lv_bo_qi:
	@地址顺序：指针，累加值，缓冲区
	@入口R0=缓冲区，R1=数据, r2,=指针
	@出口R0
	push {r3-r7,lr}
	ldr r4, = lvbo_changdu
	ldr r7, = lvbo_youyi
	ldr r4, [r4]
	ldr r7, [r7]
	ldr r5, [r2]
	mov r3, r5
	lsls r3, r5, # 2
	ldr r6, [r0, r3]
	str r1, [r0, r3]
	adds r5, r5, # 1
	str r5, [r2]
	cmp r5, r4
	bne __huanchong_leijia
	movs r5, # 0
	str r5, [r2]
__huanchong_leijia:
	subs r0, r0, # 4
	ldr r5, [r0]
	adds r1, r1, r5
	subs r1, r1, r6
	str r1, [r0]
	asrs r1, r1, r7	 @# 12 @12 @  7	@128
	mov r0, r1
	pop {r3-r7,pc}
	.ltorg

	
__xianshi_shangxia_bi:
	push {r0-r12,lr}
	ldr r0, = shangbi_r
	ldr r1, = shangbi_i
	ldr r0, [r0]
	ldr r7, [r1]
	movs r6, r0
	bmi __shangbi_r_shi_fu
__shangbi_r_bushi_fu:
	ldr r0, = kong
	movs r1, # 1           @显示几个字符
	movw r2, # 0x00         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii
	b __xianshi_shangbi_r
__shangbi_r_shi_fu:
	ldr r0, = fu
	movs r1, # 1           @显示几个字符
	movw r2, # 0x00         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii
	mvns r6, r6
	adds r6, r6, # 1
__xianshi_shangbi_r:
	mov r0, r6
	movs r1, # 8             @转换几个字符
	ldr r2, = asciibiao
	movs r3, # 0xff             @小数点位置
	bl __zhuanascii
	ldr r0, = asciibiao
	movs r1, # 8           @显示几个字符
	movw r2, # 0x800         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii

        movs r6, r7
	bmi __shangbi_i_shi_fu
__shangbi_i_bushi_fu:
	ldr r0, = kong
	movs r1, # 1           @显示几个字符
	movw r2, # 0x4200         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii
	b __xianshi_shangbi_i
__shangbi_i_shi_fu:
	ldr r0, = fu
	movs r1, # 1           @显示几个字符
	movw r2, # 0x4200         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii
	mvns r6, r6
	adds r6, r6, # 1
__xianshi_shangbi_i:
	mov r0, r6
	movs r1, # 8             @转换几个字符
	ldr r2, = asciibiao
	movs r3, # 0xff             @小数点位置
	bl __zhuanascii
	ldr r0, = asciibiao
	movs r1, # 8           @显示几个字符
	movw r2, # 0x4a00         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii

        ldr r0, = xiabi_r
	ldr r1, = xiabi_i
	ldr r0, [r0]
	ldr r7, [r1]
	movs r6, r0
	bmi __xiabi_r_shi_fu
__xiabi_r_bushi_fu:
	ldr r0, = kong
	movs r1, # 1           @显示几个字符
	movw r2, # 0x01         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii
	b __xianshi_xiabi_r
__xiabi_r_shi_fu:
	ldr r0, = fu
	movs r1, # 1           @显示几个字符
	movw r2, # 0x01         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii
	mvns r6, r6
	adds r6, r6, # 1
__xianshi_xiabi_r:
	mov r0, r6
	movs r1, # 8             @转换几个字符
	ldr r2, = asciibiao
	movs r3, # 0xff             @小数点位置
	bl __zhuanascii
	ldr r0, = asciibiao
	movs r1, # 8           @显示几个字符
	movw r2, # 0x801         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii

	movs r6, r7
	bmi __xiabi_i_shi_fu
__xiabi_i_bushi_fu:
	ldr r0, = kong
	movs r1, # 1           @显示几个字符
	movw r2, # 0x4201         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii
	b __xianshi_xiabi_i
__xiabi_i_shi_fu:
	ldr r0, = fu
	movs r1, # 1           @显示几个字符
	movw r2, # 0x4201         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii
	mvns r6, r6
	adds r6, r6, # 1
__xianshi_xiabi_i:
	mov r0, r6
	movs r1, # 8             @转换几个字符
	ldr r2, = asciibiao
	movs r3, # 0xff             @小数点位置
	bl __zhuanascii
	ldr r0, = asciibiao
	movs r1, # 8           @显示几个字符
	movw r2, # 0x4a01         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii
	
	pop {r0-r12,pc}

	

__ceshi_dft_shijian:
	ldr r0, = 0xe000e010
	ldr r1, = 0xffffff
	str r1, [r0, # 4]
	str r1, [r0, # 8]
	movs r1, # 0x07
	str r1, [r0]    @systick 开

	ldr r0, = cos_sin
	ldr r1, = cos_sin_100khz
	str r1, [r0]
	ldr r0, = dft_shuliang
	movs r1, # 50
	str r1, [r0]
	bl __dft_jisuan

	ldr r0, = 0xe000e018
	ldr r10, [r0]
	bkpt # 1
	

__lcd_xianshi_shuju_shiyan:	
	ldr r0, = 12345
	movs r1, # 6
	ldr r2, = asciibiao
	movs r3, # 4            @小数点位置
	bl _zhuanascii
	movs r0, # 6            @写几个字
	movs r1, # 48           @字库单字长度
	movs r2, # 3            @宽度
	movw r3, # 0x1100              @lcd位置
	bl __xie_lcd_ascii
	
	ldr r0, = 12345
	movs r1, # 6
	ldr r2, = asciibiao
	movs r3, # 4            @小数点位置
	bl _zhuanascii
	movs r0, # 6            @写几个字
	movs r1, # 48           @字库单字长度
	movs r2, # 3            @宽度
	movw r3, # 0x1103              @lcd位置
	bl __xie_lcd_ascii
	
	
	ldr r0, = 41
	movs r1, # 2             @两个字符
	ldr r2, = asciibiao
	movs r3, # 0xff
	bl _zhuanascii
	movs r0, # 2            @写几个字
	movs r1, # 45           @字库单字长度
	movs r2, # 3            @宽度
	movw r3, # 0x6500              @lcd位置(高8位0-0x83,低8位0-7)
	ldr r4, = danweibiao
	bl __xie_alabo
	
	
	ldr r0, = 07
	movs r1, # 2             @转换几个字符
	ldr r2, = asciibiao
	movs r3, # 0xff
	bl _zhuanascii
	movs r0, # 2            @写几个字
	movs r1, # 45           @字库单字长度
	movs r2, # 3            @宽度
	movw r3, # 0x6503              @lcd位置(高8位0-0x83,低8位0-7)
	ldr r4, = danweibiao
	bl __xie_alabo

	ldr r0, = yjmwxwx
	movs r1, # 7
	movw r2, # 0x06
	bl __xie_ascii
	
        ldr r0, = 123456789
	movs r1, # 10             @转换几个字符
	ldr r2, = asciibiao
	movs r3, # 3		 @小数点位置
	bl __zhuanascii
	ldr r0, = asciibiao	 
	movs r1, # 10		@显示几个字符
	movw r2, # 0x07		@LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii
	bx lr
	.ltorg

	
__dft_jisuan1:	 
	@出口R0=实部，R1=虚部
	push {r2-r12,lr}
	ldr r0, = sp_zhizhen
	str sp, [r0]
	ldr sp, = cos_sin
	ldr sp, [sp]
	ldr r12, = dianyabiao          @dianyabiao
	movs r10, # 0
	movs r11, # 0
__dft_xunhuan1:
	@0 (4 ge)
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@1
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@2
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@3
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@4
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@5
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@6
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@7
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@8
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@9
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@0 (4 ge)
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@1
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@2
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@3
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@4
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@5
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@6
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@7
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@8
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@9
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9


	@0 (4 ge)
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@1
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@2
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@3
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@4
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@5
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@6
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@7
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@8
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@9
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9


	@0 (4 ge)
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@1
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@2
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@3
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@4
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@5
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@6
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@7
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@8
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	@9
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9





	ldr sp, = cos_sin
	ldr sp, [sp]
	ldr r0, = dft_shuliang
	ldr r1, [r0]
	subs r1, r1, # 1
	str r1, [r0]
	cmp r1, # 0
	bne __dft_xunhuan1


	mov r0, r10
	mov r1, r11
	ldr r2, = sp_zhizhen
	ldr sp, [r2]
	pop {r2-r12,pc}
	
	.ltorg
	

__dft_jisuan:	@0.86毫秒6400点
	@出口R0=实部，R1=虚部
	push {r2-r12,lr}
	ldr r0, = sp_zhizhen
	str sp, [r0]
	ldr sp, = cos_sin
	ldr sp, [sp]
	ldr r12, = dianyabiao          @dianyabiao
	movs r10, # 0
	movs r11, # 0
__dft_xunhuan:
	@0 (4 ge)
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@ 1
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@2
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@3
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@4
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@5
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@6
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@7
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@8
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@9
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@10
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@11
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@12
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@13
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@14
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@15
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@@@@@@@@@@
	@@@64@@@@@@
	@@@@@@@@@@

	@0 (4 ge)
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@ 1
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@2
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@3
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@4
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@5
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@6
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@7
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@8
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@9
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@10
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@11
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@12
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@13
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@14
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	@15
	pop {r2-r9}
	ldmia r12!, {r0-r1}
	mov lr, r0
	lsrs lr, lr, # 16
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	mul r2, r2, lr
	mul r3, r3, lr
	mul r4, r4, r0
	mul r5, r5, r0
	mov lr, r1
	lsrs lr, lr, # 16
	lsls r1, r1, # 16
	lsrs r1, r1, # 16
	mul r6, r6, lr
	mul r7, r7, lr
	mul r8, r8, r1
	mul r9, r9, r1
	asrs r2, r2, # 13
	asrs r3, r3, # 13
	asrs r4, r4, # 13
	asrs r5, r5, # 13
	asrs r6, r6, # 13
	asrs r7, r7, # 13
	asrs r8, r8, # 13
	asrs r9, r9, # 13
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9

	ldr sp, = cos_sin
	ldr sp, [sp]
	ldr r0, = dft_shuliang
	ldr r1, [r0]
	subs r1, r1, # 1
	str r1, [r0]
	cmp r1, # 0
	bne __dft_xunhuan
	
	
	mov r0, r10
	mov r1, r11
	ldr r2, = sp_zhizhen
	ldr sp, [r2]
	pop {r2-r12,pc}
	.ltorg
__xie_spi1:
	push {r4-r5,lr}
	ldr r4, = 0x40013000
	bl __spi_mang
	strb r0, [r4,0x0c]
	movw r4, # 0x9f
__xie_spi1_yanshi:
	subs r4, r4, # 1
	bne __xie_spi1_yanshi
	pop {r4-r5,pc}
	
__spi_mang:
	ldr r5, [r4,0x08]
	lsls r5, r5, # 24
	bmi __spi_mang
	bx lr

__xie_lcd_ye:
	@入口R0=数据首地址
	push {r1-r4,lr}
	movs r3, # 0xb0
	subs r3, r3, # 1
	mov r4, r0
__ye_jia:
	ldr r0, = 0x40023818
	movs r1, # 0x10
	lsls r1, r1, # 16
	str r1, [r0]            @RS=0
	ldr r2, = 0xff
	bl __lcd_yanshi
	adds r3, r3, # 1
	cmp r3, # 0xb9
	bne __xie_ye_dizhi
	pop {r1-r4,pc}
	@       movs r3, # 0xb0
	@       mvns r4, r4
	@       lsls r4, r4, # 24
	@       lsrs r4, r4, # 24
__xie_ye_dizhi:
	movs r0, # 0x10
	bl __xie_spi1
	movs r0, # 0
	bl __xie_spi1
	mov r0, r3
	bl __xie_spi1

	ldr r0, = 0x40023818
	movs r1, # 0x10
	str r1, [r0]            @RS=1
	ldr r2, = 0xff
	bl __lcd_yanshi

	movs r1, # 132
__heng_sao:
	ldrb r0, [r4]
	@       mov r0, r4
	bl __xie_spi1
	adds r4, r4, # 1
	subs r1, r1, # 1
	bne __heng_sao
	b __ye_jia
__lcd_yanshi:
	subs r2, r2, # 1
	bne __lcd_yanshi
	bx lr
	
__lcd_qingping:
	push {r0-r4,lr}
	movs r3, # 0xb0
	subs r3, r3, # 1
	mov r4, # 0
__ye_jia1:
	ldr r0, = 0x40023818
	movs r1, # 0x10
	lsls r1, r1, # 16
	str r1, [r0]            @RS=0
	ldr r2, = 0xff
	bl __lcd_yanshi
	adds r3, r3, # 1
	cmp r3, # 0xb9
	bne __xie_ye_dizhi1
	pop {r0-r4,pc}
__xie_ye_dizhi1:
	movs r0, # 0x10
	bl __xie_spi1
	movs r0, # 0
	bl __xie_spi1
	mov r0, r3
	bl __xie_spi1

	ldr r0, = 0x40023818
	movs r1, # 0x10
	str r1, [r0]            @RS=1
	ldr r2, = 0xff
	bl __lcd_yanshi
	movs r1, # 132
__heng_sao1:
	mov r0, r4
	bl __xie_spi1
	subs r1, r1, # 1
	bne __heng_sao1
	b __ye_jia1

	
__xie_lcd_weizhi:
	@入口R0=要写的地址(低8=X，高8=Y=（0-131(r5=高4,R4=低4))
	push {r1-r5,lr}
	mov r5, r0
	mov r4, r0
	lsls r0, r0, # 24
	lsrs r0, r0, # 24
	lsrs r5, r5, # 12	@高4
	lsls r4, r4, # 20
	lsrs r4, r4, # 28
        ldr r1, = 0x40023818
	movs r3, # 0x10
	lsls r3, r3, # 16
	str r3, [r1]            @RS=0
	ldr r2, = 0xff
	bl __lcd_yanshi
	adds r0, r0, # 0xb0     @写页命令0XB0
	bl __xie_spi1		@写页地址0-8页
	
	movs r0, # 0x10
	orrs r0, r0, r5
	bl __xie_spi1
	
	mov r0, r4
	bl __xie_spi1
	movs r3, # 0x10
	str r3, [r1]            @RS=1
	ldr r2, = 0xff
	bl __lcd_yanshi
	pop {r1-r5,pc}


__xie_ascii:
	push {r5-r10,lr}
	@入口r0=ascii地址
	@r1=写几个字
	@r2=要写的地址
	mov r9, r2
	mov r7, r1
	mov r1, # 6
	movs r2, # 1
	mov r5, r0
	movs r6, # 0
	mov r8, r2
	mul r8, r8, r1
__xie_lcd_dizhi2:
	mov r0, r9
	bl __xie_lcd_weizhi
__du_ascii2:
	ldrb r0, [r5, r6]
	subs r0, r0, # 32
	muls r0, r0, r1
	ldr r3, = ascii_biao
	add r3, r3, r0
__du_ziku_chushihua2:
	movs r4, # 0
__du_ziku1:
	ldrb r0, [r3, r4]
	add r4, r4, r2
	cmp r4, r1
	bhi __duwan_ziku1
	bl __xie_spi1
	b __du_ziku1
__duwan_ziku1:
	adds r6, r6, # 1
	cmp r6, r7
	bne __du_ascii2
	pop {r5-r10,pc}


	
__xie_alabo:
	push {r5-r11,lr}
	@入口r0=写几个字
	@r1=字库单字长度
	@r2=y宽（几行）
	@r3=要写的地址
	ldr r5, = asciibiao
	mov r12, r4
	mov r9, r3
	movs r6, # 0
	mov r7, r6
	mov r10, r0
	mov r11, r2
	mov r8, r2
	mul r8, r8, r1
__xie_lcd_dizhi1:
	mov r0, r9
	bl __xie_lcd_weizhi
__du_ascii1:
	ldrb r0, [r5, r6]
	muls r0, r0, r1
	mov r3, r12
	add r3, r3, r0
	adds r3, r3, r7
__du_ziku_chushihua1:
	movs r4, # 0
__du_ziku:
	ldrb r0, [r3, r4]
	add r4, r4, r2
	cmp r4, r1
	bhi __duwan_ziku
	bl __xie_spi1
	b __du_ziku
__duwan_ziku:
	adds r6, r6, # 1
	cmp r6, r10
	bne __du_ascii1
	movs r6, # 0
	adds r7, r7, # 1        @字库地址偏移
	adds r9, r9, # 1        @Y偏移
	cmp r7, r11
	bne __xie_lcd_dizhi1
	pop {r5-r11,pc}
	


	
__xie_lcd_ascii:
	push {r4-r12,lr}
	@入口r0=写几个字
	@r1=字库单字长度
	@r2=y宽（几行）
	@r3=要写的地址
	ldr r5, = asciibiao
	mov r9, r3
	movs r6, # 0
	mov r7, r6
	mov r12, r6
	mov r10, r0
	mov r11, r2
	mov r8, r2
	mul r8, r8, r1
__xie_lcd_dizhi:
	mov r0, r9
	bl __xie_lcd_weizhi
__du_ascii:
	ldrb r0, [r5, r6]
	cmp r0, # 0x2e
	beq __xie_ascii_xiaoshudian
	muls r0, r0, r1
	
	ldr r3, = da_a_labo_hack  @da_a_labo_shuzi
	add r3, r3, r0
	adds r3, r3, r7
__du_ziku_16_chushihua:
	movs r4, # 0
__du_ziku_16:
	ldrb r0, [r3, r4]
	add r4, r4, r2
	cmp r4, r1
	bhi __duwan_16
	bl __xie_spi1
	b __du_ziku_16
__duwan_16:
	adds r6, r6, # 1
	cmp r6, r10
	bne __du_ascii
	movs r6, # 0
	adds r7, r7, # 1	@字库地址偏移
	adds r9, r9, # 1	@Y偏移
	cmp r7, r11	
	bne __xie_lcd_dizhi
	pop {r4-r12,pc}
__xie_ascii_xiaoshudian:
	add r12, r12, # 1
	cmp r12, r2
	beq __xie_ru_xiaoshudian
	movs r0, # 0
	bl __xie_spi1
	movs r0, # 0
	bl __xie_spi1
        movs r0, # 0
	bl __xie_spi1
	movs r0, # 0
	bl __xie_spi1
	
	b __duwan_16
__xie_ru_xiaoshudian:	
	movs r0, # 0
	bl __xie_spi1
	movs r0, # 0x70
	bl __xie_spi1
	movs r0, # 0x70
	bl __xie_spi1
	movs r0, # 0x70
        bl __xie_spi1
	b __duwan_16
	
_zhuanascii:							@ 16进制转ASCII
	@ R0要转的数据， R1长度，R2结果表首地址, r3=小数点位置
	push {r4-r7,lr}
	mov r7, r3
	mov r5, r0
	mov r6, r1
	movs r1, # 10
_xunhuanqiuma:
	udiv r0, r0, r1
	mov r4, r0
	muls r4, r1
	subs r3, r5, r4
@	adds r3, r3, # 0x30	@ascii偏移
	mov r5, r0
	subs r6, r6, # 1
	beq _qiumafanhui
	cmp r6, r7
	bne _meidaoxiaoshudian
	movs r4, # 0x2e		@小数点
	strb r4, [r2,r6]	@插入小数点
	subs r6, r6, # 1
_meidaoxiaoshudian:
	strb r3, [r2,r6]
	movs r6, r6
	bne _xunhuanqiuma
	pop {r4-r7,pc}
_qiumafanhui:
	strb r3, [r2, r6]
	pop {r4-r7,pc}

__zhuanascii:	              @ 转ASCII
	@ R0要转的数据， R1长度，R2结果表首地址, r3=小数点位置
	push {r4-r7,lr}
	mov r7, r3
	mov r5, r0
	mov r6, r1
	movs r1, # 10
__xunhuanqiuma:
	udiv r0, r0, r1
	mov r4, r0
	muls r4, r1
	subs r3, r5, r4
	adds r3, r3, # 0x30     @ascii偏移
	mov r5, r0
	subs r6, r6, # 1
	beq __qiumafanhui
	cmp r6, r7
	bne __meidaoxiaoshudian
	movs r4, # 0x2e         @小数点
	strb r4, [r2,r6]        @插入小数点
	subs r6, r6, # 1
__meidaoxiaoshudian:
	strb r3, [r2,r6]
	movs r6, r6
	bne __xunhuanqiuma
	pop {r4-r7,pc}
__qiumafanhui:
	strb r3, [r2, r6]
	pop {r4-r7,pc}
	
___suan_atan2:
	@入口R0=实部，R1=虚部
	@出口R0=角度
	push {r2-r6,lr}
	ldr r6, = atan_biao
	movs r2, # 0
	mov r3, r2
	movs r0, r0
	bpl ___panduan_xubu
	ldr r2, = 5898240
	mvns r0, r0
	mvns r1, r1
	adds r0, r0, # 1
	adds r1, r1, # 1
___panduan_xubu:
	movs r1, r1
	bpl __suan_atan2_xunhuan
	ldr r2, = 11796480
___suan_atan2_xunhuan:
	movs r1, r1
	bpl ___atan2_zhengzhuan
	mov r4, r0	@x
	mov r5, r1	@y
	asrs r5, r5, r3
	asrs r4, r4, r3
	subs r0, r0, r5
	adds r1, r1, r4
	mov r4, r3
	lsls r4, r4, # 2
	ldr r4, [r6, r4]
	subs r2, r2, r4
	b ___atan2_xuanzhuan
___atan2_zhengzhuan:
	mov r4, r0	@x
	mov r5, r1	@y
	asrs r5, r5, r3
	asrs r4, r4, r3
	adds r0, r0, r5
	subs r1, r1, r4
	mov r4, r3
	lsls r4, r4, # 2
	ldr r4, [r6, r4]
	adds r2, r2, r4
___atan2_xuanzhuan:
	adds r3, r3, # 1
	cmp r3, # 21
	bne ___suan_atan2_xunhuan
	mov r1, r0
	mov r0,r2
	pop {r2-r6,pc}

__chengfa:
	@入R0 乘以 R1
	@出 R0高32 ， R1低32
	@0xffffffff*0xffffffff
	@4        F F F E 0 0 0 1                       @4
	@3                F F F E 0 0 0 1               @3
	@2                F F F E 0 0 0 1               @2
	@1                        F F F E 0 0 0 1       @1
	@         F F F F F F F E 0 0 0 0 0 0 0 1
	push {r2-r7,lr}
	cmp r0, # 0
	beq __cheng_fa_fan_hui
	cmp r1, # 0
	beq __cheng_fa_fan_hui
__ji_suan_cheng_fa:
	mov r2, r0
	mov r3, r1
	lsrs r0, r0, # 16       @高16
	lsls r2, r2, # 16       @ 低16
	lsrs r2, r2, # 16
	lsrs r1, r1, # 16       @高16
	lsls r3, r3, # 16       @低16
	lsrs r3, r3, # 16
	mov r4, r2
	mov r5, r0
	muls r2, r2, r3         @1
	muls r0, r0, r3         @2
	muls r4, r4, r1         @3
	muls r5, r5, r1         @4
	mov r6, r0
	mov r7, r4
	lsls r0, r0, # 16       @2低32
	lsls r4, r4, # 16       @3低32
	lsrs r6, r6, # 16       @2高32
	lsrs r7, r7, # 16       @3高32
	movs r1, # 0
	adds r2, r2, r0         @低32
	adcs r6, r6, r1         @高32
	adds r2, r2, r4
	adcs r6, r6, r7
	adds r6, r6, r5
	mov r0, r6
	mov r1, r2
	pop {r2-r7,pc}
__cheng_fa_fan_hui:
	movs r0, # 0
	movs r1, # 0
	pop {r2-r7,pc}

__ji_suan_fu_du:		    @ 计算幅度
	@ 入r0= 实部，r1= 虚部
	@ 出r0 = 幅度
	@ Mag ~=Alpha * max(|I|, |Q|) + Beta * min(|I|, |Q|)
	@ Alpha * Max + Beta * Min
	push {r1-r4,lr}
	movs r0, r0
	bpl _shibubushifushu
	mvns r0, r0                             @ 是负数转成正数
	adds r0, r0, # 1
_shibubushifushu:		                               @ 实部不是负数
	movs r1, r1
	bpl _xububushifushu
	mvns r1, r1                             @ 是负数转成正数
	adds r1, r1, # 1
_xububushifushu:		                                @ 虚部不是负数
	cmp r0, # 0
	bne _panduanxubushibushi0
	mov r0, r1
	pop {r1-r4,pc}
_panduanxubushibushi0:
	cmp r1, # 0
	bne _jisuanfudu1
	pop {r1-r4,pc}
_jisuanfudu1:
	ldr r2, = 31066		@ Alpha q15 0.948059448969 @
	ldr r3, = 12868		@ Beta q15 0.392699081699
	cmp r1, r0
	bhi _alpha_min_beta_max
_alpha_max_beta_min:
	mov r4, r1
	mov r1, r2
	bl __chengfa
	lsls r0, r0, # 17
	lsrs r1, r1, # 15
	orrs r0, r0, r1
	mov r2, r0

	mov r0, r3
	mov r1, r4
	bl __chengfa
	lsls r0, r0, # 17
	lsrs r1, r1, # 15
	orrs r1, r1, r0
	mov r0, r2

	@	muls r0, r0, r2
	@	muls r1, r1, r3
	@	asrs r0, r0, # 15
	@	asrs r1, r1, # 15
	adds r0, r0, r1
	movs r1, # 1
	pop {r1-r4,pc}
_alpha_min_beta_max:
	mov r4, r1
	mov r1, r3
	bl __chengfa
	lsls r0, r0, # 17
	lsrs r1, r1, # 15
	orrs r0, r0, r1
	mov r3, r0

	mov r0, r2
	mov r1, r4
	bl __chengfa
	lsls r0, r0, # 17
	lsrs r1, r1, # 15
	orrs r1, r1, r0
	mov r0, r3

	@	muls r0, r0, r3
	@	muls r1, r1, r2
	@	asrs r0, r0, # 15
	@	asrs r1, r1, # 15
	adds r0, r0, r1
	movs r1, # 0
	pop {r1-r4,pc}

	.ltorg
__suan_cos_sin:
	@入口R0=0*32768到360*32768
	@出口R0=COS，R1=SIN
	@增益 32768*0.6072529350088812561694
	push {r2-r7,lr}
	ldr r1, = 0x4dba
	ldr r2, = 2949120	@90
	ldr r3, = 8847360	@270
	ldr r7, = atan_biao
	movs r5, # 0
	mov r6, r5
	cmp r0, r2
	bhi __dayu_90
	movs r4, # 0
	b __suan_cos_sin_xunhuan
__dayu_90:
	cmp r0, r3
	bhi __dayu_270
	ldr r4, = 5898240	@180
	b __suan_cos_sin_xunhuan
__dayu_270:
	ldr r4, = 11796480 	@360
__suan_cos_sin_xunhuan:
	mov r3, r4
	mov r2, r0
	subs r2, r2, r3
	bmi __zhengzhuan
__fanzhuan:
	mov r3, r6
	mov r2, r1
	asrs r6, r6, r5
	subs r2, r2, r6	@x
	asrs r1, r1, r5
	mov r6, r5
	lsls r6, r6, # 2
	ldr r6, [r7, r6]
	adds r3, r3, r1	@y
	adds r4, r4, r6	@jiaodu
	b __cordic_xuanzhuan
__zhengzhuan:
	mov r3, r6
	mov r2, r1
	asrs r6, r6, r5
	adds r2, r2, r6	@x
	asrs r1, r1, r5
	mov r6, r5
	lsls r6, r6, # 2
	ldr r6, [r7, r6]
	subs r3, r3, r1	@y
	subs r4, r4, r6	@jiaodu
__cordic_xuanzhuan:
	mov r1, r2
	mov r6, r3
	adds r5, r5, # 1
	cmp r5, # 21
	bne __suan_cos_sin_xunhuan
	ldr r6, = 2949120	@90
	ldr r7, = 8847360      @270
	cmp r0, r6
	bls __suan_cos_sin_fanhui
	cmp r0, r7
	bcs __suan_cos_sin_fanhui
	mvns r2, r2
	mvns r3, r3
	adds r2, r2, # 1
	adds r3, r3, # 1
__suan_cos_sin_fanhui:
	mov r1, r3
	mov r0, r2
	pop {r2-r7,pc}
	.ltorg


	
__suan_atan2:
	@入口R0=实部，R1=虚部
	@出口R0=角度
	push {r2-r6,lr}
	ldr r6, = atan_biao
	movs r2, # 0
	mov r3, r2
	movs r0, r0
	bpl __panduan_xubu
	ldr r2, = 5898240
	mvns r0, r0
	mvns r1, r1
	adds r0, r0, # 1
	adds r1, r1, # 1
__panduan_xubu:
	movs r1, r1
	bpl __suan_atan2_xunhuan
	ldr r2, = 11796480
__suan_atan2_xunhuan:
	movs r1, r1
	bpl __atan2_zhengzhuan
	mov r4, r0	@x
	mov r5, r1	@y
	asrs r5, r5, r3
	asrs r4, r4, r3
	subs r0, r0, r5
	adds r1, r1, r4
	mov r4, r3
	lsls r4, r4, # 2
	ldr r4, [r6, r4]
	subs r2, r2, r4
	b __atan2_xuanzhuan
__atan2_zhengzhuan:
	mov r4, r0	@x
	mov r5, r1	@y
	asrs r5, r5, r3
	asrs r4, r4, r3
	adds r0, r0, r5
	subs r1, r1, r4
	mov r4, r3
	lsls r4, r4, # 2
	ldr r4, [r6, r4]
	adds r2, r2, r4
__atan2_xuanzhuan:
	adds r3, r3, # 1
	cmp r3, # 21
	bne __suan_atan2_xunhuan
	mov r1, r0
	mov r0,r2
	pop {r2-r6,pc}
	.ltorg
	
__fushu_chufa:
	@入口R0=Z1_R, R1=Z1_I,R2=Z2_R,R3=Z2_I
	@出口R0=Z_R,R1=Z_I
	push {r4-r7,lr}
	mov r6, r0
	mov r7, r1
	@	lsls r0, r0, # 15
	@	lsls r1, r1, # 15
	bl __suan_atan2
	mov r5, r0
	mov r0, r2
	mov r1, r3
	@	lsls r0, r0, # 15
	@	lsls r1, r1, # 15
	bl __suan_atan2
	@	bkpt # 0
	mov r1, r5
	subs r0, r1, r0 @算角度差
	bpl __suan_shangxiabi_fudu
	ldr r1, = 11796480      @360*32768
	adds r0, r0, r1
__suan_shangxiabi_fudu:
	mov r5, r0      @保存角度差
	@	bkpt # 1
	mov r0, r2
	mov r1, r3
	bl __ji_suan_fu_du
	@	bkpt # 2
	mov r2, r0
	mov r0, r6      @上臂R
	mov r1, r7      @上臂I
	bl __ji_suan_fu_du
	@	bkpt # 3
	mov r1, r0
	lsrs r0, r0, # 17
	lsls r1, r1, # 15
	bl __chufa64
	mov r3, r1      @Z幅度
	@	bkpt # 4
	mov r0, r5
	bl __suan_cos_sin
	@	bkpt # 4
	mov r4, r1
	mov r1, r3
	movs r2, # 0
	movs r0, r0
	bpl cl1
	adds r2, r2, # 1
	mvns r0, r0
	adds r0, r0, # 1
cl1:
	movs r1, r1
	bpl cl2
	adds r2, r2, # 1
	mvns r1, r1
	adds r1, r1, # 1
cl2:
	bl __chengfa
	@	bkpt # 5
	lsls r0, r0, # 17
	lsrs r1, r1, # 15
	orrs r1, r1, r0
	cmp r2, # 1
	bne __suan_xubu
	mvns r1, r1
	adds r1, r1, # 1
__suan_xubu:
	mov r0, r4
	mov r4, r1      @实部
	mov r1, r3
	movs r2, # 0
	movs r0, r0
	bpl cl3
	adds r2, r2, # 1
	mvns r0, r0
	adds r0, r0, # 1
cl3:
	movs r1, r1
	bpl cl4
	adds r2, r2, # 1
	mvns r1, r1
	adds r1, r1, # 1
cl4:
	bl __chengfa
	@	bkpt #6
	lsls r0, r0, # 17
	lsrs r1, r1, # 15
	orrs r1, r1, r0
	cmp r2, # 1
	bne cl5
	mvns r1, r1
	adds r1, r1, # 1
cl5:
	mov r0, r4
	@有问题，ZR是负数输出ZI符号也会有问题
	movs r0, r0
	bpl __zr_bushifu
	mvns r0, r0
	mvns r1, r1
	adds r0, r0, # 1
	adds r1, r1, # 1
__zr_bushifu:
	pop {r4-r7,pc}

	
__chufa64:
	@64位除32位
	@ （R0=高32位R1=低32位）除（R2)= （R0高32）（R1低32）
	push {r3-r7,lr}
	cmp r2, # 0
	beq __chu_fa64_fan_hui0
	cmp r1, # 0
	bne __chu_fa64_ji_suan
	cmp r0, # 0
	beq __chu_fa64_fan_hui0
__chu_fa64_ji_suan:
	movs r4, # 0
	mov r7, r4
	mov r3, r4
	mov r5, r4
	movs r6, # 1
	lsls r6, r6, # 31
__chu_fa64_xun_huan:
	lsls r1, r1, # 1
	adcs r0, r0, r0
	adcs r4, r4, r4
	cmp r4, r2
	bcc __chu_fa_yi_wei
	adds r3, r3, r6
	adcs r5, r5, r7
	subs r4, r4, r2
__chu_fa_yi_wei:
	movs r6, r6
	beq __di_yi_wei
	lsrs r6, r6, # 1        @高32位移位
	bne __chu_fa64_xun_huan
	movs r7, # 1
	lsls r7, r7, # 31
	b __chu_fa64_xun_huan
__di_yi_wei:		            @低32位移位
	lsrs r7, r7, # 1
	bne __chu_fa64_xun_huan
	mov r0, r3
	mov r1, r5
	pop {r3-r7,pc}
__chu_fa64_fan_hui0:
	movs r0, # 0
	movs r1, # 0
	pop {r3-r7,pc}
_nmi_handler:	
_hard_fault:	
_memory_fault:	
_bus_fault:	
_usage_fault:
aaa:
	bx lr
__systick_zhongduan:				@syzd
	push {r0-r12,lr}
	ldr r0, = dft_jisuan_yanshi
	ldr r1, [r0]
	adds r1, r1, # 1
	str r1, [r0]
	cmp r1, # 2
	beq __suan_dft
__kai_dma:
        ldr r0, = 0x40020000
	movs r1, # 0x0f
	str r1, [r0, # 0x04]
	ldr r1, = 4000                  @采样数量       sl
	str r1, [r0, # 0x0c]
	movw r1, # 0x3581                       @0x3581(单次)，0x35a1(循环)
	str r1, [r0, # 0x08]
	
@	ldr r0, = 0x40020000
@	ldr r1, [r0]
@	lsls r1, r1, # 30
@	bpl __kai_dma
@	movw r1, # 6400
@	str r1, [r0, # 0x0c]
@	movs r1, # 0x0f
@	str r1, [r0, # 0x04]
@	movw r1, # 0x3581
@	str r1, [r0, # 0x08]
	b __systick_fanhui
__suan_dft:
	@movs r1, # 0
	@str r1, [r0]
        ldr r0, = cos_sin
	ldr r1, = cos_sin_100khz
	ldr r2, = dft_shuliang
	str r1, [r0]
	movs r1, # 50
	str r1, [r2]
	bl __dft_jisuan
	b __suan_dft
	b __systick_fanhui
__deng_dma_wan:
	ldr r0, = shangxiabi_qiehuan
	ldr r1, [r0]
	adds r1, r1, # 1
	str r1, [r0]
	cmp r1, # 2
	beq __qiehuan_xiabi
	
__qiehuan_shangbi:
	ldr r0, = 0x40023800
        movs r1, # 1
	lsls r1, r1, # 16
	str r1, [r0, # 0x18]
	
	ldr r0, = cos_sin
	ldr r1, = cos_sin_100khz
	ldr r2, = dft_shuliang
	str r1, [r0]
	movs r1, # 50
	str r1, [r2]
	bl __dft_jisuan
	mvns r0, r0
	adds r0, r0, # 1
	mvns r1, r1
	adds r1, r1, # 1
	mov r4, r0
	ldr r2, = lvboqizhizhen2
	ldr r0, =lvboqihuanchong2
	bl __lv_bo_qi
	ldr r2, = xiabi_i
	str r0, [r2]

	mov r1, r4
	ldr r2, = lvboqizhizhen3
	ldr r0, =lvboqihuanchong3
	bl __lv_bo_qi
	ldr r2, = xiabi_r
	str r0, [r2]
	b __systick_fanhui
__qiehuan_xiabi:
	movs r1, # 0
	str r1, [r0]

        ldr r0, = 0x40023800
	movs r1, # 1
	str r1, [r0, # 0x18]
	
	ldr r0, = cos_sin
	ldr r1, = cos_sin_100khz
	ldr r2, = dft_shuliang
	str r1, [r0]
	movs r1, # 50
	str r1, [r2]
	bl __dft_jisuan
	mov r4, r0
	ldr r2, = lvboqizhizhen
	ldr r0, =lvboqihuanchong
	bl __lv_bo_qi
	ldr r2, = shangbi_i
	str r0, [r2]
	
	mov r1, r4
        ldr r2, = lvboqizhizhen1
	ldr r0, =lvboqihuanchong1
	bl __lv_bo_qi
	ldr r2, = shangbi_r
	str r0, [r2]
__systick_fanhui:
	ldr r0, = 0xe0000d04
	ldr r1, = 0x02000000
	str r1, [r0]                 @ 清除SYSTICK中断
	pop {r0-r12,pc}
_dma_channel1:
	push {r0-r12,lr}
	ldr r0, = 0x40020000
	movs r1, # 0x0f
	str r1, [r0, # 0x04]
	ldr r1, = 6400                  @采样数量       sl
	str r1, [r0, # 0x0c]
	movw r1, # 0x3583                       @0x3581(单次)，0x35a1(循环)
	str r1, [r0, # 0x08]
	b __suan_dft



	
	.ltorg
	.section .data
	.equ STACHINIT,         	0x20004000      @堆栈顶
	.equ asciibiao,			0x20000000	@ASCII表
	.equ z_fudu,			0x200001a4
	.equ xiabi_rr,			0x200001a8
	.equ xiabi_ii,			0x200001ac
	.equ shangbi_rr,		0x200001b0
	.equ shangbi_ii,		0x200001b4
	.equ z_jiao_du,			0x200001b8
	.equ z_r,			0x200001bc
	.equ z_i,			0x200001c0
	.equ shangxiabi_qiehuan,	0x200001c4
	.equ lvbo_youyi,		0x200001d8
	.equ lvbo_changdu,		0x200001dc
	.equ dft_jisuan_yanshi,		0x200001e0
	.equ xiabi_r,			0x200001e4
	.equ xiabi_i,			0x200001e8	
	.equ shangbi_r,			0x200001ec	
	.equ shangbi_i,			0x200001f0	
	.equ cos_sin,			0x200001f4	@cos_sin_表
	.equ dft_shuliang,		0x200001f8	@dft数量
	.equ sp_zhizhen,		0x200001fc	@堆栈指针
	.equ dianyabiao,		0x20000200	@电压表
	.equ lvboqizhizhen,		0x20003400
	.equ lvboqihuanchong,		0x20003408
	.equ lvboqizhizhen1,		0x200035a0
	.equ lvboqihuanchong1,		0x200035a8
	.equ lvboqizhizhen2,		0x20003740
	.equ lvboqihuanchong2,		0x20003748
	.equ lvboqizhizhen3,		0x200038e0
	.equ lvboqihuanchong3,		0x200038e8
yjmwxwx:
	.ascii "yjmwxwx"
kong:
	.ascii " "
fu:
	.ascii "-"
	.align 4
f_cos_sin_100khz:
	.float 1.000000,-0.000000,0.995185,-0.098017,0.980785,-0.195090,0.956940,-0.290285,0.923880,-0.382683,0.881921,-0.471397,0.831470,-0.555570,0.773011,-0.634393,0.707107,-0.707107,0.634393,-0.773010,0.555570,-0.831469,0.471397,-0.881921,0.382684,-0.923879,0.290285,-0.956940,0.195091,-0.980785,0.098017,-0.995185,0.000000,-1.000000,-0.098017,-0.995185,-0.195090,-0.980785,-0.290284,-0.956940,-0.382683,-0.923880,-0.471396,-0.881921,-0.555570,-0.831470,-0.634393,-0.773011,-0.707106,-0.707107,-0.773010,-0.634394,-0.831469,-0.555571,-0.881921,-0.471397,-0.923879,-0.382684,-0.956940,-0.290285,-0.980785,-0.195091,-0.995185,-0.098018,-1.000000,-0.000001,-0.995185,0.098017,-0.980785,0.195090,-0.956941,0.290284,-0.923880,0.382683,-0.881922,0.471396,-0.831470,0.555569,-0.773011,0.634393,-0.707107,0.707106,-0.634394,0.773010,-0.555571,0.831469,-0.471398,0.881921,-0.382684,0.923879,-0.290285,0.956940,-0.195091,0.980785,-0.098018,0.995185,-0.000001,1.000000,0.098016,0.995185,0.195089,0.980785,0.290284,0.956941,0.382683,0.923880,0.471396,0.881922,0.555569,0.831471,0.634392,0.773011,0.707106,0.707108,0.773010,0.634394,0.831469,0.555571,0.881921,0.471398,0.923879,0.382685,0.956940,0.290286,0.980785,0.195091,0.995185,0.098018
	.align 4
zhengxian_10khz:
	.byte 128,143,159,174,189,202,215,226,235,243,249,253,255,255,253,249,243,235,226,215,202,189,174,159,143,128,112,96,81,66,53,40,29,20,12,6,2,0,0,2,6,12,20,29,40,53,66,81,96,112
	
	
	.align 4
zhengxian_100khz1:
	.byte 10,10,11,12,13,14,15,16,16,17,17,18,18,19,19,19,19,19,19,19,18,18,17,17,16,16,15,14,13,12,11,10,10,9,8,7,6,5,4,3,3,2,2,1,1,0,0,0,0,0,0,0,1,1,2,2,3,3,4,5,6,7,8,9
	
zhengxian_100khz:
	.byte 16,18,20,23,25,26,28,29,30,31,31,31,30,29,28,26,25,23,20,18,16,13,11,8,6,5,3,2,1,0,0,0,1,2,3,5,6,8,11,13


cos_sin_100khz1:
	.int 0x8000,0x0000,0x7E6C,0xFFFFEBFA,0x79BC,0xFFFFD873,0x720C,0xFFFFC5E4,0x678D,0xFFFFB4C4,0x5A82,0xFFFFA57E,0x4B3C,0xFFFF9873,0x3A1C,0xFFFF8DF4,0x278D,0xFFFF8644,0x1406,0xFFFF8194,0x0000,0xFFFF8000,0xFFFFEBFA,0xFFFF8194,0xFFFFD873,0xFFFF8644,0xFFFFC5E4,0xFFFF8DF4,0xFFFFB4C4,0xFFFF9873,0xFFFFA57E,0xFFFFA57E,0xFFFF9873,0xFFFFB4C4,0xFFFF8DF4,0xFFFFC5E4,0xFFFF8644,0xFFFFD873,0xFFFF8194,0xFFFFEBFA,0xFFFF8000,0x0000,0xFFFF8194,0x1406,0xFFFF8644,0x278D,0xFFFF8DF4,0x3A1C,0xFFFF9873,0x4B3C,0xFFFFA57E,0x5A82,0xFFFFB4C4,0x678D,0xFFFFC5E4,0x720C,0xFFFFD873,0x79BC,0xFFFFEBFA,0x7E6C,0x0000,0x8000,0x1406,0x7E6C,0x278D,0x79BC,0x3A1C,0x720C,0x4B3C,0x678D,0x5A82,0x5A82,0x678D,0x4B3C,0x720C,0x3A1C,0x79BC,0x278D,0x7E6C,0x1406
	.int 0x8000,0x0000,0x7E6C,0xFFFFEBFA,0x79BC,0xFFFFD873,0x720C,0xFFFFC5E4,0x678D,0xFFFFB4C4,0x5A82,0xFFFFA57E,0x4B3C,0xFFFF9873,0x3A1C,0xFFFF8DF4,0x278D,0xFFFF8644,0x1406,0xFFFF8194,0x0000,0xFFFF8000,0xFFFFEBFA,0xFFFF8194,0xFFFFD873,0xFFFF8644,0xFFFFC5E4,0xFFFF8DF4,0xFFFFB4C4,0xFFFF9873,0xFFFFA57E,0xFFFFA57E,0xFFFF9873,0xFFFFB4C4,0xFFFF8DF4,0xFFFFC5E4,0xFFFF8644,0xFFFFD873,0xFFFF8194,0xFFFFEBFA,0xFFFF8000,0x0000,0xFFFF8194,0x1406,0xFFFF8644,0x278D,0xFFFF8DF4,0x3A1C,0xFFFF9873,0x4B3C,0xFFFFA57E,0x5A82,0xFFFFB4C4,0x678D,0xFFFFC5E4,0x720C,0xFFFFD873,0x79BC,0xFFFFEBFA,0x7E6C,0x0000,0x8000,0x1406,0x7E6C,0x278D,0x79BC,0x3A1C,0x720C,0x4B3C,0x678D,0x5A82,0x5A82,0x678D,0x4B3C,0x720C,0x3A1C,0x79BC,0x278D,0x7E6C,0x1406
	.int 0x8000,0x0000,0x7E6C,0xFFFFEBFA,0x79BC,0xFFFFD873,0x720C,0xFFFFC5E4,0x678D,0xFFFFB4C4,0x5A82,0xFFFFA57E,0x4B3C,0xFFFF9873,0x3A1C,0xFFFF8DF4,0x278D,0xFFFF8644,0x1406,0xFFFF8194,0x0000,0xFFFF8000,0xFFFFEBFA,0xFFFF8194,0xFFFFD873,0xFFFF8644,0xFFFFC5E4,0xFFFF8DF4,0xFFFFB4C4,0xFFFF9873,0xFFFFA57E,0xFFFFA57E,0xFFFF9873,0xFFFFB4C4,0xFFFF8DF4,0xFFFFC5E4,0xFFFF8644,0xFFFFD873,0xFFFF8194,0xFFFFEBFA,0xFFFF8000,0x0000,0xFFFF8194,0x1406,0xFFFF8644,0x278D,0xFFFF8DF4,0x3A1C,0xFFFF9873,0x4B3C,0xFFFFA57E,0x5A82,0xFFFFB4C4,0x678D,0xFFFFC5E4,0x720C,0xFFFFD873,0x79BC,0xFFFFEBFA,0x7E6C,0x0000,0x8000,0x1406,0x7E6C,0x278D,0x79BC,0x3A1C,0x720C,0x4B3C,0x678D,0x5A82,0x5A82,0x678D,0x4B3C,0x720C,0x3A1C,0x79BC,0x278D,0x7E6C,0x1406
	.int 0x8000,0x0000,0x7E6C,0xFFFFEBFA,0x79BC,0xFFFFD873,0x720C,0xFFFFC5E4,0x678D,0xFFFFB4C4,0x5A82,0xFFFFA57E,0x4B3C,0xFFFF9873,0x3A1C,0xFFFF8DF4,0x278D,0xFFFF8644,0x1406,0xFFFF8194,0x0000,0xFFFF8000,0xFFFFEBFA,0xFFFF8194,0xFFFFD873,0xFFFF8644,0xFFFFC5E4,0xFFFF8DF4,0xFFFFB4C4,0xFFFF9873,0xFFFFA57E,0xFFFFA57E,0xFFFF9873,0xFFFFB4C4,0xFFFF8DF4,0xFFFFC5E4,0xFFFF8644,0xFFFFD873,0xFFFF8194,0xFFFFEBFA,0xFFFF8000,0x0000,0xFFFF8194,0x1406,0xFFFF8644,0x278D,0xFFFF8DF4,0x3A1C,0xFFFF9873,0x4B3C,0xFFFFA57E,0x5A82,0xFFFFB4C4,0x678D,0xFFFFC5E4,0x720C,0xFFFFD873,0x79BC,0xFFFFEBFA,0x7E6C,0x0000,0x8000,0x1406,0x7E6C,0x278D,0x79BC,0x3A1C,0x720C,0x4B3C,0x678D,0x5A82,0x5A82,0x678D,0x4B3C,0x720C,0x3A1C,0x79BC,0x278D,0x7E6C,0x1406



	
cos_sin_100khz:
	.int 0x8000,0x0000,0x7F62,0xFFFFF375,0x7D8A,0xFFFFE708,0x7A7D,0xFFFFDAD8,0x7641,0xFFFFCF05,0x70E2,0xFFFFC3AA,0x6A6D,0xFFFFB8E4,0x62F2,0xFFFFAECD,0x5A82,0xFFFFA57E,0x5133,0xFFFF9D0E,0x471C,0xFFFF9593,0x3C56,0xFFFF8F1E,0x30FB,0xFFFF89BF,0x2528,0xFFFF8583,0x18F8,0xFFFF8276,0x0C8B,0xFFFF809E,0x0000,0xFFFF8000,0xFFFFF375,0xFFFF809E,0xFFFFE708,0xFFFF8276,0xFFFFDAD8,0xFFFF8583,0xFFFFCF05,0xFFFF89BF,0xFFFFC3AA,0xFFFF8F1E,0xFFFFB8E4,0xFFFF9593,0xFFFFAECD,0xFFFF9D0E,0xFFFFA57E,0xFFFFA57E,0xFFFF9D0F,0xFFFFAECD,0xFFFF9593,0xFFFFB8E4,0xFFFF8F1E,0xFFFFC3AA,0xFFFF89BF,0xFFFFCF05,0xFFFF8583,0xFFFFDAD8,0xFFFF8276,0xFFFFE708,0xFFFF809E,0xFFFFF375,0xFFFF8000,0x0000,0xFFFF809E,0x0C8B,0xFFFF8276,0x18F8,0xFFFF8583,0x2528,0xFFFF89BF,0x30FB,0xFFFF8F1E,0x3C56,0xFFFF9593,0x471C,0xFFFF9D0E,0x5133,0xFFFFA57E,0x5A82,0xFFFFAECD,0x62F1,0xFFFFB8E4,0x6A6D,0xFFFFC3AA,0x70E2,0xFFFFCF05,0x7641,0xFFFFDAD8,0x7A7D,0xFFFFE708,0x7D8A,0xFFFFF375,0x7F62,0x0000,0x8000,0x0C8B,0x7F62,0x18F8,0x7D8A,0x2528,0x7A7D,0x30FB,0x7641,0x3C56,0x70E2,0x471C,0x6A6D,0x5133,0x62F2,0x5A82,0x5A82,0x62F1,0x5133,0x6A6D,0x471C,0x70E2,0x3C56,0x7641,0x30FB,0x7A7D,0x2528,0x7D8A,0x18F8,0x7F62,0x0C8B
	.int 0x8000,0x0000,0x7F62,0xFFFFF375,0x7D8A,0xFFFFE708,0x7A7D,0xFFFFDAD8,0x7641,0xFFFFCF05,0x70E2,0xFFFFC3AA,0x6A6D,0xFFFFB8E4,0x62F2,0xFFFFAECD,0x5A82,0xFFFFA57E,0x5133,0xFFFF9D0E,0x471C,0xFFFF9593,0x3C56,0xFFFF8F1E,0x30FB,0xFFFF89BF,0x2528,0xFFFF8583,0x18F8,0xFFFF8276,0x0C8B,0xFFFF809E,0x0000,0xFFFF8000,0xFFFFF375,0xFFFF809E,0xFFFFE708,0xFFFF8276,0xFFFFDAD8,0xFFFF8583,0xFFFFCF05,0xFFFF89BF,0xFFFFC3AA,0xFFFF8F1E,0xFFFFB8E4,0xFFFF9593,0xFFFFAECD,0xFFFF9D0E,0xFFFFA57E,0xFFFFA57E,0xFFFF9D0F,0xFFFFAECD,0xFFFF9593,0xFFFFB8E4,0xFFFF8F1E,0xFFFFC3AA,0xFFFF89BF,0xFFFFCF05,0xFFFF8583,0xFFFFDAD8,0xFFFF8276,0xFFFFE708,0xFFFF809E,0xFFFFF375,0xFFFF8000,0x0000,0xFFFF809E,0x0C8B,0xFFFF8276,0x18F8,0xFFFF8583,0x2528,0xFFFF89BF,0x30FB,0xFFFF8F1E,0x3C56,0xFFFF9593,0x471C,0xFFFF9D0E,0x5133,0xFFFFA57E,0x5A82,0xFFFFAECD,0x62F1,0xFFFFB8E4,0x6A6D,0xFFFFC3AA,0x70E2,0xFFFFCF05,0x7641,0xFFFFDAD8,0x7A7D,0xFFFFE708,0x7D8A,0xFFFFF375,0x7F62,0x0000,0x8000,0x0C8B,0x7F62,0x18F8,0x7D8A,0x2528,0x7A7D,0x30FB,0x7641,0x3C56,0x70E2,0x471C,0x6A6D,0x5133,0x62F2,0x5A82,0x5A82,0x62F1,0x5133,0x6A6D,0x471C,0x70E2,0x3C56,0x7641,0x30FB,0x7A7D,0x2528,0x7D8A,0x18F8,0x7F62,0x0C8B
	.align 4
atan_biao:		@角度
	.int 0x00168000,0x000D4853,0x000704A3,0x00039000,0x0001C9C5,0x0000E51B,0x00007295,0x0000394B,0x00001CA5,0x00000E52,0x00000729,0x00000394,0x000001CA,0x000000E5,0x00000072,0x00000039,0x0000001C,0x0000000E,0x00000007,0x00000003,0x00000001
da_a_labo_hack: @16*24
	.byte 0x00, 0x00, 0x00, 0x80, 0xFF, 0x01, 0xF0, 0xFF, 0x0F, 0xF8, 0xFF, 0x1F, 0x7C, 0x00, 0x3E, 0x1E, 0x00, 0x78, 0x0E, 0x00, 0x70, 0x0E, 0x00, 0x70, 0x0E, 0x00, 0x70, 0x0E, 0x00, 0x70, 0x1E, 0x00, 0x78, 0x7C, 0x00, 0x3E, 0xF8, 0xFF, 0x1F, 0xF0, 0xFF, 0x0F, 0x80, 0xFF, 0x01, 0x00, 0x00, 0x00 @ 0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x00, 0x70, 0x70, 0x00, 0x70, 0x70, 0x00, 0x70, 0x78, 0x00, 0x70, 0xFC, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0x00, 0x00, 0x70, 0x00, 0x00, 0x70, 0x00, 0x00, 0x70, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 @ 1
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x78, 0x1C, 0x00, 0x7C, 0x1C, 0x00, 0x7E, 0x0E, 0x00, 0x77, 0x0E, 0x00, 0x77, 0x0E, 0x80, 0x73, 0x0E, 0xC0, 0x71, 0x0E, 0xE0, 0x70, 0x1E, 0x78, 0x70, 0x1E, 0x3C, 0x70, 0xFC, 0x1F, 0x70, 0xF8, 0x07, 0x70, 0xF0, 0x03, 0x70, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00 @ 2
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x38, 0x1C, 0x00, 0x38, 0x1C, 0x00, 0x70, 0x0E, 0x00, 0x70, 0x0E, 0x00, 0x70, 0x0E, 0x1C, 0x70, 0x0E, 0x1C, 0x70, 0x0E, 0x1C, 0x70, 0x0E, 0x1C, 0x70, 0x0E, 0x3E, 0x78, 0x1C, 0x37, 0x3C, 0xFC, 0xF3, 0x3F, 0xF8, 0xE3, 0x1F, 0xF0, 0xC0, 0x07, 0x00, 0x00, 0x00 @ 3
	.byte 0x00, 0xE0, 0x01, 0x00, 0xF0, 0x01, 0x00, 0xFC, 0x01, 0x00, 0xFE, 0x01, 0x00, 0xDF, 0x01, 0x80, 0xCF, 0x01, 0xE0, 0xC3, 0x01, 0xF0, 0xC1, 0x01, 0xF8, 0xC0, 0x01, 0x7C, 0xC0, 0x01, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0x00, 0xC0, 0x01, 0x00, 0xC0, 0x01, 0x00, 0xC0, 0x01 @ 4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x38, 0xFE, 0x1F, 0x38, 0xFE, 0x0F, 0x70, 0xFE, 0x0F, 0x70, 0x0E, 0x0E, 0x70, 0x0E, 0x0E, 0x70, 0x0E, 0x0E, 0x70, 0x0E, 0x0E, 0x70, 0x0E, 0x1E, 0x78, 0x0E, 0x3C, 0x3C, 0x0E, 0xFC, 0x1F, 0x0E, 0xF8, 0x0F, 0x0E, 0xE0, 0x07, 0x00, 0x00, 0x00 @ 5
	.byte 0x00, 0x00, 0x00, 0x00, 0xFE, 0x03, 0xC0, 0xFF, 0x0F, 0xF0, 0xFF, 0x1F, 0xF8, 0x1C, 0x3E, 0x3C, 0x0C, 0x78, 0x1C, 0x0E, 0x70, 0x1E, 0x0E, 0x70, 0x0E, 0x0E, 0x70, 0x0E, 0x0E, 0x70, 0x0E, 0x1E, 0x78, 0x0E, 0x3C, 0x3C, 0x1E, 0xFC, 0x1F, 0x00, 0xF8, 0x0F, 0x00, 0xE0, 0x07, 0x00, 0x00, 0x00 @ 6
	.byte 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x0E, 0x00, 0x40, 0x0E, 0x00, 0x70, 0x0E, 0x00, 0x7C, 0x0E, 0x00, 0x7F, 0x0E, 0xC0, 0x1F, 0x0E, 0xF0, 0x07, 0x0E, 0xFC, 0x00, 0x0E, 0x3F, 0x00, 0xCE, 0x0F, 0x00, 0xFE, 0x03, 0x00, 0xFE, 0x00, 0x00, 0x3E, 0x00, 0x00, 0x00, 0x00, 0x00 @ 7
	.byte 0x00, 0x00, 0x00, 0x00, 0xC0, 0x07, 0xF0, 0xE1, 0x1F, 0xF8, 0xF3, 0x3F, 0xFC, 0x3F, 0x3C, 0x1E, 0x1F, 0x78, 0x0E, 0x0E, 0x70, 0x0E, 0x0C, 0x70, 0x0E, 0x1C, 0x70, 0x0E, 0x18, 0x70, 0x1E, 0x3C, 0x78, 0xFC, 0x7F, 0x3C, 0xF8, 0xF3, 0x3F, 0xF0, 0xE1, 0x1F, 0x00, 0xC0, 0x07, 0x00, 0x00, 0x00 @ 8
	.byte 0x00, 0x00, 0x00, 0xE0, 0x07, 0x00, 0xF0, 0x1F, 0x00, 0xF8, 0x3F, 0x78, 0x3C, 0x3C, 0x70, 0x1E, 0x78, 0x70, 0x0E, 0x70, 0x70, 0x0E, 0x70, 0x70, 0x0E, 0x70, 0x78, 0x0E, 0x70, 0x38, 0x1E, 0x30, 0x3C, 0x7C, 0x38, 0x1F, 0xF8, 0xFF, 0x0F, 0xF0, 0xFF, 0x03, 0xC0, 0x7F, 0x00, 0x00, 0x00, 0x00 @ 9
	.align 4
ascii_biao:	@6*8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 @
	.byte 0x00, 0x00, 0x00, 0x4F, 0x00, 0x00 @ !
	.byte 0x00, 0x00, 0x07, 0x00, 0x07, 0x00 @ "
	.byte 0x00, 0x14, 0x7F, 0x14, 0x7F, 0x14 @ #
	.byte 0x00, 0x24, 0x2A, 0x7F, 0x2A, 0x12 @ $
	.byte 0x00, 0x23, 0x13, 0x08, 0x64, 0x62 @ %
	.byte 0x00, 0x36, 0x49, 0x55, 0x22, 0x50 @ &
	.byte 0x00, 0x00, 0x05, 0x03, 0x00, 0x00 @ '
	.byte 0x00, 0x00, 0x1C, 0x22, 0x41, 0x00 @ (
	.byte 0x00, 0x00, 0x41, 0x22, 0x1C, 0x00 @ )
	.byte 0x00, 0x14, 0x08, 0x3E, 0x08, 0x14 @ *
	.byte 0x00, 0x08, 0x08, 0x3E, 0x08, 0x08 @ +
	.byte 0x00, 0x00, 0x50, 0x30, 0x00, 0x00 @ ,
	.byte 0x00, 0x08, 0x08, 0x08, 0x08, 0x08 @ -
	.byte 0x00, 0x00, 0x60, 0x60, 0x00, 0x00 @ .
	.byte 0x00, 0x20, 0x10, 0x08, 0x04, 0x02 @ /
	.byte 0x00, 0x3E, 0x51, 0x49, 0x45, 0x3E @ 0
	.byte 0x00, 0x00, 0x42, 0x7F, 0x40, 0x00 @ 1
	.byte 0x00, 0x42, 0x61, 0x51, 0x49, 0x46 @ 2
	.byte 0x00, 0x21, 0x41, 0x45, 0x4B, 0x31 @ 3
	.byte 0x00, 0x18, 0x14, 0x12, 0x7F, 0x10 @ 4
	.byte 0x00, 0x27, 0x45, 0x45, 0x45, 0x39 @ 5
	.byte 0x00, 0x3C, 0x4A, 0x49, 0x49, 0x30 @ 6
	.byte 0x00, 0x01, 0x01, 0x79, 0x05, 0x03 @ 7
	.byte 0x00, 0x36, 0x49, 0x49, 0x49, 0x36 @ 8
	.byte 0x00, 0x06, 0x49, 0x49, 0x29, 0x1E @ 9
	.byte 0x00, 0x00, 0x36, 0x36, 0x00, 0x00 @ :
	.byte 0x00, 0x00, 0x56, 0x36, 0x00, 0x00 @ ;
	.byte 0x00, 0x08, 0x14, 0x22, 0x41, 0x00 @ <
	.byte 0x00, 0x14, 0x14, 0x14, 0x14, 0x14 @ =
	.byte 0x00, 0x00, 0x41, 0x22, 0x14, 0x08 @ >
	.byte 0x02, 0x01, 0x51, 0x09, 0x06, 0x00 @ ?
	.byte 0x00, 0x32, 0x49, 0x79, 0x41, 0x3E @ @
	.byte 0x00, 0x7E, 0x11, 0x11, 0x11, 0x7E @ A
	.byte 0x00, 0x41, 0x7F, 0x49, 0x49, 0x36 @ B
	.byte 0x00, 0x3E, 0x41, 0x41, 0x41, 0x22 @ C
	.byte 0x00, 0x41, 0x7F, 0x41, 0x41, 0x3E @ D
	.byte 0x00, 0x7F, 0x49, 0x49, 0x49, 0x49 @ E
	.byte 0x00, 0x7F, 0x09, 0x09, 0x09, 0x09 @ F
	.byte 0x00, 0x3E, 0x41, 0x41, 0x51, 0x72 @ G
	.byte 0x00, 0x7F, 0x08, 0x08, 0x08, 0x7F @ H
	.byte 0x00, 0x00, 0x41, 0x7F, 0x41, 0x00 @ I
	.byte 0x00, 0x20, 0x40, 0x41, 0x3F, 0x01 @ J
	.byte 0x00, 0x7F, 0x08, 0x14, 0x22, 0x41 @ K
	.byte 0x00, 0x7F, 0x40, 0x40, 0x40, 0x40 @ L
	.byte 0x00, 0x7F, 0x02, 0x0C, 0x02, 0x7F @ M
	.byte 0x81, 0x7F, 0x06, 0x08, 0x30, 0x7F @ N
	.byte 0x00, 0x3E, 0x41, 0x41, 0x41, 0x3E @ O
	.byte 0x00, 0x7F, 0x09, 0x09, 0x09, 0x06 @ P
	.byte 0x00, 0x3E, 0x41, 0x51, 0x21, 0x5E @ Q
	.byte 0x00, 0x7F, 0x09, 0x19, 0x29, 0x46 @ R
	.byte 0x00, 0x26, 0x49, 0x49, 0x49, 0x32 @ S
	.byte 0x00, 0x01, 0x01, 0x7F, 0x01, 0x01 @ T
	.byte 0x00, 0x3F, 0x40, 0x40, 0x40, 0x3F @ U
	.byte 0x00, 0x1F, 0x20, 0x40, 0x20, 0x1F @ V
	.byte 0x00, 0x7F, 0x20, 0x18, 0x20, 0x7F @ W
	.byte 0x00, 0x63, 0x14, 0x08, 0x14, 0x63 @ X
	.byte 0x00, 0x07, 0x08, 0x70, 0x08, 0x07 @ Y
	.byte 0x00, 0x61, 0x51, 0x49, 0x45, 0x43 @ Z
	.byte 0x00, 0x00, 0x7F, 0x41, 0x41, 0x00 @ [
	.byte 0x00, 0x02, 0x04, 0x08, 0x10, 0x20 @ BackSlash
	.byte 0x00, 0x00, 0x41, 0x41, 0x7F, 0x00 @ ]
	.byte 0x00, 0x04, 0x02, 0x01, 0x02, 0x04 @ ^
	.byte 0x00, 0x40, 0x40, 0x40, 0x40, 0x40 @ _
	.byte 0x00, 0x01, 0x02, 0x04, 0x00, 0x00 @ `
	.byte 0x00, 0x20, 0x54, 0x54, 0x54, 0x78 @ a
	.byte 0x00, 0x7F, 0x48, 0x44, 0x44, 0x38 @ b
	.byte 0x00, 0x38, 0x44, 0x44, 0x44, 0x28 @ c
	.byte 0x00, 0x38, 0x44, 0x44, 0x48, 0x7F @ d
	.byte 0x00, 0x38, 0x54, 0x54, 0x54, 0x18 @ e
	.byte 0x00, 0x00, 0x08, 0x7E, 0x09, 0x02 @ f
	.byte 0x00, 0x0C, 0x52, 0x52, 0x4C, 0x3E @ g
	.byte 0x00, 0x7F, 0x08, 0x04, 0x04, 0x78 @ h
	.byte 0x00, 0x00, 0x44, 0x7D, 0x40, 0x00 @ i
	.byte 0x00, 0x20, 0x40, 0x44, 0x3D, 0x00 @ j
	.byte 0x00, 0x00, 0x7F, 0x10, 0x28, 0x44 @ k
	.byte 0x00, 0x00, 0x41, 0x7F, 0x40, 0x00 @ l
	.byte 0x00, 0x78, 0x04, 0x78, 0x04, 0x78 @ m
	.byte 0x00, 0x7C, 0x08, 0x04, 0x04, 0x78 @ n
	.byte 0x00, 0x38, 0x7C, 0x7C, 0x7C, 0x38 @ o
	.byte 0x00, 0x7E, 0x0C, 0x12, 0x12, 0x0C @ p
	.byte 0x00, 0x0C, 0x12, 0x12, 0x0C, 0x7E @ q
	.byte 0x00, 0x7C, 0x08, 0x04, 0x04, 0x08 @ r
	.byte 0x00, 0x58, 0x54, 0x54, 0x54, 0x64 @ s
	.byte 0x00, 0x04, 0x3F, 0x44, 0x40, 0x20 @ t
	.byte 0x00, 0x3C, 0x40, 0x40, 0x3C, 0x40 @ u
	.byte 0x00, 0x1C, 0x20, 0x40, 0x20, 0x1C @ v
	.byte 0x00, 0x3C, 0x40, 0x30, 0x40, 0x3C @ w
	.byte 0x00, 0x44, 0x28, 0x10, 0x28, 0x44 @ x
	.byte 0x00, 0x1C, 0xA0, 0xA0, 0x90, 0x7C @ y
	.byte 0x00, 0x44, 0x64, 0x54, 0x4C, 0x44 @ z
	.byte 0x00, 0x00, 0x08, 0x36, 0x41, 0x00 @ {
	.byte 0x00, 0x00, 0x00, 0x77, 0x00, 0x00 @ |
	.byte 0x00, 0x00, 0x41, 0x36, 0x08, 0x00 @ }
	.byte 0x00, 0x02, 0x01, 0x02, 0x04, 0x02 @ ~
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 @
	
	.align 4

danweibiao: @15*24
	.byte 0x00, 0x00, 0x00, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0x00, 0xC0, 0x00, 0x00, 0x80, 0x01, 0x00, 0x80, 0x03, 0x00, 0x80, 0x03, 0x00, 0x80, 0x03, 0x00, 0xE0, 0x01, 0xFE, 0x7F, 0x00, 0xFE, 0xFF, 0x01, 0xFE, 0xFF, 0x03, 0x00, 0x80, 0x03, 0x00, 0x80, 0x01 @ µ
	.byte 0x00, 0x7F, 0x70, 0xE0, 0xFF, 0x73, 0xF0, 0xFF, 0x77, 0xF8, 0x00, 0x7F, 0x38, 0x00, 0x7C, 0x3C, 0x00, 0x70, 0x1C, 0x00, 0x60, 0x1C, 0x00, 0x00, 0x1C, 0x00, 0x60, 0x3C, 0x00, 0x70, 0x38, 0x00, 0x7C, 0xF8, 0x00, 0x7F, 0xF0, 0xFF, 0x77, 0xE0, 0xFF, 0x73, 0x00, 0x7F, 0x70 @Ω
	.byte 0x00, 0x00, 0x00, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0x0E, 0x1C, 0x00, 0x0E, 0x1C, 0x00, 0x0E, 0x1C, 0x00, 0x0E, 0x1C, 0x00, 0x0E, 0x1C, 0x00, 0x0E, 0x1C, 0x00, 0x0E, 0x1C, 0x00, 0x0E, 0x1C, 0x00, 0x0E, 0x1C, 0x00, 0x0E, 0x1C, 0x00, 0x0E, 0x00, 0x00 @ F
	.byte 0x00, 0xF8, 0x7F, 0x00, 0xFC, 0x7F, 0x00, 0x1E, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x1C, 0x00, 0x00, 0xF8, 0x7F, 0x00, 0xF8, 0x7F, 0x00, 0x1C, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x1E, 0x00, 0x00, 0xFC, 0x7F, 0x00, 0xF8, 0x7F, 0x00, 0x00, 0x00 @ m
	.byte 0x00, 0x00, 0x00, 0xFC, 0xFF, 0x0F, 0xFC, 0xFF, 0x0F, 0x3C, 0x00, 0x00, 0xF0, 0x01, 0x00, 0x80, 0x0F, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x3C, 0x00, 0x80, 0x0F, 0x00, 0xF0, 0x01, 0x00, 0x3C, 0x00, 0x00, 0xFC, 0xFF, 0x0F, 0xFC, 0xFF, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 @ M
	.byte 0x00, 0x00, 0x00, 0x80, 0xFF, 0x7F, 0x80, 0xFF, 0x7F, 0x80, 0xFF, 0x7F, 0x00, 0x07, 0x00, 0x80, 0x03, 0x00, 0xC0, 0x01, 0x00, 0xC0, 0x01, 0x00, 0xC0, 0x01, 0x00, 0xC0, 0x03, 0x00, 0xC0, 0xFF, 0x7F, 0x80, 0xFF, 0x7F, 0x00, 0xFE, 0x7F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 @ n
	.byte 0x00, 0x00, 0x00, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0x1C, 0xE0, 0x00, 0x0E, 0xC0, 0x00, 0x06, 0x80, 0x01, 0x06, 0x80, 0x01, 0x06, 0x80, 0x01, 0x0E, 0xC0, 0x01, 0x1C, 0xE0, 0x00, 0xFC, 0xFF, 0x00, 0xF8, 0x7F, 0x00, 0xE0, 0x1F, 0x00, 0x00, 0x00, 0x00   @ p
	.byte 0x00, 0x00, 0x00, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0x00, 0x1C, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x1C, 0x00, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F @ H
