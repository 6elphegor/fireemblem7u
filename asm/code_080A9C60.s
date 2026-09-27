	.include "macro.inc"

	.syntax unified

	thumb_func_start SetSysBrownBoxWidth
SetSysBrownBoxWidth: @ 0x080A9C60
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, _080A9C84 @ =0x08CE4C18
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A9C7C
	lsls r0, r4, #3
	adds r0, r1, r0
	adds r0, #0x32
	strb r5, [r0]
_080A9C7C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A9C84: .4byte 0x08CE4C18
