	.include "macro.inc"

	.syntax unified

	thumb_func_start RemoveFireDragonSpritefx
RemoveFireDragonSpritefx: @ 0x0807E794
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0807E7CC @ =0x08CBFC74
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0807E7C4
	lsls r1, r6, #2
	adds r0, #0x2c
	adds r5, r0, r1
	ldr r0, [r5]
	cmp r0, #0
	beq _0807E7C4
	bl EndSpriteAnimProc
	lsls r1, r6, #1
	adds r0, r4, #0
	adds r0, #0x38
	adds r0, r0, r1
	ldr r1, _0807E7D0 @ =0x0000FFFF
	strh r1, [r0]
	movs r0, #0
	str r0, [r5]
_0807E7C4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807E7CC: .4byte 0x08CBFC74
_0807E7D0: .4byte 0x0000FFFF
