EESchema Schematic File Version 4
LIBS:WiFiLEDController_WS2812-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "WiFi WS2812 LED Controller"
Date "2019-03-04"
Rev "1.0"
Comp "fordprfkt@googlemail.com"
Comment1 "Daniel Walter"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 5C7D9D85
P 1500 1400
F 0 "J1" H 1420 1617 50  0000 C CNN
F 1 "Supply" H 1420 1526 50  0000 C CNN
F 2 "TerminalBlock_RND:TerminalBlock_RND_205-00056_1x02_P5.00mm_45Degree" H 1500 1400 50  0001 C CNN
F 3 "~" H 1500 1400 50  0001 C CNN
	1    1500 1400
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J3
U 1 1 5C7D9E5E
P 9600 1400
F 0 "J3" H 9679 1442 50  0000 L CNN
F 1 "LED_Strip" H 9679 1351 50  0000 L CNN
F 2 "TerminalBlock_RND:TerminalBlock_RND_205-00057_1x03_P5.00mm_45Degree" H 9600 1400 50  0001 C CNN
F 3 "~" H 9600 1400 50  0001 C CNN
	1    9600 1400
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM1117-3.3 U1
U 1 1 5C7D9F6C
P 2100 2400
F 0 "U1" H 2100 2642 50  0000 C CNN
F 1 "LM1117-3.3" H 2100 2551 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 2100 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm1117.pdf" H 2100 2400 50  0001 C CNN
	1    2100 2400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0101
U 1 1 5C7DA1BD
P 2050 1250
F 0 "#PWR0101" H 2050 1100 50  0001 C CNN
F 1 "+5V" H 2065 1423 50  0000 C CNN
F 2 "" H 2050 1250 50  0001 C CNN
F 3 "" H 2050 1250 50  0001 C CNN
	1    2050 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0102
U 1 1 5C7DA1EE
P 2600 2300
F 0 "#PWR0102" H 2600 2150 50  0001 C CNN
F 1 "+3V3" H 2615 2473 50  0000 C CNN
F 2 "" H 2600 2300 50  0001 C CNN
F 3 "" H 2600 2300 50  0001 C CNN
	1    2600 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5C7DA226
P 2050 1450
F 0 "#PWR0103" H 2050 1200 50  0001 C CNN
F 1 "GND" H 2055 1277 50  0000 C CNN
F 2 "" H 2050 1450 50  0001 C CNN
F 3 "" H 2050 1450 50  0001 C CNN
	1    2050 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 1300 2050 1300
Wire Wire Line
	2050 1300 2050 1250
Wire Wire Line
	1700 1400 2050 1400
Wire Wire Line
	2050 1400 2050 1450
$Comp
L power:GND #PWR0104
U 1 1 5C7DA3D6
P 2100 2900
F 0 "#PWR0104" H 2100 2650 50  0001 C CNN
F 1 "GND" H 2105 2727 50  0000 C CNN
F 2 "" H 2100 2900 50  0001 C CNN
F 3 "" H 2100 2900 50  0001 C CNN
	1    2100 2900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0105
U 1 1 5C7DA3F1
P 1550 2300
F 0 "#PWR0105" H 1550 2150 50  0001 C CNN
F 1 "+5V" H 1565 2473 50  0000 C CNN
F 2 "" H 1550 2300 50  0001 C CNN
F 3 "" H 1550 2300 50  0001 C CNN
	1    1550 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2900 2100 2800
$Comp
L power:+3V3 #PWR0106
U 1 1 5C7DA58D
P 4250 2350
F 0 "#PWR0106" H 4250 2200 50  0001 C CNN
F 1 "+3V3" H 4265 2523 50  0000 C CNN
F 2 "" H 4250 2350 50  0001 C CNN
F 3 "" H 4250 2350 50  0001 C CNN
	1    4250 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 2600 4250 2350
$Comp
L Device:CP C1
U 1 1 5C7DA66D
P 1550 2600
F 0 "C1" H 1668 2646 50  0000 L CNN
F 1 "10µF" H 1668 2555 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x3.9" H 1588 2450 50  0001 C CNN
F 3 "~" H 1550 2600 50  0001 C CNN
	1    1550 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 5C7DA6BD
