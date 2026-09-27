	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08083444
sub_08083444: @ 0x08083444
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x40
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _0808345E
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl InitBoxDialogue
	b _08083466
_0808345E:
	ldr r0, [r4, #0x3c]
	ldrb r1, [r1]
	bl InitBoxDialogue
_08083466:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	bl DrawBoxDialogueText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
