	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808F690
sub_0808F690: @ 0x0808F690
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _0808F6AC
	adds r0, r5, #0
	bl Proc_Break
_0808F6AC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
