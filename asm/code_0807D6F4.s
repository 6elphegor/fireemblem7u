	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D6F4
sub_0807D6F4: @ 0x0807D6F4
	push {lr}
	ldr r2, _0807D70C @ =0x02022240
	movs r1, #0xff
	strb r1, [r2, #0x1b]
	adds r2, r0, #0
	adds r2, #0x4c
	movs r1, #0xf
	strh r1, [r2]
	bl sub_0807D6B4
	pop {r0}
	bx r0
	.align 2, 0
_0807D70C: .4byte 0x02022240
