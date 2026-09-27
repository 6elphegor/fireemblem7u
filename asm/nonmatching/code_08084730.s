	.include "macro.inc"

	.syntax unified

	thumb_func_start GetCursorQuadrant
GetCursorQuadrant: @ 0x08084730
	push {r4, lr}
	ldr r2, _0808475C @ =0x0202BBB8
	movs r0, #0x14
	ldrsh r3, [r2, r0]
	lsls r3, r3, #4
	movs r1, #0xc
	ldrsh r0, [r2, r1]
	subs r0, #8
	subs r3, r3, r0
	movs r4, #0x16
	ldrsh r1, [r2, r4]
	lsls r1, r1, #4
	movs r4, #0xe
	ldrsh r0, [r2, r4]
	subs r0, #8
	subs r1, r1, r0
	cmp r3, #0x68
	bgt _08084760
	cmp r1, #0x50
	bgt _08084768
	movs r0, #0
	b _0808476E
	.align 2, 0
_0808475C: .4byte 0x0202BBB8
_08084760:
	cmp r1, #0x50
	bgt _0808476C
	movs r0, #1
	b _0808476E
_08084768:
	movs r0, #2
	b _0808476E
_0808476C:
	movs r0, #3
_0808476E:
	pop {r4}
	pop {r1}
	bx r1
