	.include "macro.inc"

	.syntax unified

	thumb_func_start InitGoldBoxText
InitGoldBoxText: @ 0x080B1844
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	ldr r1, _080B1874 @ =0x03001618
	adds r0, r1, #0
	movs r1, #1
	bl InitText
	ldr r0, [r7]
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1874: .4byte 0x03001618
