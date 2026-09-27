	.include "macro.inc"

	.syntax unified

	thumb_func_start UnpackRaw
UnpackRaw: @ 0x080130F4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetDataSize
	adds r2, r0, #0
	subs r1, r2, #4
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0
	beq _0801311C
	adds r0, r4, #4
	lsrs r2, r1, #0x1f
	adds r2, r1, r2
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	adds r1, r5, #0
	bl CpuSet
	b _08013132
_0801311C:
	adds r3, r4, #4
	adds r0, r1, #0
	cmp r0, #0
	bge _08013126
	subs r0, r2, #1
_08013126:
	lsls r2, r0, #9
	lsrs r2, r2, #0xb
	adds r0, r3, #0
	adds r1, r5, #0
	bl CpuFastSet
_08013132:
	pop {r4, r5}
	pop {r0}
	bx r0
