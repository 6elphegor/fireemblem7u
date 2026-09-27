	.include "macro.inc"

	.syntax unified

	thumb_func_start ParsePrepMenuDescTexts
ParsePrepMenuDescTexts: @ 0x0808E598
	push {r4, lr}
	ldr r4, _0808E5B4 @ =0x020106B4
	bl DecodeMsg
_0808E5A0:
	adds r1, r0, #0
_0808E5A2:
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808E5C0
	cmp r0, #1
	bne _0808E5B8
	adds r4, #8
	adds r1, #1
	b _0808E5A2
	.align 2, 0
_0808E5B4: .4byte 0x020106B4
_0808E5B8:
	adds r0, r4, #0
	bl Text_DrawCharacter
	b _0808E5A0
_0808E5C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
