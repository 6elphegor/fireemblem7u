	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitBurstMapUiOrientationAt
GetUnitBurstMapUiOrientationAt: @ 0x08085250
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl GetCursorQuadrant
	adds r1, r0, #0
	movs r2, #1
	cmp r4, #5
	ble _08085274
	cmp r4, #0xb
	bgt _08085276
	ldr r0, _0808528C @ =0x08CC2B94
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #5
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _08085276
_08085274:
	movs r2, #4
_08085276:
	cmp r5, #1
	bgt _0808527C
	subs r2, #1
_0808527C:
	cmp r5, #0x16
	ble _08085282
	adds r2, #1
_08085282:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808528C: .4byte 0x08CC2B94
