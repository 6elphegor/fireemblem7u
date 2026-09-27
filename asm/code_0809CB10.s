	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809CB10
sub_0809CB10: @ 0x0809CB10
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
_0809CB18:
	cmp r5, #0
	blt _0809CB84
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	bgt _0809CB84
	adds r1, r7, #0
	adds r1, #0x40
	adds r1, r1, r5
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809CB80
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl GetSupportScreenPartnerSupportLevel
	cmp r0, #0
	ble _0809CB80
	adds r6, r7, #0
	adds r6, #0x39
	movs r1, #0xe3
	ldrb r0, [r6]
	ands r1, r0
	movs r2, #7
	adds r0, r5, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	strb r1, [r6]
	movs r4, #3
	ands r4, r1
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl GetSupportScreenPartnerSupportLevel
	cmp r4, r0
	blt _0809CB84
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl GetSupportScreenPartnerSupportLevel
	movs r1, #0xfc
	ldrb r2, [r6]
	ands r1, r2
	subs r0, #1
	adds r1, r1, r0
	strb r1, [r6]
	b _0809CB84
_0809CB80:
	adds r5, r5, r4
	b _0809CB18
_0809CB84:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
