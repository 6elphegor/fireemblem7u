	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawPrepMenuDescTexts
DrawPrepMenuDescTexts: @ 0x0808E5C8
	push {r4, r5, r6, lr}
	movs r6, #0
	movs r5, #0xc0
	lsls r5, r5, #1
	ldr r4, _0808E5F4 @ =0x020106B4
_0808E5D2:
	ldr r1, _0808E5F8 @ =0x02023C7C
	adds r1, r5, r1
	adds r0, r4, #0
	bl PutText
	adds r5, #0x80
	adds r4, #8
	adds r6, #1
	cmp r6, #4
	ble _0808E5D2
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E5F4: .4byte 0x020106B4
_0808E5F8: .4byte 0x02023C7C
