	.include "macro.inc"

	.syntax unified

	thumb_func_start StartEventDragonsSpriteDeamon
StartEventDragonsSpriteDeamon: @ 0x0807E640
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E66C @ =0x08CBFC74
	bl Proc_Start
	adds r0, #0x6a
	strb r4, [r0]
	cmp r4, #0
	bne _0807E65A
	ldr r0, _0807E670 @ =0x081BEFE4
	ldr r1, _0807E674 @ =0x06013000
	bl Decompress
_0807E65A:
	cmp r4, #1
	bne _0807E666
	ldr r0, _0807E678 @ =0x081C0DE0
	ldr r1, _0807E674 @ =0x06013000
	bl Decompress
_0807E666:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E66C: .4byte 0x08CBFC74
_0807E670: .4byte 0x081BEFE4
_0807E674: .4byte 0x06013000
_0807E678: .4byte 0x081C0DE0
