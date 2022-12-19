all:
	arm-none-eabi-as -ahls -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16  -o 1.o 1.s > 1.lst
	arm-none-eabi-ld -v -T n32g430.ld -nostartfiles -o 1.elf 1.o
	arm-none-eabi-objcopy -O binary 1.elf  1.bin


