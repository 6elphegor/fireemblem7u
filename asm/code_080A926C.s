	.include "macro.inc"

	.syntax unified

	thumb_func_start DisableSysBlackBox
DisableSysBlackBox: @ 0x080A926C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A9288 @ =0x08CE4A80
	bl Proc_Find
	cmp r0, #0
	beq _080A9282
	adds r0, #0x4a
	adds r0, r0, r4
	movs r1, #0
	strb r1, [r0]
_080A9282:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9288: .4byte 0x08CE4A80
