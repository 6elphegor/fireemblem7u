	.include "macro.inc"

	.syntax unified

	thumb_func_start TalkWaitForInput_OnIdle
TalkWaitForInput_OnIdle: @ 0x08009230
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl GetGameTime
	lsrs r4, r0, #1
	movs r0, #0xf
	ands r4, r0
	movs r0, #0x80
	bl CheckTalkFlag
	cmp r0, #0
	bne _08009270
	adds r0, r5, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r3, _0800926C @ =0x08B90A8C
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #4
	str r0, [sp]
	movs r0, #2
	bl PutSprite
	b _08009290
	.align 2, 0
_0800926C: .4byte 0x08B90A8C
_08009270:
	adds r0, r5, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r3, _080092AC @ =0x08B90A8C
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r0, _080092B0 @ =0x0000B2BF
	str r0, [sp]
	movs r0, #0
	bl PutSprite
_08009290:
	ldr r0, _080092B4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xf3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080092A4
	adds r0, r5, #0
	bl Proc_Break
_080092A4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080092AC: .4byte 0x08B90A8C
_080092B0: .4byte 0x0000B2BF
_080092B4: .4byte 0x08B857F8
