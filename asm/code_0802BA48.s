	.include "macro.inc"

	.syntax unified

	thumb_func_start InitTraps
InitTraps: @ 0x0802BA48
	push {r4, lr}
	ldr r3, _0802BA68 @ =0x0203A718
	ldr r1, _0802BA6C @ =0x0203A518
	movs r2, #0
	movs r4, #0xfc
	lsls r4, r4, #1
	adds r0, r1, r4
_0802BA56:
	strb r2, [r0, #2]
	subs r0, #8
	cmp r0, r1
	bge _0802BA56
	movs r0, #0
	strb r0, [r3, #2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802BA68: .4byte 0x0203A718
_0802BA6C: .4byte 0x0203A518
