	.include "macro.inc"

	.syntax unified

	thumb_func_start Event3D_ASMC2
Event3D_ASMC2: @ 0x0800D3A0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x30]
	adds r5, r2, #4
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800D3C6
	ldr r1, [r2, #4]
	adds r0, r4, #0
	bl _call_via_r1
	ldr r0, [r4, #0x30]
	adds r0, #4
	cmp r5, r0
	bne _0800D3CA
_0800D3C6:
	movs r0, #0
	b _0800D3CC
_0800D3CA:
	movs r0, #1
_0800D3CC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
