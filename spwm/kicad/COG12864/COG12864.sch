EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A2 23386 16535
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L COG12864-rescue:N32G430C8L7-N32G430C8L7 U1
U 1 1 62DBDE43
P 7950 10800
F 0 "U1" H 7950 12275 50  0000 C CNN
F 1 "N32G430C8L7" H 7950 12184 50  0000 C CNN
F 2 "" H 7900 12200 50  0001 C CNN
F 3 "" H 7900 12200 50  0001 C CNN
	1    7950 10800
	1    0    0    -1  
$EndComp
Text Label 8900 10450 0    50   ~ 0
PB3_SPI1_SCK
Text Label 8900 10250 0    50   ~ 0
PB5_SPI1_MOSI
$Comp
L power:GND #PWR012
U 1 1 62DCEA7D
P 11000 10150
F 0 "#PWR012" H 11000 9900 50  0001 C CNN
F 1 "GND" H 11005 9977 50  0000 C CNN
F 2 "" H 11000 10150 50  0001 C CNN
F 3 "" H 11000 10150 50  0001 C CNN
	1    11000 10150
	1    0    0    -1  
$EndComp
Wire Wire Line
	11000 10150 11150 10150
Wire Wire Line
	11150 10150 11150 10400
Text Label 8900 10550 0    50   ~ 0
PA15_RST
Text Label 8900 10350 0    50   ~ 0
PB4_RS
Text Label 11050 10800 2    50   ~ 0
PB5_SPI1_MOSI
Text Label 11050 10700 2    50   ~ 0
PB3_SPI1_SCK
Wire Wire Line
	11150 10800 10450 10800
Wire Wire Line
	10450 10700 11150 10700
Wire Wire Line
	10450 10600 11150 10600
Wire Wire Line
	10450 10500 11150 10500
Wire Wire Line
	8850 10250 9500 10250
Wire Wire Line
	8850 10450 9500 10450
$Comp
L power:+3.3V #PWR011
U 1 1 62DDA131
P 10550 10900
F 0 "#PWR011" H 10550 10750 50  0001 C CNN
F 1 "+3.3V" V 10565 11028 50  0000 L CNN
F 2 "" H 10550 10900 50  0001 C CNN
F 3 "" H 10550 10900 50  0001 C CNN
	1    10550 10900
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR010
U 1 1 62DDB83C
P 10450 11000
F 0 "#PWR010" H 10450 10750 50  0001 C CNN
F 1 "GND" H 10455 10827 50  0000 C CNN
F 2 "" H 10450 11000 50  0001 C CNN
F 3 "" H 10450 11000 50  0001 C CNN
	1    10450 11000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 62DE04F8
P 11050 11500
F 0 "C6" H 11165 11546 50  0000 L CNN
F 1 "104" H 11165 11455 50  0000 L CNN
F 2 "" H 11088 11350 50  0001 C CNN
F 3 "~" H 11050 11500 50  0001 C CNN
	1    11050 11500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 62DE5171
P 10600 11350
F 0 "C5" H 10485 11304 50  0000 R CNN
F 1 "104" H 10485 11395 50  0000 R CNN
F 2 "" H 10638 11200 50  0001 C CNN
F 3 "~" H 10600 11350 50  0001 C CNN
	1    10600 11350
	-1   0    0    1   
$EndComp
Wire Wire Line
	10600 11500 10900 11500
Wire Wire Line
	10900 11500 10900 11200
Wire Wire Line
	10900 11200 11150 11200
Wire Wire Line
	10600 11200 10600 11100
Wire Wire Line
	10600 11100 11150 11100
Wire Wire Line
	10550 10900 11150 10900
Wire Wire Line
	10450 11000 11150 11000
Wire Wire Line
	11050 11350 11050 11300
Wire Wire Line
	11050 11300 11150 11300
$Comp
L power:GND #PWR013
U 1 1 62DE964B
P 11050 11650
F 0 "#PWR013" H 11050 11400 50  0001 C CNN
F 1 "GND" H 11055 11477 50  0000 C CNN
F 2 "" H 11050 11650 50  0001 C CNN
F 3 "" H 11050 11650 50  0001 C CNN
	1    11050 11650
	1    0    0    -1  
$EndComp
$Comp
L COG12864:COG12864 DS1
U 1 1 62DEE835
P 12000 10750
F 0 "DS1" H 12150 11325 50  0000 C CNN
F 1 "COG12864" H 12150 11234 50  0000 C CNN
F 2 "" H 11900 11200 50  0001 C CNN
F 3 "" H 11900 11200 50  0001 C CNN
	1    12000 10750
	1    0    0    -1  
$EndComp
Text Label 8900 11100 0    50   ~ 0
PA13_SWDIO
Text Label 8900 10650 0    50   ~ 0
PA14_SWCLK
Wire Wire Line
	8850 10650 9500 10650
Wire Wire Line
	8850 11100 9500 11100
Wire Wire Line
	8850 10350 9500 10350
Wire Wire Line
	8850 10550 9500 10550
Text Label 11050 10500 2    50   ~ 0
PA15_RST
Text Label 11050 10600 2    50   ~ 0
PB4_RS
$Comp
L Device:LED D1
U 1 1 62DF821C
P 5650 10500
F 0 "D1" H 5643 10717 50  0000 C CNN
F 1 "LED" H 5643 10626 50  0000 C CNN
F 2 "" H 5650 10500 50  0001 C CNN
F 3 "~" H 5650 10500 50  0001 C CNN
	1    5650 10500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 62DFA6B0
P 5350 10700
F 0 "R1" H 5280 10654 50  0000 R CNN
F 1 "1K" H 5280 10745 50  0000 R CNN
F 2 "" V 5280 10700 50  0001 C CNN
F 3 "~" H 5350 10700 50  0001 C CNN
	1    5350 10700
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 62DFB3B8
P 5350 10850
F 0 "#PWR03" H 5350 10600 50  0001 C CNN
F 1 "GND" H 5355 10677 50  0000 C CNN
F 2 "" H 5350 10850 50  0001 C CNN
F 3 "" H 5350 10850 50  0001 C CNN
	1    5350 10850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR05
