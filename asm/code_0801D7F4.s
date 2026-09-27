	.include "macro.inc"

	.syntax unified

	thumb_func_start ConvoyMenuProc_MenuEnd
ConvoyMenuProc_MenuEnd: @ 0x0801D7F4
	push {r4, lr}
	adds r4, r0, #0
	bl EndSubtitleHelp
	bl EndMenuItemPanel
	ldr r0, _0801D80C @ =0x0202BBB8
	ldrh r0, [r0, #0x2e]
	cmp r0, #0
	beq _0801D810
	movs r0, #0
	b _0801D81A
	.align 2, 0
_0801D80C: .4byte 0x0202BBB8
_0801D810:
	adds r0, r4, #0
	movs r1, #0x63
	bl Proc_Goto
	movs r0, #1
_0801D81A:
	pop {r4}
	pop {r1}
	bx r1
