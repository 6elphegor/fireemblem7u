	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807E7D4
sub_0807E7D4: @ 0x0807E7D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E808 @ =0x08CBFC74
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _0807E800
	lsls r0, r4, #2
	adds r1, r2, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _0807E800
	lsls r0, r4, #1
	adds r1, r2, #0
	adds r1, #0x5c
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1]
_0807E800:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E808: .4byte 0x08CBFC74
