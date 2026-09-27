	.include "macro.inc"

	.syntax unified

	thumb_func_start PutCgBackground
PutCgBackground: @ 0x080B6B6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r7, r1, #0
	adds r4, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x24]
	bl sub_080B6B5C
	adds r6, r0, #0
	ldrb r0, [r6]
	cmp r0, #0
	bne _080B6BAA
	ldr r0, [r6, #4]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r7, r2
	bl Decompress
	lsls r0, r4, #0xc
	mov sb, r0
	lsls r4, r4, #5
	mov sl, r4
	mov r2, r8
	lsls r2, r2, #5
	mov r8, r2
	b _080B6BDA
_080B6BAA:
	movs r5, #0
	lsls r0, r4, #0xc
	mov sb, r0
	lsls r4, r4, #5
	mov sl, r4
	mov r2, r8
	lsls r2, r2, #5
	mov r8, r2
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r4, r7, r0
_080B6BC0:
	ldr r0, [r6, #4]
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r1, r4, #0
	bl Decompress
	movs r2, #0x80
	lsls r2, r2, #4
	adds r4, r4, r2
	adds r5, #1
	cmp r5, #9
	ble _080B6BC0
_080B6BDA:
	ldr r1, [r6, #8]
	lsls r2, r7, #0x11
	lsrs r2, r2, #0x16
	add r2, sb
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, [sp]
	bl TmApplyTsa_thm
	ldr r0, [r6, #0xc]
	mov r1, sl
	mov r2, r8
	bl ApplyPaletteExt
	ldr r0, [sp, #0x24]
	cmp r0, #0x7f
	bgt _080B6C04
	movs r0, #0
	ldr r1, [sp, #0x24]
	bl ModifySaveLinkArenaStruct2B
_080B6C04:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
