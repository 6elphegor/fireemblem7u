	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807CEFC
sub_0807CEFC: @ 0x0807CEFC
	ldr r1, _0807CF0C @ =0x0202BBB8
	adds r1, #0x3d
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0807CF0C: .4byte 0x0202BBB8
