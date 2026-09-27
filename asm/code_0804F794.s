	.include "macro.inc"

	.syntax unified

	thumb_func_start EndEfxStatusUnits
EndEfxStatusUnits: @ 0x0804F794
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0804F7CC @ =0x0201776C
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _0804F7C6
	adds r0, r4, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	bl Proc_End
	adds r0, r4, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0
	str r1, [r0]
_0804F7C6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804F7CC: .4byte 0x0201776C
