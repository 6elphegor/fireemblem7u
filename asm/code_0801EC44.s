	.include "macro.inc"

	.syntax unified

	thumb_func_start GasTrapSpriteAnim_Init
GasTrapSpriteAnim_Init: @ 0x0801EC44
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0
	movs r6, #0
	movs r7, #0
	adds r1, r5, #0
	adds r1, #0x4a
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r1, #1
	beq _0801EC9C
	cmp r1, #1
	bgt _0801EC66
	cmp r1, #0
	beq _0801EC8C
	b _0801ECA0
_0801EC66:
	cmp r1, #2
	beq _0801EC7C
	cmp r1, #3
	bne _0801ECA0
	ldr r0, _0801EC74 @ =0x08196898
	ldr r6, _0801EC78 @ =0x08196380
	b _0801ECA0
	.align 2, 0
_0801EC74: .4byte 0x08196898
_0801EC78: .4byte 0x08196380
_0801EC7C:
	ldr r0, _0801EC84 @ =0x08196898
	ldr r6, _0801EC88 @ =0x08196380
	movs r7, #1
	b _0801ECA0
	.align 2, 0
_0801EC84: .4byte 0x08196898
_0801EC88: .4byte 0x08196380
_0801EC8C:
	ldr r0, _0801EC94 @ =0x08196E80
	ldr r6, _0801EC98 @ =0x08196624
	movs r7, #1
	b _0801ECA0
	.align 2, 0
_0801EC94: .4byte 0x08196E80
_0801EC98: .4byte 0x08196624
_0801EC9C:
	ldr r0, _0801ECF0 @ =0x08196E80
	ldr r6, _0801ECF4 @ =0x08196624
_0801ECA0:
	ldr r1, _0801ECF8 @ =0x06014800
	bl Decompress
	ldr r0, _0801ECFC @ =0x081973F4
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, [r5, #0x2c]
	lsls r4, r4, #4
	ldr r1, _0801ED00 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r1, r3]
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
	str r7, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r4, #0
	bl StartSpriteAnimProc
	adds r4, #8
	movs r0, #0xba
	adds r1, r4, #0
	bl PlaySeSpacial
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801ECF0: .4byte 0x08196E80
_0801ECF4: .4byte 0x08196624
_0801ECF8: .4byte 0x06014800
_0801ECFC: .4byte 0x081973F4
_0801ED00: .4byte 0x0202BBB8
