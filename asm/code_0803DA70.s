	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803DA70
sub_0803DA70: @ 0x0803DA70
	push {r4, r5, lr}
	ldr r1, [r0, #0x58]
	adds r1, #1
	str r1, [r0, #0x58]
	movs r4, #0x3f
	adds r3, r4, #0
	ands r3, r1
	cmp r3, #0x1f
	ble _0803DA86
	movs r0, #0x40
	subs r3, r0, r3
_0803DA86:
	cmp r3, #0x10
	ble _0803DA8C
	movs r3, #0x10
_0803DA8C:
	ldr r2, _0803DAC4 @ =0x030028AC
	ldr r0, _0803DAC8 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	ldr r1, _0803DACC @ =0x0000E0FF
	ands r0, r1
	movs r5, #0xd8
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r2]
	adds r0, r4, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0
	strb r3, [r2, #8]
	movs r0, #0x10
	subs r0, r0, r3
	strb r0, [r2, #9]
	strb r1, [r2, #0xa]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803DAC4: .4byte 0x030028AC
_0803DAC8: .4byte 0x0000FFE0
_0803DACC: .4byte 0x0000E0FF
