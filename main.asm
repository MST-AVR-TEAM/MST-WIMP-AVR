;
; AVR_Daughter_Board_Test.asm
;
; Created: 1/9/2019 4:44:35 PM
; Author : youngerr
;


; Replace with your application code
start:
    ldi r16,HIGH(RAMEND)
	out SPH,r16
	ldi r16,LOW(RAMEND)
	out SPL,r16
	ldi r16,0x38
	out DDRE,r16
    ldi r16,0x00
	out DDRA,r16
	ldi r16,0xff
	out PORTE,r16
	out PORTD,r16
	out DDRD,r16
	out PORTA,r16
uart_init:
    ; set baud rate to 9600 (16MHz osc)
    ldi r16,0x00 
	sts UBRR2H,r16
	ldi r16,103
	sts UBRR2L,r16
	; enable transmit and receive
	ldi r16,0x18
	sts UCSR2B,r16
	; set to 1 stop bit, 8 data bits and no parity (8-N-1)
	ldi r16,0x06
	sts UCSR2C,r16 
loop:
    in r16,PINA
	mov r20,r16
	sbrs r20,0
	rcall SW1_sound
	sbrs r20,1
	rcall SW2_sound
	sbrs r20,2
	rcall SW3_sound
	sbrs r20,3
	rcall SW4_sound
	sbrs r20,4
	rcall SW6_sound
	sbrs r20,5
	rcall SW7_sound
	sbrs r20,6
	rcall SW8_sound
	sbrs r20,7
	rcall SW9_sound
	in r16,PINE
	mov r20,r16
	sbrc r20,6
	rjmp skip
	rcall SW5_sound
	rcall Send_Text
skip:
    rjmp loop



SW1_sound:
    cbi PORTD,0
    ldi r16,250
SW1_1:
    ldi r17,236
SW1_2:
    ldi r18,2
SW1_3:
    inc r18
	brne SW1_3
    inc r17
	brne SW1_2
	in r21,PORTE
	ldi r22,0x10
	eor r21,r22
	out PORTE,r21
	inc r16
	brne SW1_1
	in r19,PINA
	sbrs r19,0
	rjmp SW1_sound
	sbi PORTD,0
	ret
SW2_sound:
    cbi PORTD,1
    ldi r16,250
SW2_1:
    ldi r17,238
SW2_2:
    ldi r18,5
SW2_3:
    inc r18
	brne SW2_3
    inc r17
	brne SW2_2
	in r21,PORTE
	ldi r22,0x10
	eor r21,r22
	out PORTE,r21
	inc r16
	brne SW2_1
	in r19,PINA
	sbrs r19,1
	rjmp SW2_sound
	sbi PORTD,1
	ret
SW3_sound:
    cbi PORTD,2
    ldi r16,250
SW3_1:
    ldi r17,240
SW3_2:
    ldi r18,4
SW3_3:
    inc r18
	brne SW3_3
    inc r17
	brne SW3_2
	in r21,PORTE
	ldi r22,0x10
	eor r21,r22
	out PORTE,r21
	inc r16
	brne SW3_1
	in r19,PINA
	sbrs r19,2
	rjmp SW3_sound
	sbi PORTD,2
	ret
SW6_sound:
    cbi PORTD,4
    ldi r16,250
SW6_1:
    ldi r17,241
SW6_2:
    ldi r18,2
SW6_3:
    inc r18
	brne SW6_3
    inc r17
	brne SW6_2
	in r21,PORTE
	ldi r22,0x10
	eor r21,r22
	out PORTE,r21
	inc r16
	brne SW6_1
	in r19,PINA
	sbrs r19,4
	rjmp SW6_sound
	sbi PORTD,4
	ret
SW9_sound:
    cbi PORTD,7
    ldi r16,250
SW9_1:
    ldi r17,242
SW9_2:
    ldi r18,14
SW9_3:
    inc r18
	brne SW9_3
    inc r17
	brne SW9_2
	in r21,PORTE
	ldi r22,0x10
	eor r21,r22
	out PORTE,r21
	inc r16
	brne SW9_1
	in r19,PINA
	sbrs r19,7
	rjmp SW9_sound
	sbi PORTD,7
	ret
SW8_sound:
    cbi PORTD,6
    ldi r16,250
SW8_1:
    ldi r17,243
SW8_2:
    ldi r18,24
SW8_3:
    inc r18
	brne SW8_3
    inc r17
	brne SW8_2
	in r21,PORTE
	ldi r22,0x10
	eor r21,r22
	out PORTE,r21
	inc r16
	brne SW8_1
	in r19,PINA
	sbrs r19,6
	rjmp SW8_sound
	sbi PORTD,6
	ret
SW7_sound:
    cbi PORTD,5
    ldi r16,250
SW7_1:
    ldi r17,244
SW7_2:
    ldi r18,32
SW7_3:
    inc r18
	brne SW7_3
    inc r17
	brne SW7_2
	in r21,PORTE
	ldi r22,0x10
	eor r21,r22
	out PORTE,r21
	inc r16
	brne SW7_1
	in r19,PINA
	sbrs r19,5
	rjmp SW7_sound
	sbi PORTD,5
	ret
SW4_sound:
    cbi PORTD,3
    ldi r16,250
SW4_1:
    ldi r17,246
SW4_2:
    ldi r18,30
SW4_3:
    inc r18
	brne SW4_3
    inc r17
	brne SW4_2
	in r21,PORTE
	ldi r22,0x10
	eor r21,r22
	out PORTE,r21
	inc r16
	brne SW4_1
	in r19,PINA
	sbrs r19,3
	rjmp SW4_sound
	sbi PORTD,3
	ret
SW5_sound:
    cbi PORTE,5
    ldi r16,250
SW5_1:
    ldi r17,248
SW5_2:
    ldi r18,4
SW5_3:
    inc r18
	brne SW5_3
    inc r17
	brne SW5_2
	in r21,PORTE
	ldi r22,0x10
	eor r21,r22
	out PORTE,r21
	inc r16
	brne SW5_1
	in r19,PINE
	sbrs r19,6
	rjmp SW5_sound
	sbi PORTE,5
	ret
UART_Transmit:
    lds r16,UCSR2A
	sbrs r16,UDRE
	rjmp UART_Transmit
	sts UDR2,r17
	ret
Send_Text:
	ldi ZH,HIGH(PHRASE<<1)
	ldi ZL,LOW(PHRASE<<1)
next_c:
	lpm r17,Z+
	cpi r17,0
	breq end_t
	rcall UART_Transmit
	rjmp next_c
end_t:
    ret
.ORG 0x0200
PHRASE:
.DB "Test Complete"  
.DB 0                ; NULL termination for the string
