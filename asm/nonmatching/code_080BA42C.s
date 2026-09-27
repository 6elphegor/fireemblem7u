	.include "macro.inc"

	.syntax unified

	thumb_func_start Title_InitSpriteAnim
Title_InitSpriteAnim: @ 0x080BA42C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	lsls r1, r1, #0x18
	movs r6, #0
	cmp r1, #0
	bne _080BA442
	movs r6, #0x80
	lsls r6, r6, #1
_080BA442:
	ldr r0, _080BA4AC @ =0x0866FCE0
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0xa0
	bl ApplyPaletteExt
	ldr r0, _080BA4B0 @ =0x0866FD80
	ldr r1, _080BA4B4 @ =0x06010000
	bl Decompress
	ldr r5, _080BA4B8 @ =0x08672570
	adds r6, #0x78
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0
	str r0, [sp]
	movs r4, #0xa
	str r4, [sp, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x48
	bl StartSpriteAnimProc
	str r0, [r7, #0x30]
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x4c
	mov r3, r8
	bl StartSpriteAnimProc
	str r0, [r7, #0x34]
	movs r0, #6
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x90
	mov r3, r8
	bl StartSpriteAnimProc
	str r0, [r7, #0x44]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA4AC: .4byte 0x0866FCE0
_080BA4B0: .4byte 0x0866FD80
_080BA4B4: .4byte 0x06010000
_080BA4B8: .4byte 0x08672570
