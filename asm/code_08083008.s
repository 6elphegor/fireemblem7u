	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08083008
sub_08083008: @ 0x08083008
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r4, #0x1f
	movs r0, #0xe0
	ands r4, r0
	adds r0, r6, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	bl sub_080830D8
	cmp r0, #1
	beq _0808302A
	cmp r0, #2
	beq _08083030
	b _08083038
_0808302A:
	movs r4, #0xa0
	adds r5, #0x20
	b _08083038
_08083030:
	cmp r4, #0x5f
	bgt _08083036
	movs r4, #0x60
_08083036:
	adds r5, #0x10
_08083038:
	adds r0, r6, #0
	adds r0, #0x44
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
