	.include "macro.inc"

	.syntax unified

	thumb_func_start ItemMenuHelpBox
ItemMenuHelpBox: @ 0x080237C8
	push {r4, lr}
	adds r3, r1, #0
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _080237E4
	ldr r0, _080237E0 @ =0x0202BBB8
	ldrh r2, [r0, #0x2c]
	b _080237F6
	.align 2, 0
_080237E0: .4byte 0x0202BBB8
_080237E4:
	ldr r0, _0802380C @ =0x03004690
	ldr r1, [r0]
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, #1
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r2, [r1]
_080237F6:
	movs r1, #0x2a
	ldrsh r0, [r3, r1]
	lsls r0, r0, #3
	movs r4, #0x2c
	ldrsh r1, [r3, r4]
	lsls r1, r1, #3
	bl StartItemHelpBox
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802380C: .4byte 0x03004690
