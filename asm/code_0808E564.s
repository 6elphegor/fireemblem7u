	.include "macro.inc"

	.syntax unified

	thumb_func_start ResetPrepMenuDescTexts
ResetPrepMenuDescTexts: @ 0x0808E564
	push {r4, r5, lr}
	ldr r5, _0808E590 @ =0x020106B4
	movs r4, #4
_0808E56A:
	adds r0, r5, #0
	bl ClearText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0808E56A
	ldr r0, _0808E594 @ =0x02023DFC
	movs r1, #0xf
	movs r2, #0xa
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808E590: .4byte 0x020106B4
_0808E594: .4byte 0x02023DFC
