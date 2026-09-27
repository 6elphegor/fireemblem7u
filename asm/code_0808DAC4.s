	.include "macro.inc"

	.syntax unified

	thumb_func_start PutPrepMenuUiImg
PutPrepMenuUiImg: @ 0x0808DAC4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r2, r0, #0
	adds r4, r1, #0
	mov r1, sp
	ldr r0, _0808DB08 @ =0x0840F374
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0808DB0C @ =0x08406528
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r2, r2, r1
	adds r1, r2, #0
	bl Decompress
	ldr r1, _0808DB10 @ =0x0202BBF8
	adds r1, #0x41
	movs r0, #0xc
	ldrb r1, [r1]
	ands r0, r1
	add r0, sp
	ldr r0, [r0]
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808DB08: .4byte 0x0840F374
_0808DB0C: .4byte 0x08406528
_0808DB10: .4byte 0x0202BBF8
