	.include "macro.inc"

	.syntax unified

	thumb_func_start CopyGameSave
CopyGameSave: @ 0x080A065C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	mov sb, r1
	bl GetSaveReadAddr
	adds r6, r0, #0
	mov r0, sb
	bl GetSaveWriteAddr
	mov r8, r0
	ldr r0, _080A06B4 @ =0x03005E70
	ldr r4, _080A06B8 @ =0x02020140
	ldr r5, _080A06BC @ =0x00000D8C
	ldr r3, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl _call_via_r3
	adds r0, r4, #0
	mov r1, r8
	adds r2, r5, #0
	bl WriteAndVerifySramFast
	ldr r0, _080A06C0 @ =0x00011217
	str r0, [sp]
	mov r1, sp
	movs r0, #0
	strb r0, [r1, #6]
	mov r0, sp
	mov r1, sb
	bl WriteSaveBlockInfo
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A06B4: .4byte 0x03005E70
_080A06B8: .4byte 0x02020140
_080A06BC: .4byte 0x00000D8C
_080A06C0: .4byte 0x00011217
