	.include "macro.inc"

	.syntax unified

	thumb_func_start StartHelpBox
StartHelpBox: @ 0x0808190C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08081938 @ =0x0203E674
	movs r3, #0
	str r3, [r0]
	str r3, [r0, #4]
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	strb r4, [r0, #0x10]
	strb r1, [r0, #0x11]
	strh r2, [r0, #0x12]
	str r3, [r0, #0x14]
	str r3, [r0, #0x18]
	ldr r1, _0808193C @ =0x0203E694
	strh r3, [r1]
	strh r3, [r1, #2]
	movs r1, #0
	bl StartHelpBoxExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081938: .4byte 0x0203E674
_0808193C: .4byte 0x0203E694
