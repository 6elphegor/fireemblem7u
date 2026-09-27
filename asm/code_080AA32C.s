	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AA32C
sub_080AA32C: @ 0x080AA32C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AA34C @ =0x08CE4C50
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	ldr r1, _080AA350 @ =0x0000FFFF
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA34C: .4byte 0x08CE4C50
_080AA350: .4byte 0x0000FFFF
