	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B437C
sub_080B437C: @ 0x080B437C
	push {r4, r5, lr}
	adds r3, r1, #0
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r0, r3, #0
	adds r0, #0x30
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080B43E6
	adds r5, r0, #0
	adds r3, r3, r1
	movs r0, #0x2c
	ldrsh r1, [r3, r0]
	ldr r2, _080B43D4 @ =0x02000000
	movs r4, #4
	ldrsh r0, [r2, r4]
	subs r4, r1, r0
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	movs r3, #6
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	adds r1, r4, #0
	adds r1, #0x1f
	movs r0, #0x97
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080B43DC
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r3, r0
	ble _080B43DC
	cmp r3, #0xbf
	bgt _080B43DC
	ldr r0, _080B43D8 @ =0x000001FF
	ands r4, r0
	str r4, [r5, #0x54]
	movs r0, #0xff
	ands r3, r0
	str r3, [r5, #0x58]
	b _080B43E6
	.align 2, 0
_080B43D4: .4byte 0x02000000
_080B43D8: .4byte 0x000001FF
_080B43DC:
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [r5, #0x54]
	movs r0, #0
	str r0, [r5, #0x58]
_080B43E6:
	pop {r4, r5}
	pop {r0}
	bx r0