P 2600 2600
F 0 "C2" H 2718 2646 50  0000 L CNN
F 1 "10µF" H 2718 2555 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x3.9" H 2638 2450 50  0001 C CNN
F 3 "~" H 2600 2600 50  0001 C CNN
	1    2600 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5C7DA7BF
P 5050 2100
F 0 "C4" H 5165 2146 50  0000 L CNN
F 1 "100nF" H 5165 2055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5088 1950 50  0001 C CNN
F 3 "~" H 5050 2100 50  0001 C CNN
	1    5050 2100
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 5C7DABB1
P 3500 4300
F 0 "SW1" V 3546 4252 50  0000 R CNN
F 1 "SW_Reset" V 3455 4252 50  0000 R CNN
F 2 "Button_Switch_SMD:SW_SPST_B3S-1000" H 3500 4500 50  0001 C CNN
F 3 "" H 3500 4500 50  0001 C CNN
	1    3500 4300
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR0107
U 1 1 5C7DAF4A
P 4850 1850
F 0 "#PWR0107" H 4850 1700 50  0001 C CNN
F 1 "+3V3" H 4865 2023 50  0000 C CNN
F 2 "" H 4850 1850 50  0001 C CNN
F 3 "" H 4850 1850 50  0001 C CNN
	1    4850 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5C7DAFC3
P 4250 4200
F 0 "#PWR0108" H 4250 3950 50  0001 C CNN
F 1 "GND" H 4255 4027 50  0000 C CNN
F 2 "" H 4250 4200 50  0001 C CNN
F 3 "" H 4250 4200 50  0001 C CNN
	1    4250 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5C7DB00A
P 4850 2350
F 0 "#PWR0109" H 4850 2100 50  0001 C CNN
F 1 "GND" H 4855 2177 50  0000 C CNN
F 2 "" H 4850 2350 50  0001 C CNN
F 3 "" H 4850 2350 50  0001 C CNN
	1    4850 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 2250 4650 2300
Wire Wire Line
	4650 2300 4850 2300
Wire Wire Line
	4850 2300 4850 2350
Wire Wire Line
	4850 2300 5050 2300
Wire Wire Line
	5050 2300 5050 2250
Connection ~ 4850 2300
Wire Wire Line
	4650 1950 4650 1900
Wire Wire Line
	4650 1900 4850 1900
Wire Wire Line
	4850 1900 4850 1850
Wire Wire Line
	4850 1900 5050 1900
Wire Wire Line
	5050 1900 5050 1950
Connection ~ 4850 1900
Wire Wire Line
	4250 4200 4250 4100
$Comp
L power:+3V3 #PWR0110
U 1 1 5C7DC8E0
P 3500 2300
F 0 "#PWR0110" H 3500 2150 50  0001 C CNN
F 1 "+3V3" H 3515 2473 50  0000 C CNN
F 2 "" H 3500 2300 50  0001 C CNN
F 3 "" H 3500 2300 50  0001 C CNN
	1    3500 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5C7DC916
P 3500 2600
F 0 "R1" H 3570 2646 50  0000 L CNN
F 1 "10k" H 3570 2555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3430 2600 50  0001 C CNN
F 3 "~" H 3500 2600 50  0001 C CNN
	1    3500 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 2800 3500 2800
Wire Wire Line
	3500 2800 3500 2750
Wire Wire Line
	3500 2450 3500 2350
Wire Wire Line
	3650 3000 3300 3000
Wire Wire Line
	3300 3000 3300 2350
Wire Wire Line
	3300 2350 3500 2350
Connection ~ 3500 2350
Wire Wire Line
	3500 2350 3500 2300
Wire Wire Line
	3500 4100 3500 2800
Connection ~ 3500 2800
$Comp
L power:GND #PWR0111
U 1 1 5C7DDA2A
P 3500 4600
F 0 "#PWR0111" H 3500 4350 50  0001 C CNN
F 1 "GND" H 3505 4427 50  0000 C CNN
F 2 "" H 3500 4600 50  0001 C CNN
F 3 "" H 3500 4600 50  0001 C CNN
	1    3500 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 4600 3500 4500
