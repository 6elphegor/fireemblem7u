	.include "macro.inc"

	.syntax unified

	thumb_func_start EraseBonusContentData
EraseBonusContentData: @ 0x0809E6AC
	push {r4, lr}
	sub sp, #4
	ldr r4, _0809E6D0 @ =0x02020140
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0809E6D4 @ =0x01000142
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	adds r0, r4, #0
	bl SaveBonusContentData
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809E6D0: .4byte 0x02020140
_0809E6D4: .4byte 0x01000142
