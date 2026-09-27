	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808436C
sub_0808436C: @ 0x0808436C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x48
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08084382
	adds r0, r4, #0
	bl Proc_Break
	b _0808438A
_08084382:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_0808438A:
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _0808439C
	subs r0, r2, #1
	strh r0, [r1]
_0808439C:
	adds r1, r4, #0
	adds r1, #0x58
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