$Comp
L Switch:SW_Push SW2
U 1 1 5C7DE019
P 5000 4300
F 0 "SW2" V 5046 4252 50  0000 R CNN
F 1 "SW_Flash" V 4955 4252 50  0000 R CNN
F 2 "Button_Switch_SMD:SW_SPST_B3S-1000" H 5000 4500 50  0001 C CNN
F 3 "" H 5000 4500 50  0001 C CNN
	1    5000 4300
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R2
U 1 1 5C7DE06D
P 5000 4750
F 0 "R2" H 5070 4796 50  0000 L CNN
F 1 "4k7" H 5070 4705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4930 4750 50  0001 C CNN
F 3 "~" H 5000 4750 50  0001 C CNN
	1    5000 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 2800 5000 2800
Wire Wire Line
	5000 2800 5000 4100
Wire Wire Line
	5000 4600 5000 4500
$Comp
L power:GND #PWR0112
U 1 1 5C7DEC89
P 5000 5000
F 0 "#PWR0112" H 5000 4750 50  0001 C CNN
F 1 "GND" H 5005 4827 50  0000 C CNN
F 2 "" H 5000 5000 50  0001 C CNN
F 3 "" H 5000 5000 50  0001 C CNN
	1    5000 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 5000 5000 4900
$Comp
L Device:R R3
U 1 1 5C7DF2BD
P 5550 4300
F 0 "R3" H 5620 4346 50  0000 L CNN
F 1 "4k7" H 5620 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5480 4300 50  0001 C CNN
F 3 "~" H 5550 4300 50  0001 C CNN
	1    5550 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3700 5550 3700
Wire Wire Line
	5550 3700 5550 4150
$Comp
L power:GND #PWR0113
U 1 1 5C7DF9A3
P 5550 4550
F 0 "#PWR0113" H 5550 4300 50  0001 C CNN
F 1 "GND" H 5555 4377 50  0000 C CNN
F 2 "" H 5550 4550 50  0001 C CNN
F 3 "" H 5550 4550 50  0001 C CNN
	1    5550 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 4550 5550 4450
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 5C7E00CE
P 6100 3000
F 0 "J2" H 6180 3042 50  0000 L CNN
F 1 "Serial" H 6180 2951 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6100 3000 50  0001 C CNN
F 3 "~" H 6100 3000 50  0001 C CNN
	1    6100 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 2900 5900 2900
Wire Wire Line
	4850 3100 5900 3100
$Comp
L power:GND #PWR0114
U 1 1 5C7E1074
P 5850 3250
F 0 "#PWR0114" H 5850 3000 50  0001 C CNN
F 1 "GND" H 5855 3077 50  0000 C CNN
F 2 "" H 5850 3250 50  0001 C CNN
F 3 "" H 5850 3250 50  0001 C CNN
	1    5850 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 3000 5850 3000
Wire Wire Line
	5850 3000 5850 3250
$Comp
L RF_Module:ESP-07 U2
U 1 1 5C7E223C
P 4250 3400
F 0 "U2" H 4250 4378 50  0000 C CNN
F 1 "ESP-07" H 4250 4287 50  0000 C CNN
F 2 "RF_Module:ESP-07" H 4250 3400 50  0001 C CNN
F 3 "http://wiki.ai-thinker.com/_media/esp8266/esp8266_series_modules_user_manual_v1.1.pdf" H 3900 3500 50  0001 C CNN
	1    4250 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2400 1550 2400
Wire Wire Line
	1550 2400 1550 2450
Wire Wire Line
	1550 2400 1550 2300
Connection ~ 1550 2400
Wire Wire Line
	2400 2400 2600 2400
Wire Wire Line
	2600 2400 2600 2450
Wire Wire Line
	2600 2400 2600 2300
Connection ~ 2600 2400
Wire Wire Line
	1550 2750 1550 2800
Wire Wire Line
	1550 2800 2100 2800
Connection ~ 2100 2800
Wire Wire Line
	2100 2800 2100 2700
Wire Wire Line
	2100 2800 2600 2800
Wire Wire Line
	2600 2800 2600 2750
$Comp
L Transistor_BJT:BC817 Q1
U 1 1 5C7F1296
P 8350 2450
F 0 "Q1" H 8541 2496 50  0000 L CNN
F 1 "BC817" H 8541 2405 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8550 2375 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC817.pdf" H 8350 2450 50  0001 L CNN
	1    8350 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5C7F1540
P 8450 1800
F 0 "R5" H 8520 1846 50  0000 L CNN
F 1 "10k" H 8520 1755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8380 1800 50  0001 C CNN
F 3 "~" H 8450 1800 50  0001 C CNN
	1    8450 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5C7F767A
