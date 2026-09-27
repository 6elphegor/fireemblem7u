	.include "macro.inc"

	.syntax unified

	thumb_func_start SetScanlineBufWinR
SetScanlineBufWinR: @ 0x08077174
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0
	blt _0807718E
	ldr r0, [r7, #8]
	cmp r0, #0x9f
	bgt _0807718E
	b _08077190
_0807718E:
	b _080771B2
_08077190:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _0807719A
	movs r0, #0
	str r0, [r7, #4]
_0807719A:
	ldr r0, [r7, #4]
	cmp r0, #0xf0
	ble _080771A4
	movs r0, #0xf0
	str r0, [r7, #4]
_080771A4:
	ldr r1, [r7, #8]
	lsls r0, r1, #1
	ldr r1, [r7]
	adds r0, r0, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	strb r2, [r0]
_080771B2:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
