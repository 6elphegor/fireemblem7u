	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803FE24
sub_0803FE24: @ 0x0803FE24
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r0, #0x40
	ldrb r5, [r0]
	ldr r6, _0803FE64 @ =0x02023C60
	adds r3, r2, #0
	adds r3, #0x42
	adds r4, r2, #0
	adds r4, #0x41
	ldrb r1, [r4]
	subs r1, #1
	lsls r0, r1, #3
	adds r0, r2, r0
	adds r0, #0x44
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bne _0803FE74
	ldr r2, _0803FE68 @ =0x081D532A
	lsls r0, r1, #1
	lsls r1, r5, #3
	adds r0, r0, r1
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #6
	adds r0, r0, r6
	ldr r1, _0803FE6C @ =0x081C81C4
	ldr r2, _0803FE70 @ =0x00002060
	bl TmApplyTsa_thm
	b _0803FE9E
	.align 2, 0
_0803FE64: .4byte 0x02023C60
_0803FE68: .4byte 0x081D532A
_0803FE6C: .4byte 0x081C81C4
_0803FE70: .4byte 0x00002060
_0803FE74:
	movs r2, #0
	ldr r7, _0803FEA4 @ =0x081D532A
	adds r3, r4, #0
	lsls r1, r5, #3
	ldr r5, _0803FEA8 @ =0x00001034
	adds r4, r5, #0
_0803FE80:
	ldrb r0, [r3]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r0, r0, r7
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r0, r0, #5
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r4, [r0]
	adds r2, #1
	cmp r2, #0x5f
	ble _0803FE80
_0803FE9E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FEA4: .4byte 0x081D532A
_0803FEA8: .4byte 0x00001034
