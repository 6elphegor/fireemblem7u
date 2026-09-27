	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807EE20
sub_0807EE20: @ 0x0807EE20
	ldr r0, _0807EE34 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _0807EE38
	movs r0, #1
	b _0807EE3A
	.align 2, 0
_0807EE34: .4byte 0x08B857F8
_0807EE38:
	movs r0, #0
_0807EE3A:
	bx lr
