	.include "macro.inc"

	.syntax unified

	thumb_func_start Event3E_ASMC3
Event3E_ASMC3: @ 0x0800D3D4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x30]
	adds r5, r2, #4
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800D400
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800D400
	ldr r1, [r2, #4]
	adds r0, r4, #0
	bl _call_via_r1
	ldr r0, [r4, #0x30]
	adds r0, #4
	cmp r5, r0
	bne _0800D404
_0800D400:
	movs r0, #0
	b _0800D406
_0800D404:
	movs r0, #1
_0800D406:
	pop {r4, r5}
	pop {r1}
	bx r1
