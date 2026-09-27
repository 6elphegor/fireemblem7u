	.include "macro.inc"

	.syntax unified

	thumb_func_start DisableSysBrownBox
DisableSysBrownBox: @ 0x080A9C3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A9C5C @ =0x08CE4C18
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A9C56
	lsls r0, r4, #3
	adds r0, r1, r0
	adds r0, #0x2c
	movs r1, #0
	strb r1, [r0]
_080A9C56:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9C5C: .4byte 0x08CE4C18
