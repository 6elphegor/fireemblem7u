	.include "macro.inc"

	.syntax unified

	thumb_func_start PutSubtitleHelpText
PutSubtitleHelpText: @ 0x080322DC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	movs r5, #0
_080322E6:
	lsls r4, r5, #5
	adds r0, r6, #0
	adds r0, #0x58
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #0x20
	adds r4, r4, r0
	adds r0, r6, #0
	adds r0, #0x5c
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r5
	adds r1, r6, #0
	adds r1, #0x5e
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl __modsi3
	ldr r1, _08032334 @ =0x08B969A8
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _08032338 @ =0x00004240
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	adds r2, r7, #0
	ldr r3, _0803233C @ =0x08B905F8
	bl PutSprite
	adds r5, #1
	cmp r5, #8
	ble _080322E6
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032334: .4byte 0x08B969A8
_08032338: .4byte 0x00004240
_0803233C: .4byte 0x08B905F8
