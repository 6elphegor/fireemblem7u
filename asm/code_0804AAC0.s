	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804AAC0
sub_0804AAC0: @ 0x0804AAC0
	push {lr}
	ldr r0, _0804AADC @ =0x08B9A8A0
	bl Proc_Find
	cmp r0, #0
	beq _0804AAD6
	adds r0, #0x63
	movs r1, #0x40
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
_0804AAD6:
	pop {r0}
	bx r0
	.align 2, 0
_0804AADC: .4byte 0x08B9A8A0
