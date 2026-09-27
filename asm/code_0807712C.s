	.include "macro.inc"

	.syntax unified

	thumb_func_start SetScanlineBufWinL
SetScanlineBufWinL: @ 0x0807712C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0
	blt _08077146
	ldr r0, [r7, #8]
	cmp r0, #0x9f
	bgt _08077146
	b _08077148
_08077146:
	b _0807716C
_08077148:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _08077152
	movs r0, #0
	str r0, [r7, #4]
_08077152:
	ldr r0, [r7, #4]
	cmp r0, #0xf0
	ble _0807715C
	movs r0, #0xf0
	str r0, [r7, #4]
_0807715C:
	ldr r1, [r7, #8]
	lsls r0, r1, #1
	ldr r2, [r7]
	adds r1, r0, r2
	adds r0, r1, #1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	strb r2, [r0]
_0807716C:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
