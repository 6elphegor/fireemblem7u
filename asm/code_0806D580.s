	.include "macro.inc"

	.syntax unified

	thumb_func_start GetMuAnimForJid
GetMuAnimForJid: @ 0x0806D580
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r1, r7, #0
	strh r0, [r1]
	ldr r0, _0806D5A0 @ =0x08C9D174
	adds r1, r7, #0
	ldrh r2, [r1]
	subs r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	b _0806D5A4
	.align 2, 0
_0806D5A0: .4byte 0x08C9D174
_0806D5A4:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
