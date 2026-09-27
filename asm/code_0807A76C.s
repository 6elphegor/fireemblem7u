	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A76C
sub_0807A76C: @ 0x0807A76C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0807A79A
	bl BoxTalkActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807A7A6
	ldr r0, _0807A7AC @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0807A7A6
_0807A79A:
	ldr r0, _0807A7B0 @ =0x08CA7534
	bl Proc_EndEach
	adds r0, r4, #0
	bl Proc_Break
_0807A7A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A7AC: .4byte 0x08B857F8
_0807A7B0: .4byte 0x08CA7534