P 8450 2800
F 0 "#PWR0116" H 8450 2550 50  0001 C CNN
F 1 "GND" H 8455 2627 50  0000 C CNN
F 2 "" H 8450 2800 50  0001 C CNN
F 3 "" H 8450 2800 50  0001 C CNN
	1    8450 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 1650 8450 1300
Connection ~ 8450 1300
Wire Wire Line
	8450 1950 8450 2100
Wire Wire Line
	8450 2100 9300 2100
Wire Wire Line
	9300 2100 9300 1500
Wire Wire Line
	9300 1500 9400 1500
Connection ~ 8450 2100
Wire Wire Line
	8450 2100 8450 2250
Wire Wire Line
	8450 2800 8450 2650
$Comp
L Device:R R4
U 1 1 5C803AD8
P 7900 2450
F 0 "R4" V 7693 2450 50  0000 C CNN
F 1 "10k" V 7784 2450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7830 2450 50  0001 C CNN
F 3 "~" H 7900 2450 50  0001 C CNN
	1    7900 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	8050 2450 8150 2450
Wire Wire Line
	7300 2450 7750 2450
Wire Wire Line
	2050 1300 8450 1300
Connection ~ 2050 1300
Wire Wire Line
	2050 1400 9400 1400
Connection ~ 2050 1400
NoConn ~ 3650 3200
NoConn ~ 4850 3800
NoConn ~ 4850 3400
NoConn ~ 4850 3300
NoConn ~ 4850 3000
$Comp
L Device:LED D1
U 1 1 5C7F2187
P 6000 4300
F 0 "D1" V 6038 4183 50  0000 R CNN
F 1 "LED" V 5947 4183 50  0000 R CNN
F 2 "" H 6000 4300 50  0001 C CNN
F 3 "~" H 6000 4300 50  0001 C CNN
	1    6000 4300
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D2
U 1 1 5C7F231D
P 6350 4300
F 0 "D2" V 6388 4183 50  0000 R CNN
F 1 "LED" V 6297 4183 50  0000 R CNN
F 2 "" H 6350 4300 50  0001 C CNN
F 3 "~" H 6350 4300 50  0001 C CNN
	1    6350 4300
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R6
U 1 1 5C7F2367
P 6000 4750
F 0 "R6" H 6070 4796 50  0000 L CNN
F 1 "4k7" H 6070 4705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5930 4750 50  0001 C CNN
F 3 "~" H 6000 4750 50  0001 C CNN
	1    6000 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5C7F23D5
P 6350 4750
F 0 "R7" H 6420 4796 50  0000 L CNN
F 1 "4k7" H 6420 4705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6280 4750 50  0001 C CNN
F 3 "~" H 6350 4750 50  0001 C CNN
	1    6350 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3600 6000 3600
Wire Wire Line
	6000 3600 6000 4150
Wire Wire Line
	4850 3500 6350 3500
Wire Wire Line
	6350 3500 6350 4150
Wire Wire Line
	6000 4600 6000 4450
Wire Wire Line
	6350 4600 6350 4450
$Comp
L power:GND #PWR0115
U 1 1 5C7F70FE
P 6000 5000
F 0 "#PWR0115" H 6000 4750 50  0001 C CNN
F 1 "GND" H 6005 4827 50  0000 C CNN
F 2 "" H 6000 5000 50  0001 C CNN
F 3 "" H 6000 5000 50  0001 C CNN
	1    6000 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 5C7F7135
P 6350 5000
F 0 "#PWR0117" H 6350 4750 50  0001 C CNN
F 1 "GND" H 6355 4827 50  0000 C CNN
F 2 "" H 6350 5000 50  0001 C CNN
F 3 "" H 6350 5000 50  0001 C CNN
	1    6350 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 5000 6000 4900
Wire Wire Line
	6350 5000 6350 4900
Wire Wire Line
	7300 3200 7300 2450
Wire Wire Line
	4850 3200 7300 3200
$Comp
L Device:C C3
U 1 1 5C7FE613
P 4650 2100
F 0 "C3" H 4765 2146 50  0000 L CNN
F 1 "1µF" H 4765 2055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4688 1950 50  0001 C CNN
F 3 "~" H 4650 2100 50  0001 C CNN
	1    4650 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 1300 9400 1300
$EndSCHEMATC
