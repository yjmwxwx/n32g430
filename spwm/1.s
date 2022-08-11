	@单片机：N32G430C8L7
	@功能：频率相位可调SPWM
	@作者：yjmwxwx
	@时间：20220726
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
	.word aaa +1 @11 _dma_channel1 +1
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
	.word _tim3 +1
	.word aaa +1 @30 _tim4 +1
	.word aaa +1 @31 _i2c1_ev +1
	.word aaa +1 @32 _i2c1_er +1
	.word aaa +1 @33 _i2c2_ev +1
	.word aaa +1 @34 _i2c2_er +1
	.word aaa +1 @35 _spi1 +1
	.word aaa +1 @36 _spi2 +1
	.word aaa +1 @37 _usart1 +1
	.word aaa +1 @38 _usart2 +1
	.word aaa +1 @39 _uart3 +1
	.word aaa +1 @40 _exti15_10 +1
	.word aaa +1 @41 _rtcalarm +1
	.word aaa +1 @42 _lptim_wkup +1
	.word aaa +1 @43 _tim8_brk +1
	.word aaa +1 @44 _tim8_up +1
	.word aaa +1 @45 _tim8_cc +1
	.word aaa +1 @46 _uart4 +1
	.word aaa +1 @47 _tim5 +1
	.word aaa +1 @48 _tim6 +1
	.word aaa +1 @49 _can_tx +1
	.word aaa +1 @50 _can_rx0 +1
	.word aaa +1 @51 _can_rx1 +1
	.word aaa +1 @52 _can_sce +1
