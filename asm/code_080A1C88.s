	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A1C88
sub_080A1C88: @ 0x080A1C88
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r1, r0, #0
	movs r0, #0xc8
	muls r0, r4, r0
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #0xa
	bl WriteAndVerifySramFast
	ldr r0, _080A1CC0 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1CC0: .4byte 0x00020112
