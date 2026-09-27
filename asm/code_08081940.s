	.include "macro.inc"

	.syntax unified

	thumb_func_start StartHelpBox_Unk
StartHelpBox_Unk: @ 0x08081940
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r5, r2, #0
	cmp r4, #0
	bge _0808195C
	cmp r3, #0
	bge _0808195C
	bl GetUiHandPrevX
	adds r4, r0, #0
	bl GetUiHandPrevY
	adds r3, r0, #0
_0808195C:
	ldr r0, _08081984 @ =0x0203E674
	movs r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	strb r4, [r0, #0x10]
	strb r3, [r0, #0x11]
	strh r5, [r0, #0x12]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	ldr r2, _08081988 @ =0x0203E694
	strh r1, [r2]
	strh r1, [r2, #2]
	movs r1, #1
	bl StartHelpBoxExt
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081984: .4byte 0x0203E674
_08081988: .4byte 0x0203E694
