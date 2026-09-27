	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A7B4
sub_0807A7B4: @ 0x0807A7B4
	push {r4, lr}
	bl BoxTalkActive
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _0807A7CA
	ldr r0, _0807A7D4 @ =0x08CA7554
	movs r1, #3
	bl Proc_Start
_0807A7CA:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807A7D4: .4byte 0x08CA7554
