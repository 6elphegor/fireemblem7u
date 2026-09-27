	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080431C0
sub_080431C0: @ 0x080431C0
	push {lr}
	sub sp, #4
	ldr r3, _080431DC @ =0x08B99868
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	movs r2, #4
	bl PutSprite
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080431DC: .4byte 0x08B99868
