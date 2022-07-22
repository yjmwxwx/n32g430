	@n32g430c8l
	@
	@
	@
	@
	.thumb
	.syntax unified
	.equ STACHINIT,		0x20005000	@堆栈顶

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
	.word 0 @_svc_handler + 1
	.word 0 @_debugmon_handler + 1
	.word 0
	.word 0 @_pendsv_handler + 1
	.word 0 @_systick_handler +1
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
	.word aaa +1 @28 _tim2 +1
	.word aaa +1 @29 _tim3 +1
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
	movw r1, # 0x794
	str r1, [r0, # 0x14]


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
	@复用功能高配置寄存器(GPIOx_AFH)
	@af0=0000,af1=0001,af2=0010,af3=0011...................
	@0x24 端口位清除寄存器(GPIOx_PBC)
	@pbcy=1 清除对应的 PODy 位为 0
	@0x28 驱动能力配置寄存器(GPIOx_DS)
	@复位值
	@PA=0X55555555,PB=0X55555555,PC=0X54000000,PD=0X55000001
	@00=2mA,01=8mA,10=4mA,11=12mA
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	ldr r0, = 0x40023400
	ldr r1, = 0xabfffffd
	str r1, [r0]
	
__ting:
	ldr r0, = 0x40023418
	mov r2, # 0x01
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
	b __ting
	
_nmi_handler:	
_hard_fault:	
_memory_fault:	
_bus_fault:	
_usage_fault:
aaa:
	bx lr
