	.include "macro.inc"

	.syntax unified

	thumb_func_start Event40_ASMC5
Event40_ASMC5: @ 0x0800D43C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r5, r0, #4
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, [r4, #0x30]
	adds r0, #4
	cmp r5, r0
	beq _0800D45C
	movs r0, #1
	b _0800D466
_0800D45C:
	cmp r1, #0
	bne _0800D464
	movs r0, #0
	b _0800D466
_0800D464:
	movs r0, #3
_0800D466:
	pop {r4, r5}
	pop {r1}
	bx r1
