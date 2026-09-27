	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A1EF0
sub_080A1EF0: @ 0x080A1EF0
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r1, r0, #0
	ldr r0, _080A1F24 @ =0x000007D4
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0xa0
	bl WriteAndVerifySramFast
	ldr r0, _080A1F28 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1F24: .4byte 0x000007D4
_080A1F28: .4byte 0x00020112
