	.include "macro.inc"

	.syntax unified

	thumb_func_start FireTrapSpriteAnim_Init
FireTrapSpriteAnim_Init: @ 0x0801ED34
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0801ED80 @ =0x08197CC8
	ldr r1, _0801ED84 @ =0x06014800
	bl Decompress
	ldr r4, [r5, #0x2c]
	lsls r4, r4, #4
	ldr r1, _0801ED88 @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	subs r0, #8
	subs r4, r4, r0
	ldr r2, [r5, #0x30]
	lsls r2, r2, #4
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	subs r0, #8
	subs r2, r2, r0
	movs r3, #0x99
	lsls r3, r3, #6
	ldr r0, _0801ED8C @ =0x08198184
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r4, #0
	bl StartSpriteAnimProc
	adds r4, #8
	movs r0, #0xbf
	adds r1, r4, #0
	bl PlaySeSpacial
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801ED80: .4byte 0x08197CC8
_0801ED84: .4byte 0x06014800
_0801ED88: .4byte 0x0202BBB8
_0801ED8C: .4byte 0x08198184
