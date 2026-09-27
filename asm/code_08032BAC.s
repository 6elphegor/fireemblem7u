	.include "macro.inc"

	.syntax unified

	thumb_func_start StatusHealEffect_BlendedSprite_Loop
StatusHealEffect_BlendedSprite_Loop: @ 0x08032BAC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08032BFC @ =0x03004690
	ldr r4, [r0]
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r3, _08032C00 @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r0, [r3, r2]
	subs r1, r1, r0
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	lsls r2, r2, #4
	movs r6, #0xe
	ldrsh r0, [r3, r6]
	subs r2, r2, r0
	movs r3, #0xa0
	lsls r3, r3, #6
	str r4, [sp]
	movs r0, #4
	bl PutBlendWindowUnitSprite
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08032BF2
	adds r0, r5, #0
	bl Proc_Break
_08032BF2:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032BFC: .4byte 0x03004690
_08032C00: .4byte 0x0202BBB8
