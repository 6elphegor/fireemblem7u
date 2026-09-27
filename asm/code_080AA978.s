	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSpriteAnimfx
StartSpriteAnimfx: @ 0x080AA978
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r4, [sp, #0x2c]
	ldr r0, [sp, #0x34]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r7, r0, #0
	cmp r5, #0
	beq _080AA9A8
	ldr r1, _080AA9E4 @ =0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _080AA9E8 @ =0x06010000
	adds r1, r1, r0
	adds r0, r5, #0
	bl Decompress
_080AA9A8:
	cmp r6, #0
	beq _080AA9BC
	adds r1, r4, #0
	adds r1, #0x10
	lsls r1, r1, #5
	ldr r2, [sp, #0x30]
	lsls r2, r2, #5
	adds r0, r6, #0
	bl ApplyPaletteExt
_080AA9BC:
	movs r0, #0xf
	ands r4, r0
	lsls r3, r4, #0xc
	adds r3, r3, r7
	ldr r0, [sp, #0x28]
	str r0, [sp]
	ldr r0, [sp, #0x38]
	str r0, [sp, #4]
	mov r0, r8
	mov r1, sb
	ldr r2, [sp, #0x24]
	bl StartSpriteAnimProc
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080AA9E4: .4byte 0x000003FF
_080AA9E8: .4byte 0x06010000