U 1 1 62DFCA14
P 6850 9500
F 0 "#PWR05" H 6850 9350 50  0001 C CNN
F 1 "+3.3V" H 6865 9673 50  0000 C CNN
F 2 "" H 6850 9500 50  0001 C CNN
F 3 "" H 6850 9500 50  0001 C CNN
	1    6850 9500
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR09
U 1 1 62DFDBD8
P 8900 9400
F 0 "#PWR09" H 8900 9250 50  0001 C CNN
F 1 "+3.3V" H 8915 9573 50  0000 C CNN
F 2 "" H 8900 9400 50  0001 C CNN
F 3 "" H 8900 9400 50  0001 C CNN
	1    8900 9400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 9500 6850 9550
Wire Wire Line
	6850 9550 7050 9550
Wire Wire Line
	8900 9400 8900 9550
Wire Wire Line
	8900 9550 8850 9550
$Comp
L power:+3.3V #PWR04
U 1 1 62E0243A
P 6650 12000
F 0 "#PWR04" H 6650 11850 50  0001 C CNN
F 1 "+3.3V" V 6665 12128 50  0000 L CNN
F 2 "" H 6650 12000 50  0001 C CNN
F 3 "" H 6650 12000 50  0001 C CNN
	1    6650 12000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6650 12000 7050 12000
$Comp
L power:GND #PWR07
U 1 1 62E0399A
P 7050 11900
F 0 "#PWR07" H 7050 11650 50  0001 C CNN
F 1 "GND" V 7055 11772 50  0000 R CNN
F 2 "" H 7050 11900 50  0001 C CNN
F 3 "" H 7050 11900 50  0001 C CNN
	1    7050 11900
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR08
U 1 1 62E052DA
P 8850 9650
F 0 "#PWR08" H 8850 9400 50  0001 C CNN
F 1 "GND" V 8855 9522 50  0000 R CNN
F 2 "" H 8850 9650 50  0001 C CNN
F 3 "" H 8850 9650 50  0001 C CNN
	1    8850 9650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR06
U 1 1 62E0CA74
P 7050 10250
F 0 "#PWR06" H 7050 10000 50  0001 C CNN
F 1 "GND" V 7055 10122 50  0000 R CNN
F 2 "" H 7050 10250 50  0001 C CNN
F 3 "" H 7050 10250 50  0001 C CNN
	1    7050 10250
	0    1    1    0   
$EndComp
Wire Wire Line
	6250 10450 6250 10500
Wire Wire Line
	6250 10450 7050 10450
$Comp
L power:+3.3V #PWR01
U 1 1 62E0DCA5
P 4350 10350
F 0 "#PWR01" H 4350 10200 50  0001 C CNN
F 1 "+3.3V" H 4365 10523 50  0000 C CNN
F 2 "" H 4350 10350 50  0001 C CNN
F 3 "" H 4350 10350 50  0001 C CNN
	1    4350 10350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 10550 5350 10500
Wire Wire Line
	5350 10500 5500 10500
Wire Wire Line
	6250 10500 5800 10500
Wire Wire Line
	5900 10350 7050 10350
$Comp
L Device:Crystal Y1
U 1 1 62E1F96C
P 5650 9550
F 0 "Y1" V 5604 9681 50  0000 L CNN
F 1 "8MHZ" V 5695 9681 50  0000 L CNN
F 2 "" H 5650 9550 50  0001 C CNN
F 3 "~" H 5650 9550 50  0001 C CNN
	1    5650 9550
	0    1    1    0   
$EndComp
$Comp
L Device:C C4
U 1 1 62E3CE3B
P 5350 9750
F 0 "C4" V 5098 9750 50  0000 C CNN
F 1 "22" V 5189 9750 50  0000 C CNN
F 2 "" H 5388 9600 50  0001 C CNN
F 3 "~" H 5350 9750 50  0001 C CNN
	1    5350 9750
	0    1    1    0   
$EndComp
$Comp
L Device:C C3
U 1 1 62E3D5D6
P 5350 9300
F 0 "C3" V 5098 9300 50  0000 C CNN
F 1 "22" V 5189 9300 50  0000 C CNN
F 2 "" H 5388 9150 50  0001 C CNN
F 3 "~" H 5350 9300 50  0001 C CNN
	1    5350 9300
	0    1    1    0   
$EndComp
$Comp
L Device:C C2
U 1 1 62E3E3F7
P 5100 10000
F 0 "C2" H 5215 10046 50  0000 L CNN
F 1 "104" H 5215 9955 50  0000 L CNN
F 2 "" H 5138 9850 50  0001 C CNN
F 3 "~" H 5100 10000 50  0001 C CNN
	1    5100 10000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 62E3F52B
P 4650 10000
F 0 "C1" H 4765 10046 50  0000 L CNN
F 1 "104" H 4765 9955 50  0000 L CNN
F 2 "" H 4688 9850 50  0001 C CNN
F 3 "~" H 4650 10000 50  0001 C CNN
	1    4650 10000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 9300 5650 9300
Wire Wire Line
	5650 9300 5650 9400
Wire Wire Line
	5500 9750 5650 9750
Wire Wire Line
	5650 9750 5650 9700
Wire Wire Line
	5100 9850 5100 9600
Wire Wire Line
	5100 9300 5200 9300
Wire Wire Line
	5200 9750 5200 9600
Wire Wire Line
	5200 9600 5100 9600
Connection ~ 5100 9600
Wire Wire Line
	5100 9600 5100 9550
Wire Wire Line
	4650 9850 5100 9850
Connection ~ 5100 9850
Wire Wire Line
	5100 10150 7050 10150
Wire Wire Line
	4350 10350 4650 10350
Wire Wire Line
	5500 10350 5500 10200
Wire Wire Line
	5500 10200 5900 10200
Wire Wire Line
	5900 10200 5900 10350
Wire Wire Line
	4650 10150 4650 10350
