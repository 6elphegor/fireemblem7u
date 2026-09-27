	.include "macro.inc"

	.syntax unified

	thumb_func_start PutUiHand
PutUiHand: @ 0x08049F58
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	bl GetGameTime
	subs r0, #1
	ldr r7, _08049FB8 @ =0x0203DCF0
	ldr r1, [r7]
	cmp r0, r1
	bne _08049F80
	ldr r0, _08049FBC @ =0x0203DCEC
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r5, r1
	asrs r5, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r6, r0
	asrs r6, r0, #1
_08049F80:
	ldr r0, _08049FBC @ =0x0203DCEC
	movs r4, #0
	strh r5, [r0]
	strh r6, [r0, #2]
	bl GetGameTime
	str r0, [r7]
	bl GetGameTime
	adds r3, r5, #0
	subs r3, #0xe
	ldr r2, _08049FC0 @ =0x08B9A868
	movs r1, #0x1f
	ands r1, r0
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r5, r1, r3
	ldr r3, _08049FC4 @ =0x08B9A860
	str r4, [sp]
	movs r0, #2
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049FB8: .4byte 0x0203DCF0
_08049FBC: .4byte 0x0203DCEC
_08049FC0: .4byte 0x08B9A868
_08049FC4: .4byte 0x08B9A860
