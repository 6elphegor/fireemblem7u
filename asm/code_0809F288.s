	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveNewRankData
SaveNewRankData: @ 0x0809F288
	push {r4, r5, r6, lr}
	sub sp, #0x94
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	mov r0, sp
	bl LoadAndVerfyRankData
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F2BE
	lsls r1, r4, #1
	adds r1, r1, r4
	adds r1, r5, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	mov r2, sp
	adds r1, r2, r0
	adds r0, r6, #0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r0, sp
	bl SaveRankings
_0809F2BE:
	add sp, #0x94
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