Connection ~ 4650 10350
Wire Wire Line
	4650 10350 5500 10350
Wire Wire Line
	5650 9750 5650 10050
Wire Wire Line
	5650 10050 7050 10050
Connection ~ 5650 9750
Wire Wire Line
	5650 9300 6150 9300
Wire Wire Line
	6150 9300 6150 9950
Wire Wire Line
	6150 9950 7050 9950
Connection ~ 5650 9300
$Comp
L power:GND #PWR02
U 1 1 62E51659
P 4450 9550
F 0 "#PWR02" H 4450 9300 50  0001 C CNN
F 1 "GND" H 4455 9377 50  0000 C CNN
F 2 "" H 4450 9550 50  0001 C CNN
F 3 "" H 4450 9550 50  0001 C CNN
	1    4450 9550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 9550 5100 9550
Connection ~ 5100 9550
Wire Wire Line
	5100 9550 5100 9300
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 62E497B6
P 2600 2050
F 0 "J1" H 2708 2231 50  0000 C CNN
F 1 "Conn_01x02_Male" H 2708 2140 50  0001 C CNN
F 2 "" H 2600 2050 50  0001 C CNN
F 3 "~" H 2600 2050 50  0001 C CNN
	1    2600 2050
	1    0    0    -1  
$EndComp
Text Label 6350 10900 0    50   ~ 0
ADC0
Wire Wire Line
	8850 11500 9450 11500
Wire Wire Line
	8850 11400 9450 11400
Text Label 8900 11600 0    50   ~ 0
PA8_TIM1_CH1
$Comp
L Device:R R8
U 1 1 62E53A4C
P 5450 2750
F 0 "R8" V 5243 2750 50  0000 C CNN
F 1 "100K" V 5334 2750 50  0000 C CNN
F 2 "" V 5380 2750 50  0001 C CNN
F 3 "~" H 5450 2750 50  0001 C CNN
	1    5450 2750
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 62E58AED
P 4800 2750
F 0 "R6" V 4593 2750 50  0000 C CNN
F 1 "1K" V 4684 2750 50  0000 C CNN
F 2 "" V 4730 2750 50  0001 C CNN
F 3 "~" H 4800 2750 50  0001 C CNN
	1    4800 2750
	0    1    -1   0   
$EndComp
$Comp
L Device:R R7
U 1 1 62E5A1CE
P 4800 3800
F 0 "R7" V 4593 3800 50  0000 C CNN
F 1 "1K" V 4684 3800 50  0000 C CNN
F 2 "" V 4730 3800 50  0001 C CNN
F 3 "~" H 4800 3800 50  0001 C CNN
	1    4800 3800
	0    1    -1   0   
$EndComp
$Comp
L Device:R R9
U 1 1 62E5B508
P 5500 3800
F 0 "R9" V 5293 3800 50  0000 C CNN
F 1 "100K" V 5384 3800 50  0000 C CNN
F 2 "" V 5430 3800 50  0001 C CNN
F 3 "~" H 5500 3800 50  0001 C CNN
	1    5500 3800
	0    1    -1   0   
$EndComp
Wire Wire Line
	5600 2750 5750 2750
Wire Wire Line
	5750 2750 5750 3300
Wire Wire Line
	5300 2750 5150 2750
Wire Wire Line
	5150 3200 5150 2750
Connection ~ 5150 2750
Wire Wire Line
	5150 2750 4950 2750
Wire Wire Line
	5150 3400 5150 3800
Wire Wire Line
	5150 3800 5350 3800
Wire Wire Line
	4950 3800 5150 3800
Connection ~ 5150 3800
Wire Wire Line
	5650 3800 5700 3800
$Comp
L Device:R R4
U 1 1 62E7CF2C
P 3750 2900
F 0 "R4" H 3820 2946 50  0000 L CNN
F 1 "100" H 3820 2855 50  0000 L CNN
F 2 "" V 3680 2900 50  0001 C CNN
F 3 "~" H 3750 2900 50  0001 C CNN
	1    3750 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 62E7E65A
P 3750 3500
F 0 "R5" H 3820 3546 50  0000 L CNN
F 1 "100" H 3820 3455 50  0000 L CNN
F 2 "" V 3680 3500 50  0001 C CNN
F 3 "~" H 3750 3500 50  0001 C CNN
	1    3750 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 3650 3750 3800
Wire Wire Line
	3750 2650 4050 2650
Wire Wire Line
	4050 2650 4050 2750
Wire Wire Line
	2800 2150 2950 2150
Wire Wire Line
	2950 2150 2950 2200
Wire Wire Line
	2800 2050 2950 2050
Wire Wire Line
	2950 2050 2950 1650
Wire Wire Line
	8650 2200 8650 2150
$Comp
L power:GND #PWR019
U 1 1 62F3C1F0
P 5350 5150
F 0 "#PWR019" H 5350 4900 50  0001 C CNN
F 1 "GND" H 5355 4977 50  0000 C CNN
F 2 "" H 5350 5150 50  0001 C CNN
F 3 "" H 5350 5150 50  0001 C CNN
	1    5350 5150
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR018
U 1 1 62F3D129
P 6100 5150
F 0 "#PWR018" H 6100 5000 50  0001 C CNN
F 1 "+3.3V" V 6200 5300 50  0000 C CNN
F 2 "" H 6100 5150 50  0001 C CNN
F 3 "" H 6100 5150 50  0001 C CNN
	1    6100 5150
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NMOS_GDS Q6
U 1 1 62E8AC59
P 15350 5650
F 0 "Q6" H 15555 5650 50  0000 L CNN
F 1 "Q_NMOS_GDS" H 15554 5605 50  0001 L CNN
F 2 "" H 15550 5750 50  0001 C CNN
F 3 "~" H 15350 5650 50  0001 C CNN
	1    15350 5650
	-1   0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDS Q7
