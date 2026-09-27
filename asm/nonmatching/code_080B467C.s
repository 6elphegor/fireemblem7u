	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B467C
sub_080B467C: @ 0x080B467C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x48
	adds r5, r6, #0
	adds r5, #0x47
	ldrb r1, [r4]
	ldrb r2, [r5]
	adds r0, r1, r2
	strb r0, [r4]
	ldr r0, _080B4730 @ =0x02022BA0
	adds r1, r6, #0
	adds r1, #0x46
	ldrb r1, [r1]
	lsls r1, r1, #5
	ldr r3, _080B4734 @ =0xFFFFFEC0
	adds r2, r0, r3
	adds r1, r1, r2
	ldrb r2, [r4]
	bl WmDimPalette
	ldrb r0, [r4]
	cmp r0, #0
	bne _080B46EA
	movs r4, #0
	adds r7, r5, #0
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	movs r5, #0
_080B46BC:
	ldr r1, [r6, #0x34]
	adds r0, r1, #0
	adds r0, #0x30
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _080B46DE
	adds r0, r1, r5
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r8
	bne _080B46DE
	adds r0, r4, #0
	bl sub_080B4ADC
_080B46DE:
	adds r5, #0xc
	adds r4, #1
	cmp r4, #3
	ble _080B46BC
	movs r0, #0
	strb r0, [r7]
_080B46EA:
	adds r0, r6, #0
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #0x20
	bne _080B4724
	adds r7, r6, #0
	adds r7, #0x47
	movs r5, #0x2c
	movs r4, #3
_080B46FC:
	ldr r0, [r6, #0x34]
	adds r1, r0, r5
	ldr r2, [r1, #4]
	cmp r2, #0
	beq _080B4718
	ldrb r3, [r1, #8]
	cmp r3, #1
	bne _080B4718
	movs r0, #0
	strb r0, [r1, #8]
	ldr r0, [r2, #0x58]
	ldrb r1, [r1, #9]
	bl SetMuPal
_080B4718:
	adds r5, #0xc
	subs r4, #1
	cmp r4, #0
	bge _080B46FC
	movs r0, #0
	strb r0, [r7]
_080B4724:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4730: .4byte 0x02022BA0
_080B4734: .4byte 0xFFFFFEC0
