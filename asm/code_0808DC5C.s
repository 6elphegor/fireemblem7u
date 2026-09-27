	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808DC5C
sub_0808DC5C: @ 0x0808DC5C
	push {r4, lr}
	adds r4, r0, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808DC74
	bl CanPrepScreenCheckMap
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808DC80
_0808DC74:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	movs r0, #1
	b _0808DC82
_0808DC80:
	movs r0, #0
_0808DC82:
	pop {r4}
	pop {r1}
	bx r1