U 1 1 62E8CA7D
P 15350 6650
F 0 "Q7" H 15555 6650 50  0000 L CNN
F 1 "Q_NMOS_GDS" H 15554 6605 50  0001 L CNN
F 2 "" H 15550 6750 50  0001 C CNN
F 3 "~" H 15350 6650 50  0001 C CNN
	1    15350 6650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	15250 7350 15250 6850
$Comp
L Device:Q_NMOS_GDS Q4
U 1 1 62EC0916
P 13350 5650
F 0 "Q4" H 13555 5650 50  0000 L CNN
F 1 "Q_NMOS_GDS" H 13554 5605 50  0001 L CNN
F 2 "" H 13550 5750 50  0001 C CNN
F 3 "~" H 13350 5650 50  0001 C CNN
	1    13350 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDS Q5
U 1 1 62EC0920
P 13350 6650
F 0 "Q5" H 13555 6650 50  0000 L CNN
F 1 "Q_NMOS_GDS" H 13554 6605 50  0001 L CNN
F 2 "" H 13550 6750 50  0001 C CNN
F 3 "~" H 13350 6650 50  0001 C CNN
	1    13350 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	13450 7350 13450 6850
Wire Wire Line
	8650 2150 10550 2150
Wire Wire Line
	14100 5850 13450 5850
Wire Wire Line
	14100 2150 14100 5850
Connection ~ 13450 5850
Wire Wire Line
	14550 1650 14550 5850
Wire Wire Line
	14550 5850 15250 5850
Connection ~ 15250 5850
Wire Wire Line
	2950 2200 3750 2200
Text Notes 2000 1900 0    354  ~ 0
~
Text Label 1500 2300 0    354  ~ 71
SIN
Wire Wire Line
	4650 2750 4300 2750
$Comp
L power:GND #PWR014
U 1 1 62E8AF6A
P 4550 3150
F 0 "#PWR014" H 4550 2900 50  0001 C CNN
F 1 "GND" H 4555 2977 50  0000 C CNN
F 2 "" H 4550 3150 50  0001 C CNN
F 3 "" H 4550 3150 50  0001 C CNN
	1    4550 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 10900 7050 10900
$Comp
L Device:R R2
U 1 1 62EC44D1
P 3350 3450
F 0 "R2" H 3420 3496 50  0000 L CNN
F 1 "100K" H 3420 3405 50  0000 L CNN
F 2 "" V 3280 3450 50  0001 C CNN
F 3 "~" H 3350 3450 50  0001 C CNN
	1    3350 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 62EC5F84
P 3750 2500
F 0 "R3" H 3820 2546 50  0000 L CNN
F 1 "100K" H 3820 2455 50  0000 L CNN
F 2 "" V 3680 2500 50  0001 C CNN
F 3 "~" H 3750 2500 50  0001 C CNN
	1    3750 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 2350 3750 2200
Connection ~ 3750 2200
Wire Wire Line
	3350 3300 3350 1650
Wire Wire Line
	2950 1650 3350 1650
Connection ~ 3350 1650
Wire Wire Line
	3350 1650 10700 1650
Wire Wire Line
	3350 3600 3350 3800
Wire Wire Line
	3350 3800 3750 3800
Connection ~ 3750 3800
Wire Wire Line
	3750 3800 4100 3800
Wire Wire Line
	3750 2750 3750 2650
Connection ~ 3750 2650
$Comp
L Diode:1N4148 D4
U 1 1 62F5461C
P 4300 2950
F 0 "D4" V 4254 3030 50  0000 L CNN
F 1 "1N4148" V 3900 2800 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4300 2775 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 4300 2950 50  0001 C CNN
	1    4300 2950
	0    1    1    0   
$EndComp
$Comp
L Diode:1N4148 D2
U 1 1 62F57404
P 4100 2950
F 0 "D2" V 4200 2900 50  0000 R CNN
F 1 "1N4148" V 4400 2900 50  0000 R CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4100 2775 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 4100 2950 50  0001 C CNN
	1    4100 2950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4100 2800 4100 2750
Connection ~ 4100 2750
Wire Wire Line
	4100 2750 4050 2750
Wire Wire Line
	4300 2800 4300 2750
Connection ~ 4300 2750
Wire Wire Line
	4300 2750 4100 2750
$Comp
L Diode:1N4148 D3
U 1 1 62F8A370
P 4100 3450
F 0 "D3" V 3950 3500 50  0000 L CNN
F 1 "1N4148" V 4200 3750 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4100 3275 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 4100 3450 50  0001 C CNN
	1    4100 3450
	0    1    1    0   
$EndComp
$Comp
L Diode:1N4148 D5
U 1 1 62F8CB15
P 4300 3450
F 0 "D5" V 4346 3370 50  0000 R CNN
F 1 "1N4148" V 4100 3350 50  0000 R CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4300 3275 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 4300 3450 50  0001 C CNN
	1    4300 3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4100 3150 4300 3150
Wire Wire Line
	4300 3100 4300 3150
Connection ~ 4300 3150
Wire Wire Line
	4300 3150 4550 3150
Wire Wire Line
	3750 3050 3750 3150
Wire Wire Line
	4100 3100 4100 3150
Connection ~ 4100 3150
Wire Wire Line
	4100 3150 4100 3300
Wire Wire Line
	4300 3300 4300 3150
Wire Wire Line
	3750 3150 4100 3150
Connection ~ 3750 3150
Wire Wire Line
	3750 3150 3750 3350
Wire Wire Line
	4100 3600 4100 3800
Connection ~ 4100 3800
Wire Wire Line
	4100 3800 4300 3800
Wire Wire Line
	4300 3600 4300 3800
Connection ~ 4300 3800
Wire Wire Line
	4300 3800 4650 3800
$Comp
L Device:R R10
U 1 1 62FD4AEA
P 5500 4350
F 0 "R10" V 5293 4350 50  0000 C CNN
F 1 "1K" V 5384 4350 50  0000 C CNN
F 2 "" V 5430 4350 50  0001 C CNN
F 3 "~" H 5500 4350 50  0001 C CNN
	1    5500 4350
	0    1    1    0   
