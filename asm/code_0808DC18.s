	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepScreenMenu_OnStartPress
PrepScreenMenu_OnStartPress: @ 0x0808DC18
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808DC34
	bl PrepSpecialChar_BlinkButtonStart
	adds r0, r4, #0
	movs r1, #0xb
	bl Proc_Goto
	movs r0, #1
	b _0808DC36
_0808DC34:
	movs r0, #0
_0808DC36:
	pop {r4}
	pop {r1}
	bx r1
