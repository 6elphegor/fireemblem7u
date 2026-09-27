	.include "macro.inc"

	.syntax unified

	thumb_func_start ModeSelectSpriteDraw_Init
ModeSelectSpriteDraw_Init: @ 0x080A796C
	push {r4, lr}
	mov ip, r0
	movs r1, #0
	str r1, [r0, #0x30]
	movs r2, #0
	strh r1, [r0, #0x3e]
	mov r3, ip
	adds r3, #0x3c
	strb r2, [r3]
	movs r0, #0x78
	mov r4, ip
	str r0, [r4, #0x34]
	movs r0, #0xa0
	str r0, [r4, #0x38]
	str r1, [r4, #0x40]
	str r1, [r4, #0x44]
	strb r2, [r3]
	str r1, [r4, #0x48]
	mov r0, ip
	adds r0, #0x4c
	strb r2, [r0]
	str r1, [r4, #0x2c]
	adds r0, #2
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
