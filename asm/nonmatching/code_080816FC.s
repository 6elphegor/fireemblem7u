	.include "macro.inc"

	.syntax unified

	thumb_func_start HelpBoxPopulateStatScreenPInfo
HelpBoxPopulateStatScreenPInfo: @ 0x080816FC
	adds r1, r0, #0
	ldr r0, _08081714 @ =0x0200310C
	ldr r0, [r0, #0xc]
	ldr r0, [r0]
	ldrh r2, [r0, #2]
	cmp r2, #0
	beq _08081718
	adds r0, r1, #0
	adds r0, #0x4c
	strh r2, [r0]
	b _0808171E
	.align 2, 0
_08081714: .4byte 0x0200310C
_08081718:
	adds r1, #0x4c
	ldr r0, _08081720 @ =0x00000396
	strh r0, [r1]
_0808171E:
	bx lr
	.align 2, 0
_08081720: .4byte 0x00000396
