	.include "macro.inc"

	.syntax unified

	thumb_func_start PutSpecialChar
PutSpecialChar: @ 0x0800615C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	cmp r1, #0xff
	bne _08006174
	movs r1, #0
	strh r1, [r4]
	adds r0, r4, #0
	adds r0, #0x40
	strh r1, [r0]
	b _0800618C
_08006174:
	bl GetSpecialCharChr
	lsls r0, r0, #1
	ldr r1, _08006194 @ =0x02028D70
	ldr r1, [r1]
	ldrh r1, [r1, #0x10]
	adds r0, r1, r0
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x40
	adds r0, #1
	strh r0, [r1]
_0800618C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08006194: .4byte 0x02028D70
