	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B6ECC
sub_080B6ECC: @ 0x080B6ECC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	movs r1, #0x40
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #3
	bl Text_SetColor
	ldr r0, _080B6FAC @ =0x000012AB
	mov r1, sp
	bl DecodeMsgInBuffer
	adds r0, r4, #0
	mov r1, sp
	bl Text_DrawString
	adds r0, r4, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r5, #0
	bl CountDigits
	adds r1, r0, #0
	lsls r1, r1, #3
	adds r1, #0x40
	adds r0, r4, #0
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawNumber
	adds r0, r4, #0
	movs r1, #0x68
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #3
	bl Text_SetColor
	ldr r0, _080B6FB0 @ =0x000012AC
	mov r1, sp
	bl DecodeMsgInBuffer
	adds r0, r4, #0
	mov r1, sp
	bl Text_DrawString
	adds r0, r4, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r6, #0
	bl CountDigits
	adds r1, r0, #0
	lsls r1, r1, #3
	adds r1, #0x68
	adds r0, r4, #0
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_DrawNumber
	adds r0, r4, #0
	movs r1, #0x90
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #3
	bl Text_SetColor
	ldr r0, _080B6FB4 @ =0x000012AD
	mov r1, sp
	bl DecodeMsgInBuffer
	adds r0, r4, #0
	mov r1, sp
	bl Text_DrawString
	adds r0, r4, #0
	movs r1, #2
	bl Text_SetColor
	mov r0, r8
	bl CountDigits
	adds r1, r0, #0
	lsls r1, r1, #3
	adds r1, #0x90
	adds r0, r4, #0
	bl Text_SetCursor
	adds r0, r4, #0
	mov r1, r8
	bl Text_DrawNumber
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6FAC: .4byte 0x000012AB
_080B6FB0: .4byte 0x000012AC
_080B6FB4: .4byte 0x000012AD
