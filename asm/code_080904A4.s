	.include "macro.inc"

	.syntax unified

	thumb_func_start PutMenuScrollBarAt
PutMenuScrollBarAt: @ 0x080904A4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080904C0 @ =0x08CC4334
	bl Proc_Find
	cmp r0, #0
	beq _080904BA
	strh r4, [r0, #0x2a]
	adds r0, #0x2c
	strb r5, [r0]
_080904BA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080904C0: .4byte 0x08CC4334
