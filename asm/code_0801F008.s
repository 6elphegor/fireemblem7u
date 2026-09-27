	.include "macro.inc"

	.syntax unified

	thumb_func_start PikeTrapSpriteAnim_Init
PikeTrapSpriteAnim_Init: @ 0x0801F008
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0801F068 @ =0x08198FA4
	ldr r1, _0801F06C @ =0x06014800
	bl Decompress
	ldr r0, _0801F070 @ =0x08199438
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, [r5, #0x2c]
	lsls r4, r4, #4
	ldr r1, _0801F074 @ =0x0202BBB8
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
	ldr r0, _0801F078 @ =0x08199224
	adds r5, #0x4a
	movs r6, #0
	ldrsh r1, [r5, r6]
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	adds r1, r4, #0
	bl StartSpriteAnimProc
	adds r4, #8
	movs r0, #0xbb
	adds r1, r4, #0
	bl PlaySeSpacial
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F068: .4byte 0x08198FA4
_0801F06C: .4byte 0x06014800
_0801F070: .4byte 0x08199438
_0801F074: .4byte 0x0202BBB8
_0801F078: .4byte 0x08199224
