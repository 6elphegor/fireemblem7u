	.include "macro.inc"

	.syntax unified

	thumb_func_start WriteMultiArenaSaveTeam
WriteMultiArenaSaveTeam: @ 0x080A1E2C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x10
	adds r4, r0, #0
	mov r8, r1
	adds r6, r2, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r5, r0, #0
	movs r0, #0xc8
	muls r4, r0, r4
	adds r1, r5, r4
	adds r0, r6, #0
	movs r2, #0xa
	bl WriteAndVerifySramFast
	adds r4, #0x14
	adds r5, r5, r4
	mov r4, r8
	movs r6, #4
_080A1E58:
	adds r0, r4, #0
	adds r1, r5, #0
	bl WriteGameSavePackedUnit
	adds r5, #0x24
	adds r4, #0x48
	subs r6, #1
	cmp r6, #0
	bge _080A1E58
	ldr r0, _080A1E88 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1E88: .4byte 0x00020112