$EndComp
$Comp
L Device:R R28
U 1 1 62FD63FF
P 5900 4350
F 0 "R28" V 5693 4350 50  0000 C CNN
F 1 "1K" V 5784 4350 50  0000 C CNN
F 2 "" V 5830 4350 50  0001 C CNN
F 3 "~" H 5900 4350 50  0001 C CNN
	1    5900 4350
	0    1    1    0   
$EndComp
$Comp
L Device:C C7
U 1 1 62FD78D3
P 5500 4750
F 0 "C7" V 5248 4750 50  0000 C CNN
F 1 "106" V 5339 4750 50  0000 C CNN
F 2 "" H 5538 4600 50  0001 C CNN
F 3 "~" H 5500 4750 50  0001 C CNN
	1    5500 4750
	0    1    1    0   
$EndComp
$Comp
L Device:C C10
U 1 1 62FD8EA6
P 5900 4750
F 0 "C10" V 5648 4750 50  0000 C CNN
F 1 "106" V 5739 4750 50  0000 C CNN
F 2 "" H 5938 4600 50  0001 C CNN
F 3 "~" H 5900 4750 50  0001 C CNN
	1    5900 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	6050 4350 6050 4750
Wire Wire Line
	5650 4350 5700 4350
Wire Wire Line
	5650 4750 5700 4750
Wire Wire Line
	5700 4350 5700 4750
Connection ~ 5700 4350
Wire Wire Line
	5700 4350 5750 4350
Connection ~ 5700 4750
Wire Wire Line
	5700 4750 5750 4750
Wire Wire Line
	5700 3800 5700 4350
Wire Wire Line
	5350 4350 5350 4750
Wire Wire Line
	6000 5350 6050 5350
Wire Wire Line
	6050 5350 6050 5150
Connection ~ 6050 4750
Wire Wire Line
	5400 5350 5350 5350
Connection ~ 5350 4750
$Comp
L Device:C C9
U 1 1 630F5ED6
P 5700 5700
F 0 "C9" V 5448 5700 50  0000 C CNN
F 1 "C" V 5539 5700 50  0000 C CNN
F 2 "" H 5738 5550 50  0001 C CNN
F 3 "~" H 5700 5700 50  0001 C CNN
	1    5700 5700
	0    1    1    0   
$EndComp
Wire Wire Line
	5850 5700 6050 5700
Wire Wire Line
	6050 5700 6050 5350
Connection ~ 6050 5350
Wire Wire Line
	5550 5700 5350 5700
Wire Wire Line
	5350 5700 5350 5350
Connection ~ 5350 5350
Wire Wire Line
	6100 5150 6050 5150
Connection ~ 6050 5150
Wire Wire Line
	6050 5150 6050 4750
Text Label 5950 3300 0    50   ~ 0
ADC0
Wire Wire Line
	5750 3300 6150 3300
Text Label 8900 11500 0    50   ~ 0
PA9_TIM1_CH2
Wire Wire Line
	8850 11600 9450 11600
$Comp
L Driver_FET:IR2103 U3
U 1 1 62FCFCF6
P 11450 6100
F 0 "U3" H 11450 6781 50  0000 C CNN
F 1 "EG2131" H 11450 6690 50  0000 C CNN
F 2 "" H 11450 6100 50  0001 C CIN
F 3 "" H 11450 6100 50  0001 C CNN
	1    11450 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	13450 5850 13450 6300
Wire Wire Line
	15250 5850 15250 6300
Wire Wire Line
	11750 6300 12200 6300
Connection ~ 13450 6300
Wire Wire Line
	13450 6300 13450 6450
$Comp
L Device:R R12
U 1 1 6301D361
P 12600 6650
F 0 "R12" V 12393 6650 50  0000 C CNN
F 1 "33" V 12484 6650 50  0000 C CNN
F 2 "" V 12530 6650 50  0001 C CNN
F 3 "~" H 12600 6650 50  0001 C CNN
	1    12600 6650
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 6301EBFC
P 12600 5650
F 0 "R11" V 12393 5650 50  0000 C CNN
F 1 "33" V 12484 5650 50  0000 C CNN
F 2 "" V 12530 5650 50  0001 C CNN
F 3 "~" H 12600 5650 50  0001 C CNN
	1    12600 5650
	0    1    1    0   
$EndComp
$Comp
L Device:D D10
U 1 1 63026CAB
P 11850 5500
F 0 "D10" H 11850 5283 50  0000 C CNN
F 1 "FR107" H 11850 5374 50  0000 C CNN
F 2 "" H 11850 5500 50  0001 C CNN
F 3 "~" H 11850 5500 50  0001 C CNN
	1    11850 5500
	-1   0    0    1   
$EndComp
$Comp
L Device:C C12
U 1 1 630286CE
P 12200 6150
F 0 "C12" H 12315 6196 50  0000 L CNN
F 1 "106" H 12315 6105 50  0000 L CNN
F 2 "" H 12238 6000 50  0001 C CNN
F 3 "~" H 12200 6150 50  0001 C CNN
	1    12200 6150
	1    0    0    -1  
$EndComp
Connection ~ 12200 6300
Wire Wire Line
	12200 6300 13450 6300
Wire Wire Line
	12000 5500 12200 5500
Wire Wire Line
	12200 5500 12200 5800
Wire Wire Line
	11750 5800 12200 5800
Connection ~ 12200 5800
Wire Wire Line
	12200 5800 12200 6000
Wire Wire Line
	11750 5900 12450 5900
Wire Wire Line
	12450 5900 12450 5650
Wire Wire Line
	12750 5650 13150 5650
Wire Wire Line
	11750 6650 11750 6400
Wire Wire Line
	12750 6650 13150 6650
$Comp
L power:GND #PWR017
U 1 1 6305AD28
P 11450 6600
F 0 "#PWR017" H 11450 6350 50  0001 C CNN
F 1 "GND" H 11455 6427 50  0000 C CNN
F 2 "" H 11450 6600 50  0001 C CNN
F 3 "" H 11450 6600 50  0001 C CNN
	1    11450 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 6305BD1B
