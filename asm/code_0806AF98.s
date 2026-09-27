	.include "macro.inc"

	.syntax unified

	thumb_func_start PutBanimBgIMG
PutBanimBgIMG: @ 0x0806AF98
	push {lr}
	lsls r1, r0, #1
	adds r1, r1, r0
	ldr r0, _0806AFB0 @ =0x08BDCA64
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _0806AFB4 @ =0x06008000
	bl LZ77UnCompVram
	pop {r0}
	bx r0
	.align 2, 0
_0806AFB0: .4byte 0x08BDCA64
_0806AFB4: .4byte 0x06008000
