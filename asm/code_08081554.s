	.include "macro.inc"

	.syntax unified

	thumb_func_start HelpBoxPopulateStatScreenItem
HelpBoxPopulateStatScreenItem: @ 0x08081554
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808157C @ =0x0200310C
	ldr r0, [r0, #0xc]
	ldr r1, [r4, #0x2c]
	ldrh r1, [r1, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4e
	strh r0, [r1]
	bl GetItemDescMsg
	adds r4, #0x4c
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808157C: .4byte 0x0200310C
