	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806171C
sub_0806171C: @ 0x0806171C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08061738
	ldr r1, _08061734 @ =0x03002870
	ldrh r0, [r1, #0x20]
	adds r0, #0xc
	b _0806173E
	.align 2, 0
_08061734: .4byte 0x03002870
_08061738:
	ldr r1, _0806175C @ =0x03002870
	ldrh r0, [r1, #0x20]
	subs r0, #0xc
_0806173E:
	strh r0, [r1, #0x20]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08061756
	adds r0, r4, #0
	bl Proc_Break
_08061756:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806175C: .4byte 0x03002870
