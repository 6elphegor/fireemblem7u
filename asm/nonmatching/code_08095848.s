	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItemUse_PostPromotion
PrepItemUse_PostPromotion: @ 0x08095848
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #0
	bne _08095862
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _08095872
_08095862:
	ldr r0, [r4, #0x30]
	cmp r0, r1
	blt _0809586C
	subs r0, #1
	str r0, [r4, #0x30]
_0809586C:
	adds r0, r4, #0
	bl Proc_Break
_08095872:
	pop {r4}
	pop {r0}
	bx r0
