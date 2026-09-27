	.include "macro.inc"

	.syntax unified

	thumb_func_start DisplayUiHandExt
DisplayUiHandExt: @ 0x0804A174
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	bl GetGameTime
	subs r0, #1
	ldr r6, _0804A1D8 @ =0x0203DCF0
	ldr r1, [r6]
	cmp r0, r1
	bne _0804A19E
	ldr r0, _0804A1DC @ =0x0203DCEC
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r4, r1
	asrs r4, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r5, r0
	asrs r5, r0, #1
_0804A19E:
	ldr r0, _0804A1DC @ =0x0203DCEC
	strh r4, [r0]
	strh r5, [r0, #2]
	bl GetGameTime
	str r0, [r6]
	bl GetGameTime
	adds r3, r4, #0
	subs r3, #0xe
	ldr r2, _0804A1E0 @ =0x08B9A868
	movs r1, #0x1f
	ands r1, r0
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r4, r1, r3
	ldr r3, _0804A1E4 @ =0x08B9A860
	lsls r0, r7, #0xf
	lsrs r0, r0, #0x14
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A1D8: .4byte 0x0203DCF0
_0804A1DC: .4byte 0x0203DCEC
_0804A1E0: .4byte 0x08B9A868
_0804A1E4: .4byte 0x08B9A860
