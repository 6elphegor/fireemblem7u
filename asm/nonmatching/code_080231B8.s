	.include "macro.inc"

	.syntax unified

	thumb_func_start ConvoyMenu_HelpBox
ConvoyMenu_HelpBox: @ 0x080231B8
	push {r4, lr}
	adds r4, r1, #0
	adds r4, #0x3c
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #4
	ble _080231E4
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #0x2c
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	ldr r2, _080231E0 @ =0x0202BBB8
	ldrh r2, [r2, #0x2c]
	bl StartItemHelpBox
	movs r0, #0
	b _08023204
	.align 2, 0
_080231E0: .4byte 0x0202BBB8
_080231E4:
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #0x2c
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	ldr r2, _0802320C @ =0x03004690
	ldr r3, [r2]
	movs r2, #0
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r3, #0x1e
	adds r3, r3, r2
	ldrh r2, [r3]
	bl StartItemHelpBox
_08023204:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802320C: .4byte 0x03004690
