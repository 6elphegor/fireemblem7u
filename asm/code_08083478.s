	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08083478
sub_08083478: @ 0x08083478
	push {r4, lr}
	adds r4, r0, #0
	bl GetDialogueBoxConfig
	movs r1, #0x82
	ands r1, r0
	cmp r1, #0
	bne _0808349E
	ldr r0, _080834A4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xa
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808349E
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_0808349E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080834A4: .4byte 0x08B857F8
