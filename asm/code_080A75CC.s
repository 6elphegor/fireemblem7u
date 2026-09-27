	.include "macro.inc"

	.syntax unified

	thumb_func_start EndModeSelectAnims
EndModeSelectAnims: @ 0x080A75CC
	push {r4, r5, lr}
	cmp r0, #0
	ble _080A75E4
	ldr r5, _080A75EC @ =0x0201E8D4
	adds r4, r0, #0
_080A75D6:
	adds r0, r5, #0
	bl sub_08054EF0
	adds r5, #0x38
	subs r4, #1
	cmp r4, #0
	bne _080A75D6
_080A75E4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A75EC: .4byte 0x0201E8D4
