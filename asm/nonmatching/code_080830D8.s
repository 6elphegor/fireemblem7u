	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080830D8
sub_080830D8: @ 0x080830D8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080830E8 @ =0x0000FFFF
	cmp r4, r0
	bne _080830EC
	movs r0, #3
	b _08083122
	.align 2, 0
_080830E8: .4byte 0x0000FFFF
_080830EC:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0808311C
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808310E
	movs r0, #1
	b _08083122
_0808310E:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne _08083120
_0808311C:
	movs r0, #0
	b _08083122
_08083120:
	movs r0, #2
_08083122:
	pop {r4}
	pop {r1}
	bx r1
