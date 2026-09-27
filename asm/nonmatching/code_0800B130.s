	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800B130
sub_0800B130: @ 0x0800B130
	push {r4, lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _0800B174 @ =0x0000FFFB
	ldrh r3, [r1]
	ands r0, r3
	strh r0, [r1]
	ldr r3, _0800B178 @ =0x03004160
	ldrb r0, [r3]
	cmp r0, #0
	beq _0800B16E
	subs r0, #1
	strb r0, [r3]
	movs r0, #0
	str r0, [r2, #0x40]
	ldr r1, _0800B17C @ =0x03004170
	ldrb r4, [r3]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #0x2c]
	ldrb r3, [r3]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #0x30]
	adds r0, r2, #0
	movs r1, #0
	bl Proc_Goto
_0800B16E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B174: .4byte 0x0000FFFB
_0800B178: .4byte 0x03004160
_0800B17C: .4byte 0x03004170
