	.include "macro.inc"

	.syntax unified

	thumb_func_start ArrowTrapSpriteAnim_Init
ArrowTrapSpriteAnim_Init: @ 0x0801EEDC
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0801EF34 @ =0x08197434
	ldr r1, _0801EF38 @ =0x06014800
	bl Decompress
	ldr r0, _0801EF3C @ =0x08197414
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, [r5, #0x2c]
	lsls r4, r4, #4
	ldr r0, _0801EF40 @ =0x0202BBB8
	movs r1, #0xc
	ldrsh r0, [r0, r1]
	subs r0, #8
	subs r4, r4, r0
	movs r3, #0x99
	lsls r3, r3, #6
	ldr r0, _0801EF44 @ =0x0819770C
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #0x50
	bl StartSpriteAnimProc
	adds r4, #8
	movs r0, #0xbc
	adds r1, r4, #0
	bl PlaySeSpacial
	ldr r1, [r5, #0x2c]
	adds r0, r5, #0
	movs r2, #0x1f
	bl EnsureCameraOntoPosition
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801EF34: .4byte 0x08197434
_0801EF38: .4byte 0x06014800
_0801EF3C: .4byte 0x08197414
_0801EF40: .4byte 0x0202BBB8
_0801EF44: .4byte 0x0819770C
