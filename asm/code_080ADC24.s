	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ADC24
sub_080ADC24: @ 0x080ADC24
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	lsls r4, r5, #1
	adds r4, r4, r1
	movs r0, #0x1f
	mov r8, r0
	ands r4, r0
	lsls r4, r4, #5
	ldr r6, _080ADCAC @ =0x08CE58D8
	bl GetOptionMenuLayoutId
	ldr r1, _080ADCB0 @ =0x08CE5868
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	movs r1, #0x2c
	ldrb r0, [r0]
	muls r0, r1, r0
	adds r0, r0, r6
	adds r0, #0x24
	ldrb r1, [r0]
	adds r2, r1, #0
	mov r5, r8
	ands r2, r5
	lsls r0, r1, #1
	ldr r1, _080ADCB4 @ =0x0000FFC0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r2, r2, r0
	movs r0, #0x80
	lsls r0, r0, #7
	adds r1, r2, r0
	ldr r3, _080ADCB8 @ =0x02023C60
	adds r0, r4, #2
	lsls r0, r0, #1
	adds r0, r0, r3
	strh r1, [r0]
	adds r0, r4, #3
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r5, _080ADCBC @ =0x00004001
	adds r1, r2, r5
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x22
	lsls r0, r0, #1
	adds r0, r0, r3
	adds r5, #0x1f
	adds r1, r2, r5
	strh r1, [r0]
	adds r4, #0x23
	lsls r4, r4, #1
	adds r4, r4, r3
	ldr r0, _080ADCC0 @ =0x00004021
	adds r2, r2, r0
	strh r2, [r4]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ADCAC: .4byte 0x08CE58D8
_080ADCB0: .4byte 0x08CE5868
_080ADCB4: .4byte 0x0000FFC0
_080ADCB8: .4byte 0x02023C60
_080ADCBC: .4byte 0x00004001
_080ADCC0: .4byte 0x00004021
