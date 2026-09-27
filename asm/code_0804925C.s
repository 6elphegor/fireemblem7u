	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804925C
sub_0804925C: @ 0x0804925C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r3, _0804927C @ =0x081D578C
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804927C: .4byte 0x081D578C
