	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BBC5C
sub_080BBC5C: @ 0x080BBC5C
	push {lr}
	sub sp, #8
	ldr r0, _080BBC7C @ =0x086740B4
	movs r3, #0xe6
	lsls r3, r3, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0xa
	str r1, [sp, #4]
	movs r1, #0x78
	movs r2, #0x50
	bl StartSpriteAnimProc
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_080BBC7C: .4byte 0x086740B4