P 10900 5750
F 0 "#PWR016" H 10900 5500 50  0001 C CNN
F 1 "GND" H 10905 5577 50  0000 C CNN
F 2 "" H 10900 5750 50  0001 C CNN
F 3 "" H 10900 5750 50  0001 C CNN
	1    10900 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 6305CA5A
P 10900 5600
F 0 "C11" H 11015 5646 50  0000 L CNN
F 1 "104" H 11015 5555 50  0000 L CNN
F 2 "" H 10938 5450 50  0001 C CNN
F 3 "~" H 10900 5600 50  0001 C CNN
	1    10900 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	11450 5600 11300 5600
Wire Wire Line
	11300 5600 11300 5450
Wire Wire Line
	11700 5500 11700 5600
Wire Wire Line
	11700 5600 11450 5600
Connection ~ 11450 5600
$Comp
L Diode:1N4007 D8
U 1 1 63070D41
P 10900 2950
F 0 "D8" H 10900 2733 50  0000 C CNN
F 1 "1N4007" H 10900 2824 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 10900 2775 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 10900 2950 50  0001 C CNN
	1    10900 2950
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N4007 D9
U 1 1 630726CE
P 10900 3350
F 0 "D9" H 10900 3133 50  0000 C CNN
F 1 "1N4007" H 10900 3224 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 10900 3175 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 10900 3350 50  0001 C CNN
	1    10900 3350
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N4007 D6
U 1 1 63073872
P 10300 2950
F 0 "D6" H 10300 2733 50  0000 C CNN
F 1 "1N4007" H 10300 2824 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 10300 2775 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 10300 2950 50  0001 C CNN
	1    10300 2950
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N4007 D7
U 1 1 63076BD4
P 10300 3350
F 0 "D7" H 10300 3133 50  0000 C CNN
F 1 "1N4007" H 10300 3224 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 10300 3175 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 10300 3350 50  0001 C CNN
	1    10300 3350
	-1   0    0    1   
$EndComp
Wire Wire Line
	10450 2950 10550 2950
Wire Wire Line
	10450 3350 10700 3350
Wire Wire Line
	10150 2950 10150 3200
Wire Wire Line
	11050 2950 11050 3200
Wire Wire Line
	10550 2150 10550 2950
Connection ~ 10550 2150
Wire Wire Line
	10550 2150 14100 2150
Connection ~ 10550 2950
Wire Wire Line
	10550 2950 10750 2950
Wire Wire Line
	10700 1650 10700 3350
Connection ~ 10700 1650
Wire Wire Line
	10700 1650 14550 1650
Connection ~ 10700 3350
Wire Wire Line
	10700 3350 10750 3350
$Comp
L Device:CP C8
U 1 1 630B89B5
P 10650 3950
F 0 "C8" V 10395 3950 50  0000 C CNN
F 1 "470UF" V 10486 3950 50  0000 C CNN
F 2 "" H 10688 3800 50  0001 C CNN
F 3 "~" H 10650 3950 50  0001 C CNN
	1    10650 3950
	0    1    1    0   
$EndComp
Wire Wire Line
	10800 3950 11150 3950
Wire Wire Line
	11150 3200 11050 3200
Connection ~ 11050 3200
Wire Wire Line
	11050 3200 11050 3350
Wire Wire Line
	10500 3950 10000 3950
Wire Wire Line
	10000 3950 10000 3850
Wire Wire Line
	10000 3200 10150 3200
Connection ~ 10150 3200
Wire Wire Line
	10150 3200 10150 3350
$Comp
L power:GND #PWR015
U 1 1 630CE6CC
P 9850 4050
F 0 "#PWR015" H 9850 3800 50  0001 C CNN
F 1 "GND" H 9855 3877 50  0000 C CNN
F 2 "" H 9850 4050 50  0001 C CNN
F 3 "" H 9850 4050 50  0001 C CNN
	1    9850 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 4050 9850 3850
Wire Wire Line
	9850 3850 10000 3850
Connection ~ 10000 3850
Wire Wire Line
	10000 3850 10000 3200
Wire Wire Line
	13450 5450 14350 5450
Wire Wire Line
	13450 7350 14350 7350
Text Label 11050 6150 2    50   ~ 0
PA8_TIM1_CH1
$Comp
L Driver_FET:IR2103 U4
U 1 1 63122C1D
P 17250 6100
F 0 "U4" H 17250 6781 50  0000 C CNN
F 1 "EG2131" H 17250 6690 50  0000 C CNN
F 2 "" H 17250 6100 50  0001 C CIN
F 3 "" H 17250 6100 50  0001 C CNN
	1    17250 6100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	16950 6300 16500 6300
$Comp
L Device:R R14
U 1 1 6312339A
P 16100 6650
F 0 "R14" V 15893 6650 50  0000 C CNN
F 1 "33" V 15984 6650 50  0000 C CNN
F 2 "" V 16030 6650 50  0001 C CNN
F 3 "~" H 16100 6650 50  0001 C CNN
	1    16100 6650
	0    -1   1    0   
$EndComp
$Comp
L Device:R R13
U 1 1 631233A4
P 16100 5650
F 0 "R13" V 15893 5650 50  0000 C CNN
F 1 "33" V 15984 5650 50  0000 C CNN
F 2 "" V 16030 5650 50  0001 C CNN
F 3 "~" H 16100 5650 50  0001 C CNN
	1    16100 5650
	0    -1   1    0   
$EndComp
$Comp
L Device:D D11
U 1 1 631233AE
P 16850 5500
F 0 "D11" H 16850 5283 50  0000 C CNN
F 1 "FR107" H 16850 5374 50  0000 C CNN
F 2 "" H 16850 5500 50  0001 C CNN
F 3 "~" H 16850 5500 50  0001 C CNN
	1    16850 5500
	1    0    0    1   
$EndComp
$Comp
L Device:C C13
U 1 1 631233B8
P 16500 6150
F 0 "C13" H 16615 6196 50  0000 L CNN
F 1 "106" H 16615 6105 50  0000 L CNN
F 2 "" H 16538 6000 50  0001 C CNN
F 3 "~" H 16500 6150 50  0001 C CNN
	1    16500 6150
	-1   0    0    -1  
