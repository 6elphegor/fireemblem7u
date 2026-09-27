	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080842F0
sub_080842F0: @ 0x080842F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08084318 @ =0x08CC2B84
	bl Proc_Find
	cmp r0, #0
	beq _08084312
	ldr r0, _0808431C @ =0x08CC2A4C
	bl Proc_Find
	movs r1, #0
	bl Proc_Goto
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_08084312:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08084318: .4byte 0x08CC2B84
_0808431C: .4byte 0x08CC2A4C
