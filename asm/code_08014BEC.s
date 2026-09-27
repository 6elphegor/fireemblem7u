	.include "macro.inc"

	.syntax unified

	thumb_func_start VramCopy
VramCopy: @ 0x08014BEC
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r2, #0
	movs r0, #0x1f
	ands r0, r3
	cmp r0, #0
	beq _08014C0A
	lsrs r2, r3, #0x1f
	adds r2, r3, r2
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	adds r0, r4, #0
	bl CpuSet
	b _08014C1C
_08014C0A:
	adds r2, r3, #0
	cmp r2, #0
	bge _08014C12
	adds r2, #3
_08014C12:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r4, #0
	bl CpuFastSet
_08014C1C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