$EndComp
Connection ~ 16500 6300
Wire Wire Line
	16500 6300 15250 6300
Wire Wire Line
	16700 5500 16500 5500
Wire Wire Line
	16500 5500 16500 5800
Wire Wire Line
	16950 5800 16500 5800
Connection ~ 16500 5800
Wire Wire Line
	16500 5800 16500 6000
Wire Wire Line
	16950 5900 16250 5900
Wire Wire Line
	16250 5900 16250 5650
Wire Wire Line
	15950 5650 15550 5650
Wire Wire Line
	16250 6650 16950 6650
Wire Wire Line
	16950 6650 16950 6400
Wire Wire Line
	15950 6650 15550 6650
$Comp
L power:GND #PWR021
U 1 1 631233CF
P 17250 6600
F 0 "#PWR021" H 17250 6350 50  0001 C CNN
F 1 "GND" H 17255 6427 50  0000 C CNN
F 2 "" H 17250 6600 50  0001 C CNN
F 3 "" H 17250 6600 50  0001 C CNN
	1    17250 6600
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 631233D9
P 17800 5750
F 0 "#PWR022" H 17800 5500 50  0001 C CNN
F 1 "GND" H 17805 5577 50  0000 C CNN
F 2 "" H 17800 5750 50  0001 C CNN
F 3 "" H 17800 5750 50  0001 C CNN
	1    17800 5750
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 631233E3
P 17800 5600
F 0 "C14" H 17915 5646 50  0000 L CNN
F 1 "104" H 17915 5555 50  0000 L CNN
F 2 "" H 17838 5450 50  0001 C CNN
F 3 "~" H 17800 5600 50  0001 C CNN
	1    17800 5600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	17250 5600 17400 5600
Wire Wire Line
	17400 5600 17400 5450
Wire Wire Line
	17400 5450 17450 5450
Wire Wire Line
	17000 5500 17000 5600
Wire Wire Line
	17000 5600 17250 5600
Connection ~ 17250 5600
Wire Wire Line
	17450 5450 17450 3800
Connection ~ 17450 5450
Wire Wire Line
	17450 5450 17800 5450
Wire Wire Line
	17550 6100 18000 6100
Wire Wire Line
	17550 6200 18000 6200
Connection ~ 15250 6300
Wire Wire Line
	15250 6300 15250 6450
$Comp
L power:GND #PWR020
U 1 1 6316A21F
P 14550 7350
F 0 "#PWR020" H 14550 7100 50  0001 C CNN
F 1 "GND" H 14555 7177 50  0000 C CNN
F 2 "" H 14550 7350 50  0001 C CNN
F 3 "" H 14550 7350 50  0001 C CNN
	1    14550 7350
	1    0    0    -1  
$EndComp
Connection ~ 14550 7350
Wire Wire Line
	14550 7350 15250 7350
Wire Wire Line
	3750 2200 8650 2200
Text Label 18000 6100 0    50   ~ 0
PA9_TIM1_CH2
Text Label 18000 6200 0    50   ~ 0
PB14_TIM1_CH2N
Wire Wire Line
	11150 6100 11050 6100
Wire Wire Line
	11050 6100 11050 6200
Wire Wire Line
	11050 6200 11150 6200
Wire Wire Line
	10900 5450 11300 5450
Wire Wire Line
	11150 3200 11150 3950
$Comp
L Regulator_Linear:LM317_TO-220 U6
U 1 1 62FA851E
P 11450 3950
F 0 "U6" H 11450 4192 50  0000 C CNN
F 1 "LM317" H 11450 4101 50  0000 C CNN
F 2 "" H 11450 4200 50  0001 C CIN
F 3 "" H 11450 3950 50  0001 C CNN
	1    11450 3950
	1    0    0    -1  
$EndComp
Connection ~ 11150 3950
$Comp
L Device:R R17
U 1 1 62FAA4DC
P 11850 4100
F 0 "R17" H 11920 4146 50  0000 L CNN
F 1 "100" H 11920 4055 50  0000 L CNN
F 2 "" V 11780 4100 50  0001 C CNN
F 3 "~" H 11850 4100 50  0001 C CNN
	1    11850 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R15
U 1 1 62FAB838
P 11450 4450
F 0 "R15" H 11520 4496 50  0000 L CNN
F 1 "900" H 11520 4405 50  0000 L CNN
F 2 "" V 11380 4450 50  0001 C CNN
F 3 "~" H 11450 4450 50  0001 C CNN
	1    11450 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR023
U 1 1 62FACA5A
P 11600 4600
F 0 "#PWR023" H 11600 4350 50  0001 C CNN
F 1 "GND" H 11605 4427 50  0000 C CNN
F 2 "" H 11600 4600 50  0001 C CNN
F 3 "" H 11600 4600 50  0001 C CNN
	1    11600 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C16
U 1 1 62FAEE23
P 12250 4100
F 0 "C16" H 12368 4146 50  0000 L CNN
F 1 "470UF" H 12368 4055 50  0000 L CNN
F 2 "" H 12288 3950 50  0001 C CNN
F 3 "~" H 12250 4100 50  0001 C CNN
	1    12250 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	11850 4250 11450 4250
Wire Wire Line
	11450 4300 11450 4250
Connection ~ 11450 4250
Wire Wire Line
	12250 4250 12250 4600
Wire Wire Line
	12250 4600 11600 4600
Connection ~ 11600 4600
Wire Wire Line
	11600 4600 11450 4600
Wire Wire Line
	11750 3950 11850 3950
Wire Wire Line
	12750 3950 12750 5100
Wire Wire Line
	12750 5100 10900 5100
Wire Wire Line
	10900 5100 10900 5450
Connection ~ 11850 3950
Wire Wire Line
	11850 3950 12250 3950
Connection ~ 12250 3950
Wire Wire Line
	12250 3950 12750 3950
