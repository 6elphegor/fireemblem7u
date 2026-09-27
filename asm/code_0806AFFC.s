	.include "macro.inc"

	.syntax unified

	thumb_func_start PutBanimBgPAL
PutBanimBgPAL: @ 0x0806AFFC
	push {lr}
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #2
	ldr r0, _0806B018 @ =0x08BDCA64
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _0806B01C @ =0x02022920
	bl LZ77UnCompWram
	pop {r0}
	bx r0
	.align 2, 0
_0806B018: .4byte 0x08BDCA64
_0806B01C: .4byte 0x02022920
