	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803081C
sub_0803081C: @ 0x0803081C
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _08030864 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08030836
	adds r1, r3, #0
	adds r1, #0x4a
	movs r0, #1
	strh r0, [r1]
_08030836:
	adds r0, r3, #0
	adds r0, #0x4a
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r4, [r3, #0x2c]
	ldr r5, [r3, #0x30]
	cmp r0, #0
	beq _08030868
	movs r1, #0xf
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08030868
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _08030868
	adds r0, r3, #0
	movs r1, #2
	bl Proc_Goto
	b _08030890
	.align 2, 0
_08030864: .4byte 0x08B857F8
_08030868:
	ldr r2, [r3, #0x34]
	adds r2, r4, r2
	str r2, [r3, #0x2c]
	ldr r0, [r3, #0x38]
	adds r0, r5, r0
	str r0, [r3, #0x30]
	ldr r1, _08030898 @ =0x0202BBB8
	strh r2, [r1, #0xc]
	strh r0, [r1, #0xe]
	adds r1, r3, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08030890
	adds r0, r3, #0
	bl Proc_Break
_08030890:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030898: .4byte 0x0202BBB8