Connection ~ 10900 5450
Wire Wire Line
	17450 3800 12750 3800
Wire Wire Line
	12750 3800 12750 3950
Connection ~ 12750 3950
$Comp
L COG12864-cache:LMV358 U5
U 1 1 63029AA7
P 5450 3300
F 0 "U5" H 5450 2933 50  0000 C CNN
F 1 "LMV722" H 5450 3024 50  0000 C CNN
F 2 "" H 5450 3300 50  0001 C CNN
F 3 "" H 5450 3300 50  0001 C CNN
	1    5450 3300
	1    0    0    1   
$EndComp
Connection ~ 5750 3300
$Comp
L COG12864-cache:LMV358 U5
U 2 1 63040D47
P 2500 3350
F 0 "U5" H 2500 3717 50  0000 C CNN
F 1 "LMV722" H 2500 3626 50  0000 C CNN
F 2 "" H 2500 3350 50  0001 C CNN
F 3 "" H 2500 3350 50  0001 C CNN
	2    2500 3350
	-1   0    0    -1  
$EndComp
$Comp
L COG12864-cache:LMV358 U5
U 3 1 6306A874
P 5700 5450
F 0 "U5" V 5375 5450 50  0000 C CNN
F 1 "LMV722" V 5466 5450 50  0000 C CNN
F 2 "" H 5700 5450 50  0001 C CNN
F 3 "" H 5700 5450 50  0001 C CNN
	3    5700 5450
	0    1    1    0   
$EndComp
$Comp
L Device:R R16
U 1 1 630829B4
P 3050 2650
F 0 "R16" V 3257 2650 50  0000 C CNN
F 1 "R" V 3166 2650 50  0000 C CNN
F 2 "" V 2980 2650 50  0001 C CNN
F 3 "~" H 3050 2650 50  0001 C CNN
	1    3050 2650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R18
U 1 1 630A335E
P 3100 3800
F 0 "R18" V 2893 3800 50  0000 C CNN
F 1 "R" V 2984 3800 50  0000 C CNN
F 2 "" V 3030 3800 50  0001 C CNN
F 3 "~" H 3100 3800 50  0001 C CNN
	1    3100 3800
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 3800 3350 3800
Connection ~ 3350 3800
Wire Wire Line
	2950 3800 2800 3800
Wire Wire Line
	2800 3800 2800 3450
Wire Wire Line
	2800 3250 2800 2650
Wire Wire Line
	2800 2650 2900 2650
Wire Wire Line
	3200 2650 3750 2650
Text Label 2100 3350 2    50   ~ 0
PB6_TIM4_CH1_guoling
Wire Wire Line
	2200 3350 2100 3350
Text Label 8900 10150 0    50   ~ 0
PB6_TIM4_CH1_guoling
Wire Wire Line
	7050 11200 6950 11200
Wire Wire Line
	11750 6650 12450 6650
$Comp
L Device:CP C15
U 1 1 63178030
P 14350 6300
F 0 "C15" H 14468 6346 50  0000 L CNN
F 1 "470UF" H 14468 6255 50  0000 L CNN
F 2 "" H 14388 6150 50  0001 C CNN
F 3 "~" H 14350 6300 50  0001 C CNN
	1    14350 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	14350 6150 14350 5450
Connection ~ 14350 5450
Wire Wire Line
	14350 5450 15250 5450
Wire Wire Line
	14350 6450 14350 7350
Connection ~ 14350 7350
Wire Wire Line
	14350 7350 14550 7350
Wire Wire Line
	8850 10150 9000 10150
$Comp
L Switch:SW_Push SW1
U 1 1 62FC7418
P 10500 12250
F 0 "SW1" H 10500 12535 50  0000 C CNN
F 1 "SW_Push" H 10500 12444 50  0000 C CNN
F 2 "" H 10500 12450 50  0001 C CNN
F 3 "~" H 10500 12450 50  0001 C CNN
	1    10500 12250
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 62FC8C6B
P 10500 12700
F 0 "SW2" H 10500 12985 50  0000 C CNN
F 1 "SW_Push" H 10500 12894 50  0000 C CNN
F 2 "" H 10500 12900 50  0001 C CNN
F 3 "~" H 10500 12900 50  0001 C CNN
	1    10500 12700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 63014C5F
P 10150 12250
F 0 "R19" V 9943 12250 50  0000 C CNN
F 1 "1K" V 10034 12250 50  0000 C CNN
F 2 "" V 10080 12250 50  0001 C CNN
F 3 "~" H 10150 12250 50  0001 C CNN
	1    10150 12250
	0    1    1    0   
$EndComp
$Comp
L Device:R R20
U 1 1 630169B6
P 10150 12700
F 0 "R20" V 9943 12700 50  0000 C CNN
F 1 "1K" V 10034 12700 50  0000 C CNN
F 2 "" V 10080 12700 50  0001 C CNN
F 3 "~" H 10150 12700 50  0001 C CNN
	1    10150 12700
	0    1    1    0   
$EndComp
Wire Wire Line
	10700 12250 10700 12500
$Comp
L power:GND #PWR024
U 1 1 6304417B
P 10850 12750
F 0 "#PWR024" H 10850 12500 50  0001 C CNN
F 1 "GND" H 10855 12577 50  0000 C CNN
F 2 "" H 10850 12750 50  0001 C CNN
F 3 "" H 10850 12750 50  0001 C CNN
	1    10850 12750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 12750 10850 12500
Wire Wire Line
	10850 12500 10700 12500
Connection ~ 10700 12500
Wire Wire Line
	10700 12500 10700 12700
Wire Wire Line
	9950 12700 10000 12700
Wire Wire Line
	8850 11900 10000 11900
Wire Wire Line
	10000 11900 10000 12250
Wire Wire Line
	8850 12000 9950 12000
Wire Wire Line
	9950 12000 9950 12700
Wire Wire Line
	5350 4750 5350 5150
Connection ~ 5350 5150
Wire Wire Line
	5350 5150 5350 5350
$EndSCHEMATC
