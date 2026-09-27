	.include "macro.inc"

	.syntax unified

	thumb_func_start DisableSysGrayBox
DisableSysGrayBox: @ 0x080A99E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A9A08 @ =0x08CE4AF8
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A9A02
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	adds r0, r1, r0
	movs r1, #0
	strb r1, [r0]
_080A9A02:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9A08: .4byte 0x08CE4AF8