_start:
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
	movw r1, # 0x1800
	str r1, [r0, # 0x18]
	movs r1, # 0x02
	str r1, [r0, # 0x1c]
	movw r1, # 0x3c00
	str r1, [r0, # 0x2c]
	movs r1, # 0x01
	str r1, [r0, # 0x80]

_waishezhongduan:			@外设中断
	@0xE000E100    0-31  写1开，写0没效
	@0XE000E180    0-31 写1关，写0没效
	@0XE000E200    0-31 挂起，写0没效
	@0XE000E280    0-31 清除， 写0没效
	ldr r0, =  0xe000e100
	ldr r1, = 0x10000000
	str r1, [r0]

_neicunqingling:
	ldr r0, = 0x20004000
	ldr r2, = 0x20000000
	movs r1, # 0
_neicunqinglingxunhuan:
	subs r0, r0, # 4
	str r1, [r0]
	cmp r0, r2
	bne _neicunqinglingxunhuan

	
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
	ldr r1, = 0x6bfafffd
	str r1, [r0]
	movw r1, # 0xfeff
	str r1, [r0, # 0x08]
	ldr r1, = 0x24000000
	str r1, [r0, # 0x0c]
	ldr r1, = 0x33
	str r1, [r0, # 0x24]
	@PB
	ldr r0, = 0x40023800
	ldr r1, = 0xebfff9bf
	str r1, [r0]
	movs r1, # 0
	str r1, [r0, # 0x0c]
	ldr r1, = 0x102000
	str r1, [r0, # 0x20]
	ldr r1, = 0x3300000
	str r1, [r0, # 0x24]

__dma_chushihua:
	ldr r0, = 0x40020000
        movs r1, # 0
	str r1, [r0, # 0x08]
	ldr r1, = 0x4002084c
	str r1, [r0, # 0x10]
	ldr r1, = dianyabiao
	str r1, [r0, # 0x14]
	ldr r1, = 400			@采样数量	sl
	str r1, [r0, # 0x0c]
	movw r1, # 0x3581 			@0x3581(单次)，0x35a1(循环) 
	str r1, [r0, # 0x08]
		
__adc_chushihua:
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
	movs r1, # 0x04			@通道选择
	str r1, [r0, # 0x34]  		
@	movw r1, # 0x100
@	str r1, [r0, # 0x04]		@通道循环采
	ldr r1, = 0x180101
	str r1, [r0, # 0x08]
        str r1, [r0, # 0x08]		@为啥还要开两次。。。


@       ldr r0, = 0xe000e010
@	ldr r1, = 6399
@	str r1, [r0, # 4]
@	str r1, [r0, # 8]
@	movs r1, # 0x07
@	str r1, [r0]    @systick 开

	
__tim3chushihua:
	ldr r3, = 0x40000400 @ tim3_cr1
	ldr r2, = 0
	str r2, [r3, # 0x28] @ psc
	ldr r2, = 6399                    @639=200KHZ
	str r2, [r3, # 0x2c] @ ARR
	movs r2, # 0x20
	str r2, [r3, # 0x04] @ TRGO
	movs r2, # 0x01
	str r2, [r3, # 0x0c]
	movs r2, # 0x81
__tim1_chushiha:
	ldr r0, = 0x40012c00 @ tim1_cr1
	movs r1, # 0
	str r1, [r0, # 0x28] @ psc
	ldr r1, = 6399
	str r1, [r0, # 0x2c] @ ARR
	ldr r1, = 0x6868
	str r1, [r0, # 0x18]   
	ldr r1, = 0xdd    
	str r1, [r0, # 0x20] @ ccer
	ldr r1, = 0x8000
	str r1, [r0, # 0x44] @ BDTR
	ldr r1, = 0x81
	str r1, [r0]
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
	movs r0, # 0x30		@设置EV（0x00-0x3f 对比度）
	bl __xie_spi1
	movs r0, # 0x2f		@助推器开启
	bl __xie_spi1		@调节器开、追踪器开
	movs r0, # 0xaf		@显示开
	bl __xie_spi1



	
	bl __lcd_qingping





adc:
	ldr r0, = 0x40020800
	ldrh r0, [r0, # 0x4c]
        movs r1, # 8
	ldr r2, = asciibiao
	movs r3, # 0xff
	bl _zhuanascii
	movs r0, # 8            @写几个字
	movs r1, # 48           @字库单字长度
	movs r2, # 3            @宽度
	ldr r3, =  0x100b2              @lcd位置
	bl __xie_lcd_ascii
	
	
	b adc


	
	ldr r0, = 0x20000100
	movs r1, # 0
	str r1, [r0]
__ting:
	ldr r0, = 0x40023418
	movs r2, # 0x01
	mov r3, r2
	str r2, [r0] @开
	lsls r3, r3,  # 16
	ldr r1, = 0xffffff
__led_kai_yanshi:
	subs r1, r1, # 1
	bne __led_kai_yanshi
	ldr r1, = 0xffffff
	str r3, [r0] @关
__led_guan_yanshi:
	subs r1, r1, # 1
	bne __led_guan_yanshi
	bl __jishu_shiyan
	b __ting
	
__jishu_shiyan:
	push {r0-r4,lr}
	ldr r4, = 12345678
        ldr r3, = 0x20000100
	ldr r0, [r3]
	adds r0, r0, # 1
	str r0, [r3]
	cmp r0, r4
	bne __xianshi_shuzi
	movs r0, # 0
	str r0, [r3]
__xianshi_shuzi:	
	movs r1, # 8
	ldr r2, = asciibiao
	movs r3, # 0xff
	bl _zhuanascii
	movs r0, # 8            @写几个字
	movs r1, # 48           @字库单字长度
	movs r2, # 3            @宽度
	ldr r3, =  0x100b2              @lcd位置
	bl __xie_lcd_ascii
	pop {r0-r4,pc}

	

__dft_jisuan:
	@出口R0=实部，R1=虚部
	push {r2-r12,lr}
	ldr r0, = sp_zhizhen
	str sp, [r0]
@	ldr sp, = cos_sin
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
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	asrs r4, r4, # 6
	asrs r5, r5, # 6
	asrs r6, r6, # 6
	asrs r7, r7, # 6
	asrs r8, r8, # 6
	asrs r9, r9, # 6
	add r10, r10, r2
	add r10, r10, r4
	add r10, r10, r6
	add r10, r10, r8
	add r11, r11, r3
	add r11, r11, r5
	add r11, r11, r7
	add r11, r11, r9
	mov r0, r10
	mov r1, r11
	ldr r2, = sp_zhizhen
	ldr sp, [r2]
	pop {r2-r12,pc}
	
__xie_spi1:
	push {r4-r5,lr}
	ldr r4, = 0x40013000
	bl __spi_mang
	strb r0, [r4,0x0c]
	ldr r4, = 0x3ff
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
	@入口R0=要写的地址(低16=X，高16=Y=（0-131(r5=高4,R4=低4))
	push {r1-r5,lr}
	mov r5, r0
	mov r4, r0
	lsls r0, r0, # 16
	lsrs r0, r0, # 16
	lsrs r5, r5, # 20	@高4
	lsls r4, r4, # 12
	lsrs r4, r4, # 28
        ldr r1, = 0x40023818
	movs r3, # 0x10
	lsls r3, r3, # 16
	str r3, [r1]            @RS=0
	ldr r2, = 0xff
	bl __lcd_yanshi
	bl __xie_spi1
	
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


__xie_lcd_ascii:
	push {r4-r11,lr}
	@入口r0=写几个字
	@r1=字库单字长度
	@r2=y宽（几行）
	@r3=要写的地址
	ldr r5, = asciibiao
	mov r9, r3
	movs r6, # 0
	mov r7, r6
	mov r10, r0
	mov r11, r2	
	muls r2, r2, r1
	mov r8, r2
__xie_lcd_dizhi:
	mov r0, r9
	bl __xie_lcd_weizhi
__du_ascii:
	ldrb r0, [r5, r6]
				@subs r0, r0, # 32	@字库偏移
	muls r0, r0, r1
	ldr r3, = da_a_labo_shuzi
	add r3, r3, r0
	adds r3, r3, r7
__du_ziku_16_chushihua:
	movs r4, # 0
__du_ziku_16:
	ldrb r0, [r3, r4]
	adds r4, r4, # 3
	cmp r4, r1
	beq __duwan_16
	bl __xie_spi1
	mov r0, r0
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
	pop {r4-r11,pc}
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
_nmi_handler:	
_hard_fault:	
_memory_fault:	
_bus_fault:	
_usage_fault:
aaa:
	bx lr
__systick_zhongduan:				@syzd
	push {r0-r12,lr}

__systick_fanhui:
	str r4, [r2]
	ldr r0, = 0xe0000d04
	ldr r1, = 0x02000000
	str r1, [r0]                 @ 清除SYSTICK中断
	pop {r0-r12,pc}
_tim3:
	push {r0-r12,lr}
	ldr r0, = spwm_zhizhen
	ldr r1, = dianyabiao
	ldr r2, [r0]
	ldrh r3, [r1, r2]
	movw r7, # 800
	adds r2, r2, # 2
	cmp r2, r7
	bls __du_ch2
	movs r2, # 0
__du_ch2:
	str r2, [r0]
	movw r8, # 400
	adds r2, r2, r8
	cmp r2, r7
	bls __xieru_spwm
	subs r2, r2, r7
__xieru_spwm:
	ldrh r8, [r1, r2]
	ldr r6, = 0x40012c34
	movs r4, # 8
	movw r5, # 6399
	mul r3, r3, r4
	mul r8, r8, r4
	mul r3, r3, r5
	mul r8, r8, r5
	lsrs r3, r3, # 15
	lsrs r8, r8, # 15
	str r3, [r6]
	str r8, [r6, # 0x04]
        ldr r0, = 0x40000400
	movs r1, # 0
	str r1, [r0, # 0x10]
	pop {r0-r12,pc}
	
	.ltorg
	.section .data
	.equ STACHINIT,         0x20004000      @堆栈顶
	.equ asciibiao,		0x20000000	@ASCII表
	.equ spwm_zhizhen,	0x200001e8	@spwm表指针
	.equ dianya_jiaodu,	0x200001ec	@电压角度
	.equ cos_zhizhen,	0x200001f8	@COS 指针
	.equ sp_zhizhen,	0x200001fc	@堆栈指针
	.equ dianyabiao,	0x20000200	@电压表
	.equ cos_biao,		0x20000300	@cos_表
	.align 4

atan_biao:		@角度
	.int 0x00168000,0x000D4853,0x000704A3,0x00039000,0x0001C9C5,0x0000E51B,0x00007295,0x0000394B,0x00001CA5,0x00000E52,0x00000729,0x00000394,0x000001CA,0x000000E5,0x00000072,0x00000039,0x0000001C,0x0000000E,0x00000007,0x00000003,0x00000001
	.align 4
da_a_labo_shuzi:
	.byte 0x00, 0x00, 0x00, 0x80, 0xFF, 0x01, 0xE0, 0xFF, 0x07, 0xF8, 0xFF, 0x1F, 0x78, 0x00, 0x1E, 0x1C, 0x00, 0x38, 0x0C, 0x00, 0x30, 0x0C, 0x00, 0x30, 0x0C, 0x00, 0x30, 0x1C, 0x00, 0x38, 0x78, 0x00, 0x1E, 0xF8, 0xFF, 0x1F, 0xE0, 0xFF, 0x07, 0x80, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   @ 0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x30, 0x60, 0x00, 0x30, 0x60, 0x00, 0x30, 0x70, 0x00, 0x30, 0xF8, 0xFF, 0x3F, 0xFC, 0xFF, 0x3F, 0xFC, 0xFF, 0x3F, 0x00, 0x00, 0x30, 0x00, 0x00, 0x30, 0x00, 0x00, 0x30, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   @ 1
	.byte 0x00, 0x00, 0x00, 0x38, 0x00, 0x38, 0x18, 0x00, 0x3C, 0x1C, 0x00, 0x3E, 0x0C, 0x00, 0x37, 0x0C, 0x80, 0x33, 0x0C, 0xC0, 0x31, 0x0C, 0xE0, 0x30, 0x1C, 0x70, 0x30, 0x1C, 0x3C, 0x30, 0xF8, 0x1F, 0x30, 0xF0, 0x0F, 0x30, 0xE0, 0x03, 0x30, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   @ 2
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x38, 0x00, 0x18, 0x18, 0x00, 0x38, 0x1C, 0x00, 0x30, 0x0C, 0x00, 0x30, 0x0C, 0x0C, 0x30, 0x0C, 0x0C, 0x30, 0x0C, 0x0C, 0x30, 0x0C, 0x0E, 0x38, 0x1C, 0x1E, 0x1C, 0xF8, 0xF3, 0x1F, 0xF8, 0xF1, 0x0F, 0xE0, 0xE0, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   @ 3
	.byte 0x00, 0xF0, 0x00, 0x00, 0xF8, 0x00, 0x00, 0xDC, 0x00, 0x00, 0xCE, 0x00, 0x00, 0xC7, 0x00, 0xC0, 0xC1, 0x00, 0xE0, 0xC0, 0x00, 0x70, 0xC0, 0x00, 0x38, 0xC0, 0x00, 0xFC, 0xFF, 0x3F, 0xFC, 0xFF, 0x3F, 0xFC, 0xFF, 0x3F, 0x00, 0xC0, 0x00, 0x00, 0xC0, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00   @ 4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0xFC, 0x07, 0x18, 0xFC, 0x07, 0x38, 0xFC, 0x07, 0x30, 0x0C, 0x06, 0x30, 0x0C, 0x06, 0x30, 0x0C, 0x06, 0x30, 0x0C, 0x06, 0x30, 0x0C, 0x0E, 0x38, 0x0C, 0x1C, 0x1C, 0x0C, 0xFC, 0x1F, 0x0C, 0xF8, 0x0F, 0x0C, 0xF0, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   @ 5
	.byte 0x00, 0x00, 0x00, 0x00, 0xFE, 0x01, 0xC0, 0xFF, 0x07, 0xE0, 0xFF, 0x1F, 0xF0, 0x0C, 0x1E, 0x38, 0x04, 0x38, 0x18, 0x06, 0x30, 0x0C, 0x06, 0x30, 0x0C, 0x06, 0x30, 0x0C, 0x0E, 0x38, 0x0C, 0x1E, 0x1C, 0x1C, 0xFC, 0x1F, 0x00, 0xF8, 0x0F, 0x00, 0xF0, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   @ 6
	.byte 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x0C, 0x00, 0x20, 0x0C, 0x00, 0x38, 0x0C, 0x00, 0x3E, 0x0C, 0xC0, 0x3F, 0x0C, 0xF0, 0x07, 0x0C, 0xFC, 0x01, 0x0C, 0x7F, 0x00, 0xCC, 0x1F, 0x00, 0xFC, 0x07, 0x00, 0xFC, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   @ 7
	.byte 0x00, 0x00, 0x00, 0x00, 0xC0, 0x07, 0xE0, 0xE1, 0x0F, 0xF8, 0xF3, 0x1F, 0xF8, 0x3F, 0x1C, 0x1C, 0x0F, 0x38, 0x0C, 0x0E, 0x30, 0x0C, 0x1C, 0x30, 0x0C, 0x1C, 0x30, 0x1C, 0x38, 0x38, 0xF8, 0x3F, 0x1C, 0xF8, 0xF7, 0x1F, 0xE0, 0xE1, 0x0F, 0x00, 0xC0, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   @ 8
	.byte 0x00, 0x00, 0x00, 0xC0, 0x0F, 0x00, 0xF0, 0x1F, 0x00, 0xF8, 0x3F, 0x38, 0x38, 0x78, 0x30, 0x1C, 0x70, 0x30, 0x0C, 0x60, 0x30, 0x0C, 0x60, 0x30, 0x0C, 0x60, 0x18, 0x1C, 0x20, 0x1C, 0x78, 0x30, 0x0F, 0xF8, 0xFF, 0x07, 0xE0, 0xFF, 0x03, 0x80, 0x7F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   @ 9
	


	
